-- DROP TABLE Players;
-- DROP TABLE SeasonResults;
-- DROP TABLE Teams;

-- Table for Teams --
CREATE TABLE IF NOT EXISTS Teams (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
-- INSERT INTO Teams (name) VALUES ('Ochsenhausen')
-- ON DUPLICATE KEY UPDATE name = VALUES(name);
-- INSERT INTO Teams (name) VALUES ('Düsseldorf')
-- ON DUPLICATE KEY UPDATE name = VALUES(name);
-- INSERT INTO Teams (name) VALUES ('Saarbrücken')
-- ON DUPLICATE KEY UPDATE name = VALUES(name);    
-- INSERT INTO Teams (name) VALUES ('Bergneustadt')
-- ON DUPLICATE KEY UPDATE name = VALUES(name);
-- INSERT INTO Teams (name) VALUES ('Fulda')
-- ON DUPLICATE KEY UPDATE name = VALUES(name);
-- INSERT INTO Teams (name) VALUES ('Mühlhausen')
-- ON DUPLICATE KEY UPDATE name = VALUES(name);
-- INSERT INTO Teams (name) VALUES ('Grünwettersbach')
-- ON DUPLICATE KEY UPDATE name = VALUES(name);
-- INSERT INTO Teams (name) VALUES ('Bad Königshofen')
-- ON DUPLICATE KEY UPDATE name = VALUES(name);
-- INSERT INTO Teams (name) VALUES ('Grenzau')
-- ON DUPLICATE KEY UPDATE name = VALUES(name);
-- INSERT INTO Teams (name) VALUES ('Bremen')
-- ON DUPLICATE KEY UPDATE name = VALUES(name);
-- INSERT INTO Teams (name) VALUES ('Jülich')
-- ON DUPLICATE KEY UPDATE name = VALUES(name);
-- INSERT INTO Teams (name) VALUES ('Neu-Ulm')
-- ON DUPLICATE KEY UPDATE name = VALUES(name);
-- INSERT INTO Teams (name) VALUES ('Bad Homburg')
-- ON DUPLICATE KEY UPDATE name = VALUES(name);
-- INSERT INTO Teams (name) VALUES ('Mainz')
-- ON DUPLICATE KEY UPDATE name = VALUES(name);
-- INSERT INTO Teams (name) VALUES ('Borussia Dortmund')
-- ON DUPLICATE KEY UPDATE name = VALUES(name);

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

-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (1, '2018/19', 1, 1, 16, 0, 4, 32);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (1, '2018/19', 2, 2, 15, 0, 5, 30);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (1, '2018/19', 3, 3, 15, 0, 5, 30);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (1, '2018/19', 4, 4, 14, 0, 6, 28);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (1, '2018/19', 5, 5, 12, 0, 8, 24);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (1, '2018/19', 6, 6, 11, 0, 9, 22);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (1, '2018/19', 7, 7, 8, 0, 12, 16);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (1, '2018/19', 8, 8, 7, 0, 13, 14);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (1, '2018/19', 9, 9, 7, 0, 13, 14);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (1, '2018/19', 10, 10, 5, 0, 15, 10);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (1, '2018/19', 11, 11, 0, 0, 20, 0);

-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (2, '2019/20', 3, 1, 17, 0, 4, 34);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (2, '2019/20', 2, 2, 17, 0, 4, 34);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (2, '2019/20', 1, 3, 15, 0, 6, 30);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (2, '2019/20', 10, 4, 15, 0, 6, 30);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (2, '2019/20', 6, 5, 13, 0, 8, 26);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (2, '2019/20', 4, 6, 11, 0, 10, 22);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (2, '2019/20', 7, 7, 10, 0, 11, 20);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (2, '2019/20', 12, 8, 9, 0, 12, 18);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (2, '2019/20', 8, 9, 9, 0, 12, 18);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (2, '2019/20', 5, 10, 6, 0, 15, 12);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (2, '2019/20', 9, 11, 3, 0, 18, 6);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (2, '2019/20', 11, 12, 1, 0, 20, 2);

-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (3, '2020/21', 2, 1, 20, 0, 2, 40);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (3, '2020/21', 3, 2, 15, 0, 7, 30);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (3, '2020/21', 1, 3, 15, 0, 7, 30);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (3, '2020/21', 7, 4, 13, 0, 9, 26);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (3, '2020/21', 12, 5, 13, 0, 9, 26);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (3, '2020/21', 10, 6, 12, 0, 10, 24);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (3, '2020/21', 4, 7, 12, 0, 10, 24);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (3, '2020/21', 8, 8, 11, 0, 11, 22);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (3, '2020/21', 6, 9, 11, 0, 11, 22);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (3, '2020/21', 5, 10, 6, 0, 16, 12);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (3, '2020/21', 9, 11, 3, 0, 19, 6);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (3, '2020/21', 13, 12, 1, 0, 21, 2);

-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (4, '2021/22', 2, 1, 20, 0, 2, 40);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (4, '2021/22', 3, 2, 17, 0, 5, 34);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (4, '2021/22', 6, 3, 15, 0, 7, 30);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (4, '2021/22', 5, 4, 13, 0, 9, 26);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (4, '2021/22', 1, 5, 13, 0, 9, 26);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (4, '2021/22', 4, 6, 11, 0, 11, 22);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (4, '2021/22', 12, 7, 11, 0, 11, 22);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (4, '2021/22', 8, 8, 9, 0, 13, 18);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (4, '2021/22', 10, 9, 8, 0, 14, 16);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (4, '2021/22', 7, 10, 7, 0, 15, 14);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (4, '2021/22', 9, 11, 6, 0, 16, 12);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (4, '2021/22', 13, 12, 2, 0, 20, 4);

-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (5, '2022/23', 2, 1, 17, 0, 5, 34);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (5, '2022/23', 3, 2, 15, 0, 7, 30);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (5, '2022/23', 1, 3, 14, 0, 8, 28);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (5, '2022/23', 6, 4, 13, 0, 9, 26);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (5, '2022/23', 7, 5, 11, 0, 11, 22);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (5, '2022/23', 8, 6, 11, 0, 11, 22);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (5, '2022/23', 10, 7, 10, 0, 12, 20);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (5, '2022/23', 12, 8, 10, 0, 12, 20);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (5, '2022/23', 4, 9, 9, 0, 13, 18);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (5, '2022/23', 9, 10, 9, 0, 13, 18);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (5, '2022/23', 5, 11, 7, 0, 15, 14);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (5, '2022/23', 14, 12, 6, 0, 16, 12);

-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (6, '2023/24', 3, 1, 17, 0, 3, 34);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (6, '2023/24', 2, 2, 13, 0, 7, 26);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (6, '2023/24', 8, 3, 12, 0, 8, 24);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (6, '2023/24', 10, 4, 11, 0, 9, 22);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (6, '2023/24', 6, 5, 11, 0, 9, 22);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (6, '2023/24', 1, 6, 9, 0, 11, 18);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (6, '2023/24', 4, 7, 9, 0, 11, 18);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (6, '2023/24', 7, 8, 9, 0, 11, 18);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (6, '2023/24', 9, 9, 9, 0, 11, 18);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (6, '2023/24', 5, 10, 6, 0, 14, 12);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (6, '2023/24', 14, 11, 4, 0, 16, 8);

-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (7, '2024/25', 2, 1, 16, 0, 6, 32);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (7, '2024/25', 1, 2, 16, 0, 6, 32);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (7, '2024/25', 3, 3, 14, 0, 8, 28);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (7, '2024/25', 8, 4, 14, 0, 8, 28);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (7, '2024/25', 5, 5, 13, 0, 9, 26);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (7, '2024/25', 10, 6, 12, 0, 10, 24);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (7, '2024/25', 7, 7, 11, 0, 11, 22);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (7, '2024/25', 4, 8, 10, 0, 12, 20);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (7, '2024/25', 15, 9, 8, 0, 14, 16);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (7, '2024/25', 6, 10, 8, 0, 14, 16);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (7, '2024/25', 13, 11, 6, 0, 16, 12);
-- INSERT INTO SeasonResults (season_id, season, team_id, position, wins, draws, losses, points)
-- VALUES (7, '2024/25', 9, 12, 4, 0, 18, 8);

-- Table for Players
CREATE TABLE IF NOT EXISTS Players (
    id INT PRIMARY KEY AUTO_INCREMENT,
    season_id INT NOT NULL,
    team_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    world_ranking INT,
    wins INT DEFAULT 0,
    losses INT DEFAULT 0,
    games INT GENERATED ALWAYS AS (wins + losses) STORED,
    win_rate FLOAT GENERATED ALWAYS AS (CASE WHEN (wins + losses) > 0 THEN wins / (wins + losses) ELSE 0 END) STORED,
    FOREIGN KEY (season_id, team_id) REFERENCES SeasonResults(season_id, team_id) ON DELETE CASCADE,
    UNIQUE (season_id, team_id, name)
);
