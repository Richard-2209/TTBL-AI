#%%
from sqlalchemy import create_engine
import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt
from sklearn.ensemble import RandomForestRegressor
from statsmodels.tsa.api import ExponentialSmoothing, SimpleExpSmoothing, Holt
import os
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score
from getpass import getpass

# Database connection
username = getpass("Enter database username: ")
password = getpass("Enter database password: ")
engine = create_engine(f"mysql+pymysql://{username}:{password}@localhost:3306/Table_Tennis")

# Load and execute SQL file
try:
    with open("Table_Tennis.sql", "r", encoding="utf-8") as file:
        sql_script = file.read()
        with engine.connect() as connection:
            for statement in sql_script.split(";"):
                stmt = statement.strip()
                if stmt:
                    connection.execute(stmt)
except Exception as e:
    print(f"Error loading or executing the SQL script: {e}")

# Load data
df = pd.read_sql("SELECT * FROM SeasonResults", engine)
teams_df = pd.read_sql("SELECT * FROM Teams", engine)

# Add team names
df = df.merge(teams_df, left_on="team_id", right_on="id", suffixes=("", "_team"))
df['team_name'] = df['name']
df['season_id'] = df['season'].map({
    '2018/19': 1, '2019/20': 2, '2020/21': 3, '2021/22': 4,
    '2022/23': 5, '2023/24': 6, '2024/25': 7
})
df = df.dropna(subset=['season_id'])
df = df.sort_values(by='season_id')

# Plot only team IDs < 11
filtered_df = df[df['team_id'] < 11]

# Subplots: Actual positions + trend lines
fig, axes = plt.subplots(2, 1, figsize=(12, 16))

# Actual positions
for team_name in filtered_df['team_name'].unique():
    team_data = filtered_df[filtered_df['team_name'] == team_name]
    axes[0].plot(team_data['season_id'], team_data['position'], label=team_name)

axes[0].set_title("Actual Positions")
axes[0].set_ylabel("Ranking")
axes[0].invert_yaxis()
axes[0].grid(True)
axes[0].legend(loc='upper left', bbox_to_anchor=(1, 1))

# Linear trends
for team_name in filtered_df['team_name'].unique():
    team_data = filtered_df[filtered_df['team_name'] == team_name].dropna(subset=['season_id', 'position'])
    team_data = team_data.sort_values(by='season_id')
    if len(team_data) > 2:  # Ensure there are enough data points for a moving average
        team_data['moving_avg'] = team_data['position'].rolling(window=3).mean()
        axes[1].plot(team_data['season_id'], team_data['moving_avg'], linestyle='--', label=f"{team_name} (Moving Avg)")

fit_ = {}  # Initialize fit_ as a dictionary
for team_name in filtered_df['team_name'].unique():
    team_data = filtered_df[filtered_df['team_name'] == team_name]
    valid_positions = team_data['position'].dropna()
    if len(valid_positions) < 10:  # Ensure there are enough data points for heuristic initialization
        print(f"Skipping team {team_name} due to insufficient valid position data.")
        continue
    fit_[team_name] = Holt(valid_positions, initialization_method='heuristic').fit(
        smoothing_level=0.8, smoothing_trend=0.2, optimized=True
    )

for team_name in filtered_df['team_name'].unique():
    if team_name in fit_:
        axes[1].plot(team_data['season_id'], fit_[team_name].fittedvalues, label=team_name, linestyle='--')

axes[1].set_title("Moving Averages")
axes[1].set_ylabel("Ranking")
axes[1].invert_yaxis()
axes[1].grid(True)
axes[1].legend(loc='upper left', bbox_to_anchor=(1, 1))
axes[1].set_xlabel("Season")

plt.tight_layout()
plt.show()

input("Press Enter to continue...")  # Pauses the program until Enter is pressed

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
            })
    return pd.DataFrame(features)

features_df = compute_features(df)

# Training + test data
train_data = features_df[features_df['season'] < '2024/25']
test_data = features_df[features_df['season'] == '2024/25']

X_train = train_data.drop(columns=['season', 'team_id', 'target_position'])
y_train = train_data['target_position']

model = RandomForestRegressor()
model.fit(X_train, y_train)

print("Feature importances:", model.feature_importances_)

# Prediction for 2025/26 (based on 2024/25 data)
prediction_input = test_data.drop(columns=['season', 'team_id', 'target_position'])
y_pred_25_26 = model.predict(prediction_input)

# Prepare results
results_df = test_data[['team_id']].copy()
results_df['predicted_position'] = y_pred_25_26

# Add team names
results_df = results_df.merge(teams_df[['id', 'name']], left_on='team_id', right_on='id', how='left')

# Only unique teams
results_df = results_df.drop_duplicates(subset="team_id", keep="first")
results_df['predicted_position'] = results_df['predicted_position'].round(2)
results_df = results_df.sort_values('predicted_position').reset_index(drop=True)

# Actual values
y_test = test_data['target_position']

# Model evaluation on test data
mae = mean_absolute_error(y_test, y_pred_25_26)
mse = mean_squared_error(y_test, y_pred_25_26)
r2 = r2_score(y_test, y_pred_25_26)

print("\n Model evaluation on test data (2024/25):")
print(f"Mean Absolute Error (MAE): {mae:.2f}")
print(f"Mean Absolute Error (MSE): {mae:.2f}")
print(f"R²-Score: {r2:.2f}")

# Comparison table
comparison_df = test_data[['team_id', 'target_position']].copy()
comparison_df['predicted_position'] = y_pred_25_26
comparison_df = comparison_df.merge(teams_df[['id', 'name']], left_on='team_id', right_on='id', how='left')
comparison_df = comparison_df[['team_id', 'name', 'target_position', 'predicted_position']]
comparison_df.columns = ['team_id', 'team_name', 'actual_position_24_25', 'predicted_position_24_25']
comparison_df['predicted_position_24_25'] = comparison_df['predicted_position_24_25'].round(2)
comparison_df = comparison_df.drop_duplicates(subset='team_id', keep='first')
comparison_df = comparison_df.sort_values(by='actual_position_24_25').reset_index(drop=True)

print("\n Comparison: Prediction vs. Reality (Season 2024/25):")
print(comparison_df)

# -----------------------------
# Additional step: Handle teams with < 3 seasons automatically
# -----------------------------
team_counts = df.groupby("team_id")["season_id"].nunique()
teams_with_few_data = team_counts[team_counts < 3].index.tolist()

# Get last known position (2024/25) for these teams
fallback_preds = df[df['season'] == '2024/25'][['team_id', 'position']]
fallback_preds = fallback_preds[fallback_preds['team_id'].isin(teams_with_few_data)]
fallback_preds = fallback_preds.rename(columns={'position': 'predicted_position'})
fallback_preds = fallback_preds.merge(teams_df[['id', 'name']], left_on='team_id', right_on='id', how='left')
fallback_preds = fallback_preds[['team_id', 'name', 'predicted_position']]
fallback_preds['predicted_position'] = fallback_preds['predicted_position'].round(2)

# Remove these teams from ML prediction
results_df = results_df[~results_df['team_id'].isin(teams_with_few_data)]

# Add fallbacks
final_results = pd.concat([results_df[['team_id', 'name', 'predicted_position']], fallback_preds])

# Cleanup
final_results = final_results.drop_duplicates(subset='team_id', keep='first')
final_results = final_results.sort_values('predicted_position').reset_index(drop=True)

# Final output
print("\n Predicted Table 2025/26 (including fallback for new teams):")
print(final_results)
# %%
