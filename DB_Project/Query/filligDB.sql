use university_project;

INSERT INTO student (student_id, major, enrollment_year, studentName, GPA, email)
VALUES 
(1, 'Computer Science', '2020-08-01', 'sara Doe', 3.7, 'johndoe@email.com'),
(2, 'Engineering', '2019-09-01', 'Jane Smith', 3.8, 'janesmith@email.com'),
(3, 'Mathematics', '2021-01-15', 'john ali', 3.1, 'aliceb@email.com'),
(4, 'art', '2021-01-15', 'adolf hitler', 2.3, 'hitler1889@germany.com'),
(5, 'Engineering', '2020-01-15', 'amr Brown', 1.9, 'testing@email.com'),
(6, 'art', '2021-01-15', 'adolf hitler', 2.3, 'hogn324@germany.com'),
(7, 'Mathematics', '2021-01-15', 'Alice Brown', 3.1, 'fasfk214@email.com'),
(8, 'art', '2021-01-15', 'mike tyson', 3.3, 'good.good@yahoo.com'), 
(9, 'Physics', '2022-09-01', 'Mark Lee', 1.5, 'marklee@email.com');


INSERT INTO course (code, name, description, schedule, prerequisites)
VALUES
(101, 'Introduction to Programming', 'Basic programming concepts', '2024-01-10 09:00:00', NULL),
(102, 'Data Structures', 'Understanding data structures', '2024-01-12 11:00:00', 'Introduction to Programming'),
(103, 'Algorithms', 'Study of algorithms', '2024-02-01 10:00:00', 'Data Structures'),
(104, 'Computer Networks', 'Overview of computer networks', '2024-02-15 09:00:00', 'Introduction to Programming');


INSERT INTO scholarship (scholarship_id, dead_line, name, application_process)
VALUES
(1, '2024-05-01', 'Merit Scholarship', 'Online Application'),
(2, '2022-06-01', 'Research Grant', 'Submit Proposal'),
(3, '2024-07-01', 'STEM Excellence Award', 'Email Submission');


INSERT INTO project (project_id, description, title, budget, dead_line)
VALUES
(1, 'AI-based course recommendation system', 'Course Recommender', 50000, '2025-01-01 12:00:00'),
(2, 'Data analysis for university research', 'Research Data Analysis', 100000, '2025-02-01 15:00:00'),
(3, 'Automation of campus facilities management', 'Campus Automation', 75000, '2025-03-01 09:00:00');




INSERT INTO event (event_id, name, date, time, location)
VALUES
(1, 'AI Conference', '2024-12-20', '09:00:00', 'Lecture Hall A'),
(2, 'Robotics Workshop', '2024-12-21', '10:00:00', 'Lecture Hall B');




INSERT INTO lecture_hall (hall_id, name, type, capacity, location, Fid)
VALUES
(1, 'Lecture Hall A', 'Lecture', 100, 'Building 1, 2nd Floor', 1),
(2, 'Lecture Hall B', 'Workshop', 50, 'Building 2, 3rd Floor', 2),
(3, 'Lecture Hall C', 'Symposium', 200, 'Building 3, 1st Floor', 3),
(4, 'Lecture Hall D', 'Exhibition', 150, 'Building 4, 4th Floor', 4);

INSERT INTO exam (exam_id, location, date, time)
VALUES
(1, 'Lecture Hall A', '2024-12-20', '09:00:00'),
(2, 'Lecture Hall B', '2024-12-21', '10:00:00'),
(3, 'Lecture Hall C', '2024-12-22', '14:00:00');



-- Inserting into student_scholarship table
INSERT INTO student_scholarship (student_id, scholarship_id)
VALUES
(1, 2),
(2, 3),
(5, 1);

INSERT INTO faculty (faculty_id, professor_id ,name, hall_id)
VALUES
(1, 1, 'Faculty of Computer Science', 1),
(2, 3, 'Faculty of Engineering', 4),
(3, 2, 'Faculty of Arts', 3);
-- #*********************************



INSERT INTO professor (professor_id, academic_rank, name, email, dep_id)
VALUES  
(1, 'Assistant Professor', 'Dr. Alan Turing', 'turing@email.com', NULL),
(2, 'Professor', 'Dr. John  feumann', 'jvsdfakljn@email.com', NULL),
(3, 'Professor', 'Dr. mira von mmol', 'jsvn@email.com', NULL), 
(4, 'lecturer', 'Dr. sami bveckitn', 'ssfn@email.com', NULL);

INSERT INTO department (dep_id, name, professor_id, faculty_id)
VALUES
(1, 'Computer Science', 2, 2),
(2, 'Engineering', 3, 1);

--###################
-- Inserting into stuff table
INSERT INTO stuff (stuff_id, name, position, contact_info, Dno)
VALUES
(1, 'Alan Smith', 'Administrator', '1234567890', 1),
(2, 'Betty Brown', 'Technician', '0987654321', 2),
(3, 'ali sayed', 'Technician', '0934654321', 2);
--######################


-- select * from department ;
-- select * from professor ;

UPDATE professor
SET dep_id = 1
WHERE professor_id = 1;
UPDATE professor
SET dep_id = 1
WHERE professor_id = 2;
UPDATE professor
SET dep_id = 2
WHERE professor_id = 3;
UPDATE professor
SET dep_id = 1
WHERE professor_id = 4;


INSERT INTO department_location (dep_id, location)
VALUES
(1, 'Building A, floor1'),
(1, 'Building B, floor 4'),
(2, 'Building c, floor4');

INSERT INTO student_professor_project (spp_id, student_id, professor_id, project_id, project_grade)
VALUES
(1, 1, 1, 1, 95),
(2, 2, 2, 2, 90),
(3, 3, 3, 3, 85);

INSERT INTO professor_course(professor_id, course_code)
VALUES
( 1, 101),
( 2, 102),
( 3, 103),
( 2, 104);

select * from professor_course ;

-- Inserting into event_department table
INSERT INTO event_department (event_id, dep_id)
VALUES
(1, 1),
(2, 2);

-- Inserting into exam_course_student table
INSERT INTO exam_course_student (ecs, exam_id, course_code, student_id, date, grade)
VALUES
(1, 1, 101, 1, '2024-12-20', 85),
(2, 2, 102, 2, '2024-12-21', 90),
(3, 3, 103, 3, '2024-12-22', 80);

-- Inserting into dependent table
INSERT INTO dependent (dependent_id, professor_id, name, gender, relation, age)
VALUES
(1, 1, 'John Doe', 'M', 'Child', 5),
(2, 2, 'Jane Doe', 'F', 'Spouse', 30),
(3, 3, 'Michael Smith', 'M', 'Child', 8);

INSERT INTO department_course (dep_id, code)
VALUES
(1, 101), 
(2, 102), 
(2, 103), 
(2, 104);




-- ####################################################################

