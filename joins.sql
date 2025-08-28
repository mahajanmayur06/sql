USE my_db;

# Inner join
SELECT e.emp_id, e.name, d.dept_name
FROM employees AS e
INNER JOIN
departments AS d
ON e.dept_id = d.dept_id;

# Outer join
SELECT e.emp_id, e.name, d.dept_name
FROM employees AS e
LEFT JOIN
departments AS d
ON e.dept_id = d.dept_id;

SELECT e.emp_id, e.name, d.dept_name
FROM employees AS e
RIGHT JOIN
departments AS d
ON e.dept_id = d.dept_id;

SELECT e.emp_id, e.name, d.dept_name
FROM employees AS e
LEFT JOIN
departments AS d
ON e.dept_id = d.dept_id
UNION
SELECT e.emp_id, e.name, d.dept_name
FROM employees AS e
RIGHT JOIN
departments AS d
ON e.dept_id = d.dept_id;

SELECT e.*, d.*
FROM employees AS e
CROSS JOIN departments AS d;

# self joins
select e1.emp_id, e2.name, e2.age	
from employees as e1
inner join employees as e2
on e1.dept_id = e1.dept_id;