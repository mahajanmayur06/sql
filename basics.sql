CREATE DATABASE IF NOT EXISTS my_db;
USE my_db;

CREATE TABLE IF NOT EXISTS students (
	uid INT PRIMARY KEY AUTO_INCREMENT,
    s_name VARCHAR(10)
);

INSERT INTO students (s_name)
VALUES ('Mayur'), ('Atharva');

CREATE TABLE IF NOT EXISTS dummy (
	string1 CHAR(5), # This is string of fixed size 5
    string2 VARCHAR(5), # This is string of variable size from 0 to 5
    string3 TINYTEXT, 
    string4 TEXT,
    audio BLOB, # to store audio or video in bytes
    age INT,
    bank_balance BIGINT,
	interest_rate FLOAT, # have precision to 23 digits
    # DOUBLE has precision with 24 to 53 digits
    string5 DECIMAL, # double stored as string
    birth_date DATE,
    birth_time DATETIME,
    time_stamp TIMESTAMP,
    color ENUM ('red', 'black'),
    married BOOLEAN
);

CREATE TABLE IF NOT EXISTS dummy2 (
	col1 INT,
    col2 INT UNSIGNED,
    col3 TINYINT
);