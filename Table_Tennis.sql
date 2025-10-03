-- DROP TABLE Players;
-- DROP TABLE SeasonResults;
-- DROP TABLE Teams;

-- Table for Teams --
CREATE TABLE IF NOT EXISTS Teams (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- Table for SeasonResults
CREATE TABLE IF NOT EXISTS SeasonResults (
    id INT PRIMARY KEY AUTO_INCREMENT,
    season_id INT NOT NULL,
    season VARCHAR(50) NOT NULL,
    team_id INT NOT NULL,
    position INT NOT NULL,
    wins INT DEFAULT 0,
    draws INT DEFAULT 0,
    losses INT DEFAULT 0,
    points INT DEFAULT 0,
    UNIQUE (season, team_id),
    UNIQUE (season_id, team_id), 
    FOREIGN KEY (team_id) REFERENCES Teams(id) ON DELETE CASCADE
);

-- Table for Players
CREATE TABLE IF NOT EXISTS Players (
    id INT PRIMARY KEY AUTO_INCREMENT,
    season_id INT NOT NULL,
    team_id INT NOT NULL,
    name TEXT NOT NULL,
    world_ranking INT,
    wins INT DEFAULT 0,
    losses INT DEFAULT 0,
    games INT GENERATED ALWAYS AS (wins + losses) STORED,
    win_rate FLOAT GENERATED ALWAYS AS (CASE WHEN (wins + losses) > 0 THEN wins / (wins + losses) ELSE 0 END) STORED,
    FOREIGN KEY (season_id, team_id) REFERENCES SeasonResults(season_id, team_id) ON DELETE CASCADE,
    UNIQUE (season_id, team_id, name)
);