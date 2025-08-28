USE my_db;

CREATE TABLE students (
	uid INT NOT NULL UNIQUE,
    name_ VARCHAR(50),
    ad_year INT,
    PRIMARY KEY(uid)
);

CREATE TABLE results (
	cgpa FLOAT,
    uid INT,
    FOREIGN KEY(uid) REFERENCES students(uid) ON DELETE CASCADE
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 18),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

DROP TABLE students;

-- To drop foreign key 
SHOW CREATE TABLE results;# it will show key name of foreign key in table
ALTER TABLE results DROP FOREIGN KEY results_ibfk_1;

ALTER TABLE results 
ADD CONSTRAINT fk_results_uid 
FOREIGN KEY (uid) REFERENCES students(uid)
ON DELETE SET NULL;

ALTER TABLE results DROP FOREIGN KEY fk_results_uid;

ALTER TABLE results 
ADD CONSTRAINT fk_results_uid 
FOREIGN KEY (uid) REFERENCES students(uid)
ON DELETE CASCADE;
