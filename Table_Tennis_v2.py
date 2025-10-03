#%%
from sqlalchemy import create_engine
import pandas as pd
import numpy as np
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score
from getpass import getpass

# Database connection
username = getpass("Enter database username: ")
password = getpass("Enter database password: ")
engine = create_engine(f"mysql+pymysql://{username}:{password}@localhost:3306/Table_Tennis")

# Load data
df = pd.read_sql("SELECT * FROM SeasonResults", engine)
teams_df = pd.read_sql("SELECT * FROM Teams", engine)
players_df = pd.read_sql("SELECT * FROM Players", engine)

# Add team names
df = df.merge(teams_df, left_on="team_id", right_on="id", suffixes=("", "_team"))
df['team_name'] = df['name']
df['season_id'] = df['season'].map({
    '2018/19': 1, '2019/20': 2, '2020/21': 3, '2021/22': 4,
    '2022/23': 5, '2023/24': 6, '2024/25': 7
})
df = df.dropna(subset=['season_id'])
df = df.sort_values(by='season_id')

# Aggregate player data (e.g., average WR, total wins/losses per team and season)
player_features = players_df.groupby(['season_id', 'team_id']).agg({
    'world_ranking': 'mean',  # Durchschnittliche WR-Position
    'wins': 'sum',            # Gesamte Siege
    'losses': 'sum'           # Gesamte Niederlagen
}).reset_index()

# Merge player features with the main dataset
df = df.merge(player_features, on=['season_id', 'team_id'], how='left')

# Ensure required columns exist and fill missing values with 0
required_columns = ['wins', 'losses', 'world_ranking', 'points', 'position']
for col in required_columns:
    if col not in df.columns:
        df[col] = 0

# Feature Engineering
def compute_features(df):
    df = df.sort_values(by=['team_id', 'season_id'])
    features = []
    for team in df['team_id'].unique():
        team_df = df[df['team_id'] == team].sort_values('season_id')
        for i in range(3, len(team_df)):
            row = team_df.iloc[i]
            prev_1, prev_2, prev_3 = team_df.iloc[i-1], team_df.iloc[i-2], team_df.iloc[i-3]
            features.append({
                'season': row['season'],
                'team_id': row['team_id'],
                'target_position': row['position'],
                'prev_position': prev_1['position'],
                'avg_position_last_3': np.mean([prev_1['position'], prev_2['position'], prev_3['position']]),
                'avg_points_last_3': np.mean([prev_1['points'], prev_2['points'], prev_3['points']]),
                'avg_wr_last_3': np.mean([prev_1['world_ranking'], prev_2['world_ranking'], prev_3['world_ranking']]),
                'total_wins_last_3': np.sum([prev_1['wins'], prev_2['wins'], prev_3['wins']]),
                'total_losses_last_3': np.sum([prev_1['losses'], prev_2['losses'], prev_3['losses']]),
            })
    return pd.DataFrame(features)

features_df = compute_features(df)

# Training + test data
train_data = features_df[features_df['season'] < '2024/25']  # Training bis 2023/24
test_data = features_df[features_df['season'] == '2024/25']  # Test für 2024/25

X_train = train_data.drop(columns=['season', 'team_id', 'target_position'])
y_train = train_data['target_position']

model = RandomForestRegressor()
model.fit(X_train, y_train)

print("Feature importances:", model.feature_importances_)

# Prediction for 2024/25
prediction_input = test_data.drop(columns=['season', 'team_id', 'target_position'])
y_pred_24_25 = model.predict(prediction_input)

# Prepare results
results_df = test_data[['team_id']].copy()
results_df['predicted_position'] = y_pred_24_25

# Add team names
results_df = results_df.merge(teams_df[['id', 'name']], left_on='team_id', right_on='id', how='left')

# Only unique teams
results_df = results_df.drop_duplicates(subset="team_id", keep="first")
results_df['predicted_position'] = results_df['predicted_position'].round(2)
results_df = results_df.sort_values('predicted_position').reset_index(drop=True)

# Actual values
y_test = test_data['target_position']

# Model evaluation on test data
mae = mean_absolute_error(y_test, y_pred_24_25)
mse = mean_squared_error(y_test, y_pred_24_25)
r2 = r2_score(y_test, y_pred_24_25)

print("\n Model evaluation on test data (2024/25):")
print(f"Mean Absolute Error (MAE): {mae:.2f}")
print(f"Mean Squared Error (MSE): {mse:.2f}")
print(f"R²-Score: {r2:.2f}")

# Comparison table
comparison_df = test_data[['team_id', 'target_position']].copy()
comparison_df['predicted_position'] = y_pred_24_25
comparison_df = comparison_df.merge(teams_df[['id', 'name']], left_on='team_id', right_on='id', how='left')
comparison_df = comparison_df[['team_id', 'name', 'target_position', 'predicted_position']]
comparison_df.columns = ['team_id', 'team_name', 'actual_position_24_25', 'predicted_position_24_25']
comparison_df['predicted_position_24_25'] = comparison_df['predicted_position_24_25'].round(2)
comparison_df = comparison_df.drop_duplicates(subset='team_id', keep='first')
comparison_df = comparison_df.sort_values(by='actual_position_24_25').reset_index(drop=True)

print("\n Comparison: Prediction vs. Reality (Season 2024/25):")
print(comparison_df)
# %%