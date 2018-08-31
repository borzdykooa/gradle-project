CREATE DATABASE gradle_database;
USE gradle_database;

CREATE TABLE trainer (
  id         BIGINT PRIMARY KEY AUTO_INCREMENT,
  name       VARCHAR(32) NOT NULL,
  language   VARCHAR(16) NOT NULL,
  experience INTEGER     NOT NULL
);

CREATE TABLE trainee (
  id         BIGINT PRIMARY KEY AUTO_INCREMENT,
  name       VARCHAR(32) NOT NULL,
  trainer_id BIGINT REFERENCES gradle_database.trainer (id)
);

INSERT INTO gradle_database.trainer (name, language, experience) VALUES
  ('Andrei Reut', 'Java', 6),
  ('Ivan Ivanov', 'C++', 4),
  ('Petr Petrov', 'C#', 5);

INSERT INTO gradle_database.trainee (name, trainer_id) VALUES
  ('Olga Borzdyko', (SELECT id
                     FROM gradle_database.trainer
                     WHERE trainer.name = 'Andrei Reut')),
  ('Denis Byhovsky', (SELECT id
                      FROM gradle_database.trainer
                      WHERE trainer.name = 'Andrei Reut')),
  ('Sergei Sergeev', (SELECT id
                      FROM gradle_database.trainer
                      WHERE trainer.name = 'Andrei Reut'));
