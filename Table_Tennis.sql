-- DROP TABLE Season_2024_25;
-- DROP TABLE Season_2023_24;
-- DROP TABLE Season_2022_23;
-- DROP TABLE Season_2021_22;
-- DROP TABLE Season_2020_21;
-- DROP TABLE Season_2019_20;
-- DROP TABLE Season_2018_19;

CREATE TABLE IF NOT EXISTS Teams (
    id INTEGER PRIMARY KEY,
    name TEXT
);
INSERT INTO Teams (id, name) VALUES (1, 'Ochsenhausen')
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO Teams (id, name) VALUES (2, 'Düsseldorf')
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO Teams (id, name) VALUES (3, 'Saarbrücken')
ON DUPLICATE KEY UPDATE name = VALUES(name);    
INSERT INTO Teams (id, name) VALUES (4, 'Bergneustadt')
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO Teams (id, name) VALUES (5, 'Fulda')
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO Teams (id, name) VALUES (6, 'Mühlhausen')
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO Teams (id, name) VALUES (7, 'Grünwettersbach')
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO Teams (id, name) VALUES (8, 'Bad Königshofen')
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO Teams (id, name) VALUES (9, 'Grenzau')
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO Teams (id, name) VALUES (10, 'Bremen')
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO Teams (id, name) VALUES (11, 'Jülich')
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO Teams (id, name) VALUES (12, 'Neu-Ulm')
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO Teams (id, name) VALUES (13, 'Bad Homburg')
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO Teams (id, name) VALUES (14, 'Mainz')
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO Teams (id, name) VALUES (15, 'Borussia Dortmund')
ON DUPLICATE KEY UPDATE name = VALUES(name);

CREATE TABLE IF NOT EXISTS SeasonResults (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    season TEXT,
    team_id INTEGER,
    position INTEGER,
    wins INTEGER,
    draws INTEGER,
    losses INTEGER,
    points INTEGER,
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2018/19', 1, 1, 16, 0, 4, 32);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2018/19', 2, 2, 15, 0, 5, 30);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2018/19', 3, 3, 15, 0, 5, 30);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2018/19', 4, 4, 14, 0, 6, 28);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2018/19', 5, 5, 12, 0, 8, 24);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2018/19', 6, 6, 11, 0, 9, 22);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2018/19', 7, 7, 8, 0, 12, 16);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2018/19', 8, 8, 7, 0, 13, 14);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2018/19', 9, 9, 7, 0, 13, 14);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2018/19', 10, 10, 5, 0, 15, 10);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2018/19', 11, 11, 0, 0, 20, 0);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2019/20', 3, 1, 17, 0, 4, 34);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2019/20', 2, 2, 17, 0, 4, 34);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2019/20', 1, 3, 15, 0, 6, 30);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2019/20', 10, 4, 15, 0, 6, 30);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2019/20', 6, 5, 13, 0, 8, 26);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2019/20', 4, 6, 11, 0, 10, 22);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2019/20', 7, 7, 10, 0, 11, 20);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2019/20', 12, 8, 9, 0, 12, 18);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2019/20', 8, 9, 9, 0, 12, 18);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2019/20', 5, 10, 6, 0, 15, 12);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2019/20', 9, 11, 3, 0, 18, 6);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2019/20', 11, 12, 1, 0, 20, 2);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2020/21', 2, 1, 20, 0, 2, 40);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2020/21', 3, 2, 15, 0, 7, 30);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2020/21', 1, 3, 15, 0, 7, 30);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2020/21', 7, 4, 13, 0, 9, 26);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2020/21', 12, 5, 13, 0, 9, 26);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2020/21', 10, 6, 12, 0, 10, 24);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2020/21', 4, 7, 12, 0, 10, 24);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2020/21', 8, 8, 11, 0, 11, 22);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2020/21', 6, 9, 11, 0, 11, 22);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2020/21', 5, 10, 6, 0, 16, 12);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2020/21', 9, 11, 3, 0, 19, 6);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2020/21', 13, 12, 1, 0, 21, 2);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2021/22', 2, 1, 20, 0, 2, 40);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2021/22', 3, 2, 17, 0, 5, 34);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2021/22', 6, 3, 15, 0, 7, 30);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2021/22', 5, 4, 13, 0, 9, 26);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2021/22', 1, 5, 13, 0, 9, 26);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2021/22', 4, 6, 11, 0, 11, 22);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2021/22', 12, 7, 11, 0, 11, 22);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2021/22', 8, 8, 9, 0, 13, 18);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2021/22', 10, 9, 8, 0, 14, 16);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2021/22', 7, 10, 7, 0, 15, 14);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2021/22', 9, 11, 6, 0, 16, 12);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2021/22', 13, 12, 2, 0, 20, 4);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2022/23', 2, 1, 17, 0, 5, 34);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2022/23', 3, 2, 15, 0, 7, 30);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2022/23', 1, 3, 14, 0, 8, 28);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2022/23', 6, 4, 13, 0, 9, 26);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2022/23', 7, 5, 11, 0, 11, 22);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2022/23', 8, 6, 11, 0, 11, 22);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2022/23', 10, 7, 10, 0, 12, 20);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2022/23', 12, 8, 10, 0, 12, 20);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2022/23', 4, 9, 9, 0, 13, 18);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2022/23', 9, 10, 9, 0, 13, 18);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2022/23', 5, 11, 7, 0, 15, 14);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2022/23', 14, 12, 6, 0, 16, 12);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2023/24', 3, 1, 17, 0, 3, 34);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2023/24', 2, 2, 13, 0, 7, 26);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2023/24', 8, 3, 12, 0, 8, 24);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2023/24', 10, 4, 11, 0, 9, 22);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2023/24', 6, 5, 11, 0, 9, 22);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2023/24', 1, 6, 9, 0, 11, 18);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2023/24', 4, 7, 9, 0, 11, 18);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2023/24', 7, 8, 9, 0, 11, 18);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2023/24', 9, 9, 9, 0, 11, 18);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2023/24', 5, 10, 6, 0, 14, 12);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2023/24', 14, 11, 4, 0, 16, 8);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2024/25', 2, 1, 16, 0, 6, 32);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2024/25', 1, 2, 16, 0, 6, 32);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2024/25', 3, 3, 14, 0, 8, 28);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2024/25', 8, 4, 14, 0, 8, 28);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2024/25', 5, 5, 13, 0, 9, 26);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2024/25', 10, 6, 12, 0, 10, 24);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2024/25', 7, 7, 11, 0, 11, 22);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2024/25', 4, 8, 10, 0, 12, 20);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2024/25', 15, 9, 8, 0, 14, 16);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2024/25', 6, 10, 8, 0, 14, 16);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2024/25', 13, 11, 6, 0, 16, 12);
INSERT INTO SeasonResults (season, team_id, position, wins, draws, losses, points)
VALUES ('2024/25', 9, 12, 4, 0, 18, 8);