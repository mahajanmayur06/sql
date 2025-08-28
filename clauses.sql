USE my_db;

SELECT dept_id, AVG(age)
FROM employees
GROUP BY dept_id;

SELECT dept_id, COUNT(*) as total
FROM employees
GROUP BY dept_id
ORDER BY total DESC;

SELECT dept_id, MAX(age) AS max_age, MIN(age) AS min_age
FROM employees
GROUP BY dept_id;

SELECT d.dept_name, COUNT(e.name) AS employee_count
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

SELECT d.dept_name, AVG(e.age) AS avg_age
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Having clause
SELECT dept_id, COUNT(*) AS total
FROM employees
GROUP BY dept_id
HAVING COUNT(*) > 1;

SELECT * FROM employees HAVING name  = 'Alice Johnson';

SELECT * FROM employees WHERE dept_id IN (1, 2, 3);

SELECT * FROM employees WHERE name LIKE 'A%';   -- starts with A
SELECT * FROM employees WHERE email LIKE '%@gmail.com'; -- ends with @gmail.com
SELECT * FROM employees WHERE name LIKE 'Ev_ Green';

SELECT name,
	CASE 
		WHEN age < 25 THEN 'Junior'
        WHEN age BETWEEN 25 AND 40 THEN 'Mid'
        ELSE 'Senior'
	END AS level
FROM employees;

SELECT name, dept_id,
    CASE dept_id
        WHEN 2 THEN 'Tech'         -- IT
        WHEN 3 THEN 'Tech'         -- Finance
        ELSE 'Non-Tech'
    END AS category
FROM employees;

SELECT 
    COUNT(CASE WHEN dept_id IN (2, 3) THEN 1 END) AS tech_count,
    COUNT(CASE WHEN dept_id NOT IN (2, 3) THEN 1 END) AS non_tech_count
FROM employees;

SELECT
    CASE
        WHEN age < 30 THEN 'Below 30'
        ELSE '30 and above'
    END AS age_range,
    COUNT(*) AS total
FROM employees
GROUP BY age_range; 

-- Below are dual tables, using dummy tables created by mysql, one row and one column function

SELECT UUID();
SELECT 55+11 AS total;
SELECT NOW() AS date_time;
SELECT ucase("lower case alphabet") AS upper;

SELECT DISTINCT name
FROM EMPLOYEES;

-- Order of Execution: The GROUP BY clause is executed after the WHERE clause but before the HAVING clause.
-- So, the sequence of operations in a typical query would be:
-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT
-- ORDER BY
-- This is important because the HAVING clause can filter the results after the GROUP BY operation.
