CREATE DATABASE IF NOT EXISTS my_db;

USE my_db;

SHOW DATABASES;

SHOW tables;

CREATE TABLE IF NOT EXISTS students (
    uid INT PRIMARY KEY,
    name STRING
)

INSERT INTO students (uid, name) VALUES (1, 'Mayur'), (2, 'Atharva'), (2, 'Ninad');