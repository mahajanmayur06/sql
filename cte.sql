use college;

select student_name as namest from Student
union
select course_name as course from Course;

WITH StudentCourses AS (
    SELECT 
        s.student_name,
        c.course_name
    FROM Enrollment e
    JOIN Student s ON s.student_id = e.student_id
    JOIN Course c ON c.course_id = e.course_id
)
SELECT * FROM StudentCourses;

WITH CourseCount AS (
    SELECT 
        s.student_name,
        COUNT(e.course_id) AS total_courses
    FROM Enrollment e
    JOIN Student s ON s.student_id = e.student_id
    GROUP BY s.student_id
)
SELECT * FROM CourseCount
WHERE total_courses > 1;

WITH CourseTeacher AS (
    SELECT 
        c.course_name,
        t.teacher_name
    FROM Course c
    JOIN Teacher t ON t.teacher_id = c.teacher_id
)
SELECT * FROM CourseTeacher;

WITH CourseByAllen AS (
    SELECT course_id
    FROM Course c
    JOIN Teacher t ON c.teacher_id = t.teacher_id
    WHERE t.teacher_name = 'Prof. Allen'
),
StudentsInAllenCourses AS (
    SELECT s.student_name
    FROM Enrollment e
    JOIN Student s ON e.student_id = s.student_id
    WHERE e.course_id IN (SELECT course_id FROM CourseByAllen)
)
SELECT * FROM StudentsInAllenCourses;

select s.student_name
from Enrollment e
join student s on e.student_id = s.student_id
join course c on c.course_id = e.course_id
join teacher t on t.teacher_id = c.teacher_id
where t.teacher_name = "Prof. Allen";

WITH CourseByAllen AS (
    SELECT course_id
    FROM Course c
    JOIN Teacher t ON c.teacher_id = t.teacher_id
    WHERE t.teacher_name = 'Prof. Allen'
),
StudentsInAllenCourses AS (
    SELECT s.student_name
    FROM Enrollment e
    JOIN Student s ON e.student_id = s.student_id
    WHERE e.course_id IN (SELECT course_id FROM CourseByAllen)
)
SELECT * FROM StudentsInAllenCourses;

WITH TeacherCourse AS (
	SELECT t.teacher_name, COUNT(c.course_id) AS courseCount
    FROM Teacher AS t
    JOIN Course AS c ON c.teacher_id = t.teacher_id
    GROUP BY t.teacher_id
)
SELECT * FROM TeacherCourse
WHERE courseCount > 1;

create table product (
	size varchar(10),
    color varchar(10),
    ram int
)