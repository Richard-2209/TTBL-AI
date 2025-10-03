import pandas as pd
from getpass import getpass
import mysql.connector

# csv-Datei einlesen
csv_file = "/Users/richardmohling/Desktop/Tryout/TTBL-AI/SeasonResults_data.csv"  # Pfad zur csv-Datei
data = pd.read_csv(csv_file)

# Verbindung zur Datenbank herstellen
db_connection = mysql.connector.connect(
    host="localhost",
    user=getpass("Enter your database username: "),
    password=getpass("Enter your database password: "),
    database="Table_Tennis"
)
cursor = db_connection.cursor()

# Daten aus der csv-Datei in die Datenbank einfügen
for index, row in data.iterrows():
    # Prüfen, ob der Eintrag bereits existiert
    check_sql = """
    SELECT COUNT(*) FROM SeasonResults
    WHERE season_id = %s AND season = %s AND team_id = %s AND position = %s AND wins = %s AND draws = %s AND losses = %s AND points = %s
    """
    check_values = (row['season_id'], row['season'], row['team_id'], row['position'], row['wins'], row['draws'], row['losses'], row['points'])
    cursor.execute(check_sql, check_values)
    result = cursor.fetchone()

    if result[0] == 0:  # Wenn der Eintrag nicht existiert
        sql = """
        INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """
        values = (row['season_id'], row['season'], row['team_id'], row['position'], row['wins'], row['draws'], row['losses'], row['points'])
        cursor.execute(sql, values)
    elif result[0] == 1:
        print(f"Entry for team_id {row['team_id']} with season_id {row['season_id']} already exists in the database")

# Änderungen speichern und Verbindung schließen
db_connection.commit()
cursor.close()
db_connection.close()

print("Daten erfolgreich importiert!")