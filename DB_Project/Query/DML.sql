  use university_project;

-- for DDL commands


UPDATE student
SET GPA = 3.95
WHERE student_id = 2;

-- List of professors teaching courses and their departments
SELECT p.name AS professor_name, c.name AS course_name, d.name AS department_name
FROM professor p
JOIN professor_course pc ON p.professor_id = pc.professor_id
JOIN course c ON pc.course_code = c.code
JOIN department d ON p.dep_id = d.dep_id;



-- Students with their scholarships and GPA
SELECT s.studentName, s.GPA, sch.name AS scholarship_name, sch.application_process
FROM student s
JOIN student_scholarship ss ON s.student_id = ss.student_id
JOIN scholarship sch ON ss.scholarship_id = sch.scholarship_id;


-- Students with a GPA above the department average
SELECT s.studentName, s.GPA, s.major
FROM student s
WHERE GPA > (
    SELECT AVG(GPA)
    FROM student
    WHERE major = s.major
);

select * from student


 -- Courses taught by professors with the rank of "Professor"

SELECT c.name AS course_name
FROM course c
WHERE c.code IN (
    SELECT pc.course_code
    FROM professor_course pc
    JOIN professor p ON pc.professor_id = p.professor_id
    WHERE p.academic_rank = 'Professor'
);

-- Create a view to summarize student details:
 CREATE VIEW StudentSummary AS
SELECT s.studentName, s.major, s.GPA, sch.name AS scholarship_name
FROM student s
LEFT JOIN student_scholarship ss ON s.student_id = ss.student_id
LEFT JOIN scholarship sch ON ss.scholarship_id = sch.scholarship_id;

select * from StudentSummary ;

-- Student, professor, and project details for each collaboration
SELECT s.studentName, p.name AS professor_name, pr.title AS project_title, spp.project_grade
FROM student_professor_project spp
JOIN student s ON spp.student_id = s.student_id
JOIN professor p ON spp.professor_id = p.professor_id
JOIN project pr ON spp.project_id = pr.project_id;

-- Average GPA of students in each department 
SELECT s.major, AVG(s.GPA) AS avg_gpa
FROM student s
GROUP BY s.major
ORDER BY avg_gpa DESC;

-- Students and Events Associated with Their Departments
SELECT s.studentName, e.name AS event_name, d.name AS department_name
FROM student s
JOIN department d ON s.major = d.name
JOIN event_department ed ON ed.dep_id = d.dep_id
JOIN event e ON ed.event_id = e.event_id;

 -- Professor and Dependent Relationships
SELECT p.name AS professor_name, d.name AS dependent_name, d.relation, d.age
FROM professor p
JOIN dependent d ON p.professor_id = d.professor_id;

 -- Faculty and Lecture Hall Usage
SELECT f.name AS faculty_name, lh.name AS hall_name, lh.type AS hall_type, lh.capacity
FROM faculty f
JOIN lecture_hall lh ON f.hall_id = lh.hall_id;

 -- Create a view that lists professors and the courses they teach:
CREATE VIEW ProfessorCourses AS
SELECT p.name AS professor_name, c.name AS course_name
FROM professor p
JOIN professor_course pc ON p.professor_id = pc.professor_id
JOIN course c ON pc.course_code = c.code;
--#####
select * from ProfessorCourses
--#####
  -- Top Students in Each Course
SELECT ecs.course_code, c.name AS course_name, s.studentName, ecs.grade
FROM exam_course_student ecs
JOIN student s ON ecs.student_id = s.student_id
JOIN course c ON ecs.course_code = c.code
WHERE ecs.grade = (
    SELECT MAX(grade)
    FROM exam_course_student ecs_sub
    WHERE ecs_sub.course_code = ecs.course_code
);
-- Create a view to list events and the associated departments:
    CREATE VIEW DepartmentEvents AS
SELECT e.name AS event_name, d.name AS department_name
FROM event e
JOIN event_department ed ON e.event_id = ed.event_id
JOIN department d ON ed.dep_id = d.dep_id;

select * from DepartmentEvents;
SELECT * FROM DepartmentEvents WHERE event_name LIKE '%Workshop%';


CREATE VIEW StudentDetails AS
SELECT s.studentName, s.GPA, sch.name AS scholarship_name, sch.application_process
FROM student s
LEFT JOIN student_scholarship ss ON s.student_id = ss.student_id
LEFT JOIN scholarship sch ON ss.scholarship_id = sch.scholarship_id;
 select * from StudentDetails;

-- Updated View (adding enrollment year)
   CREATE  VIEW StudentDetails AS
SELECT s.studentName, s.GPA, s.enrollment_year, sch.name AS scholarship_name
FROM student s
LEFT JOIN student_scholarship ss ON s.student_id = ss.student_id
LEFT JOIN scholarship sch ON ss.scholarship_id = sch.scholarship_id;

 select * from StudentDetails;
 DROP VIEW StudentDetails;

 --Index
create nonclustered Index index_nameGPA
on student (studentName,GPA)
DROP  INDEX index_nameGPA ON student;
DROP INDEX index_major ON student;
    









SELECT * FROM student WHERE GPA > 1;


select * from exam;
select * from dependent;
select * from faculty;
select * from exam_course_student;
select * from lecture_hall;
select * from stuff;
select * from event;
select * from event_department;
select * from department_course;

select * from student_professor_project;
select * from project;
select * from department_location;
select * from department;
select * from professor;
select * from professor_course;
select * from course;
select * from student_scholarship;
select * from scholarship;
select * from student;
create nonclustered Index index_major
on student(major)

