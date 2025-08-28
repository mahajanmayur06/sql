use my_db;

INSERT INTO table2 (col2, col4)
VALUES (2,3);

SELECT * FROM table2;
SELECT * FROM table2
WHERE col1 = 10;
SELECT col2 AS age, UPPER(col3) AS s_name FROM table2;


UPDATE table2
SET col3 = "oracle"
WHERE col1 = 1 or col1 = 5;

ALTER TABLE table2 ADD COLUMN col3 VARCHAR(10) NOT NULL;

INSERT INTO table2 (col2, col4, col3)
VALUES (100, 1121, "what");

DELETE FROM table2
WHERE col1 = 10;

TRUNCATE TABLE table2;

INSERT INTO students (uid, name_, ad_year)
VALUES (3, 'Ninad', 4);

INSERT INTO results (uid, cgpa)
VALUES (3, 8.80);

-- Insert data into departments table
INSERT INTO departments (dept_id, dept_name)
VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales');

-- Insert data into employees table
INSERT INTO employees (name, age, dept_id)
VALUES
('Alice Johnson', 40, 5);

-- Update query
UPDATE results 
SET cgpa = 8.9
WHERE uid = 3;

SET SQL_SAFE_UPDATES = 0;
UPDATE results SET cgpa = 9.8;
SET SQL_SAFE_UPDATES = 1;

DELETE FROM students
WHERE uid = 3; # This deleted results with uid = 3, 

DELETE FROM results WHERE uid is NULL;
DELETE FROM results WHERE uid = NULL; # both statements are different, = is dealing with boolean functions

# Replace (data), if data is present it will be updated, else new data will be added
REPLACE INTO employees (emp_id, name, age, dept_id)
VALUES ('Alice Johnson', 20, 4);
# Providing primary key here is must, as it would be differentiated by itself

REPLACE INTO employees 
SET name = "Kotlin Shah", emp_id = 5;

INSERT INTO employees (emp_id, name, age) 
VALUES (7, "Elon Dart", 80) as new
ON DUPLICATE KEY UPDATE
employees.name = new.name, employees.age = new.age;