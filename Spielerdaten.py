import pandas as pd
from getpass import getpass
import mysql.connector

# Excel-Datei einlesen
excel_file = "/Users/richardmohling/Desktop/Tryout/Table Tennis/Daten/Spielerdaten.xlsx"  # Pfad zur Excel-Datei
data = pd.read_excel(excel_file)

# Verbindung zur Datenbank herstellen
db_connection = mysql.connector.connect(
    host="localhost",
    user=getpass("Enter your database username: "),
    password=getpass("Enter your database password: "),
    database="Table_Tennis"
)
cursor = db_connection.cursor()

# Daten aus der Excel-Datei in die Datenbank einfügen
for index, row in data.iterrows():
    # Prüfen, ob der Eintrag bereits existiert
    check_sql = """
    SELECT COUNT(*) FROM Players
    WHERE name = %s AND season_id = %s AND team_id = %s
    """
    check_values = (row['name'], row['season_id'], row['team_id'])
    cursor.execute(check_sql, check_values)
    result = cursor.fetchone()

    if result[0] == 0:  # Wenn der Eintrag nicht existiert
        sql = """
        INSERT INTO Players (name, season_id, team_id, world_ranking, wins, losses)
        VALUES (%s, %s, %s, %s, %s, %s)
        """
        values = (row['name'], row['season_id'], row['team_id'], row['world_ranking'], row['wins'], row['losses'])
        cursor.execute(sql, values)
    elif result[0] == 1:
        print(f"{row['name']} already exists in the database")

# Änderungen speichern und Verbindung schließen
db_connection.commit()
cursor.close()
db_connection.close()

print("Daten erfolgreich importiert!")