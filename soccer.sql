DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    referee_name TEXT NOT NULL
);

CREATE TABLE leagues
(
    id SERIAL PRIMARY KEY,
    league_name TEXT NOT NULL,
    starting_date DATE,
    ending_date DATE
);

CREATE TABLE teams 
(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,
    league_id INTEGER REFERENCES leagues
);

CREATE TABLE rankings
(
    ranking_id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE games
(
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams,
    away_team_id INTEGER REFERENCES teams,
    league_id INTEGER REFERENCES leagues,
    referee1_id INTEGER REFERENCES referees,
    referee2_id INTEGER REFERENCES referees,
    referee3_id INTEGER REFERENCES referees
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    game_id INTEGER REFERENCES games
);

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    result TEXT NOT NULL,
    team_id INTEGER REFERENCES teams,
    game_id INTEGER REFERENCES games
);

INSERT INTO referees (referee_name) VALUES ('Bob'), ('Bobby'), ('Bobbo');

INSERT INTO leagues (league_name, starting_date, ending_date) VALUES ('Springleague', '2023-03-15', '2024-03-15');
INSERT INTO teams (team_name, league_id) VALUES ('Springgang', 1), ('Springteam', 1);
INSERT INTO rankings (team_id) VALUES (1), (2);
INSERT INTO players (player_name, team_id) VALUES ('Chapo', 1);
INSERT INTO games (home_team_id, away_team_id, league_id, referee1_id, referee2_id, referee3_id) VALUES (1, 2, 1, 1, 2, 3);
INSERT INTO goals (player_id, game_id) VALUES (1, 1);
INSERT INTO results (result, team_id, game_id) VALUES ('Win', 1, 1), ('Loss', 2, 1);
