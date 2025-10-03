import pandas as pd
from getpass import getpass
import mysql.connector

# csv-Datei einlesen
csv_file = "/Users/richardmohling/Desktop/Tryout/TTBL-AI/Teams_data.csv"  # Pfad zur csv-Datei
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
    SELECT COUNT(*) FROM Teams
    WHERE id = %s AND name = %s
    """
    check_values = (row['id'], row['name'])
    cursor.execute(check_sql, check_values)
    result = cursor.fetchone()

    if result[0] == 0:  # Wenn der Eintrag nicht existiert
        sql = """
        INSERT INTO Teams (id, name)
        VALUES (%s, %s)
        """
        values = (row['id'], row['name'])
        cursor.execute(sql, values)
    elif result[0] == 1:
        print(f"Entry for team_id {row['id']} with name {row['name']} already exists in the database")

# Änderungen speichern und Verbindung schließen
db_connection.commit()
cursor.close()
db_connection.close()

print("Teams erfolgreich importiert!")