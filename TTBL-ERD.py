from graphviz import Digraph

# Neues Diagramm
dot = Digraph(comment="Tischtennis ERD")
dot.attr('node', shape='record')

# Tabellen als Kästen
dot.node('Teams', '''{
    Teams |
    id (PK) \l
    name \l
}''')

dot.node('Seasons', '''{
    Seasons |
    id (PK) \l
    name (z.B. "2018/19") \l
}''')

dot.node('SeasonResults', '''{
    SeasonResults |
    id (PK) \l
    season_id (FK) \l
    team_id (FK) \l
    position \l
    wins \l
    draws \l
    losses \l
    points \l
}''')

dot.node('Players', '''{
    Players |
    id (PK) \l
    season_id (FK) \l
    team_id (FK) \l
    name \l
    world_ranking \l
    wins \l
    losses \l
    games \l
}''')

# Beziehungen
dot.edge('SeasonResults', 'Teams', label="N:1")
dot.edge('SeasonResults', 'Seasons', label="N:1")
dot.edge('Players', 'Teams', label="N:1")
dot.edge('Players', 'Seasons', label="N:1")

# Diagramm rendern
file_path = '/Users/richardmohling/Desktop/Tryout/Table Tennis/TTBL-AI/TTBL-ERD'
dot.render(file_path, format='png', cleanup=True)
file_path
