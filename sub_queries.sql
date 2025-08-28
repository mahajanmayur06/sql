USE my_db;

-- There are various types of sub queries
-- From subquery returns table, so need to alias table

select * 
from employees e1
where 3 = (
	select count(e2.age)
    from employees e2
    where e2.age >= e1.age
);

SELECT 
    e1.name,
    e1.age,
    (
        SELECT COUNT(e2.age) 
        FROM employees e2 
        WHERE e2.age > e1.age
    ) AS num_employees_older
FROM employees e1;

select * 
from employees
where age > (select avg(age) from employees);

SELECT name
FROM employees
WHERE (age, dept_id) = (SELECT MAX(age), dept_id FROM employees GROUP BY age);

select * from employees;	

select student_name
from student
where student_id IN (
	select student_id 
    from enrollment
    where course_id = 101
);

select student_name
from student
where student_id IN (
	select student_id 
    from enrollment
    where course_id IS NULL
);

SELECT student_name
FROM student
WHERE student_id NOT IN (
    SELECT DISTINCT student_id
    FROM enrollment
);

SELECT course_name
FROM course
WHERE course_id NOT IN (
    SELECT DISTINCT course_id
    FROM enrollment
);

select student_name
from students
