CREATE DATABASE university_project;
USE university_project;
USE [master];
ALTER AUTHORIZATION ON DATABASE::university_project TO [sa];
drop database university_project
CREATE TABLE student(
    student_id INT PRIMARY KEY,
    major VARCHAR(50) NOT NULL,
    enrollment_year DATE NOT NULL,
    studentName VARCHAR(50) NOT NULL,
    GPA DECIMAL(5, 2) NOT NULL,
    email VARCHAR(50)
);

CREATE TABLE scholarship(
    scholarship_id INT PRIMARY KEY,
    dead_line DATE NOT NULL,
    name VARCHAR(50) NOT NULL,
    application_process VARCHAR(50) NOT NULL
);

CREATE TABLE student_scholarship
(
    student_id INT not null,
    scholarship_id INT not null,
	PRIMARY KEY (student_id, scholarship_id)
);



CREATE TABLE course (
    code INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(50) ,
    schedule DATETIME,
    prerequisites VARCHAR(50)
);


CREATE TABLE professor_course(
    course_code INT NOT NULL,
    professor_id INT NOT NULL, 
	PRIMARY KEY (course_code, professor_id)
);

CREATE TABLE professor (
    professor_id INT PRIMARY KEY,
    academic_rank VARCHAR(50),
    name VARCHAR(50),
    email VARCHAR(50), 
	dep_id INT -- the department in which the prof works. FK
);

CREATE TABLE department 
(
    dep_id INT PRIMARY KEY,
    name VARCHAR(50),
    professor_id INT,-- THIS IS FOREIGN KEY FOR MANAGER PROFESSOR
    faculty_id INT -- FOREIGN
	 
);

CREATE TABLE department_location 
(
    dep_id INT not null,
    location VARCHAR(50) not null, 
	PRIMARY KEY (dep_id, location)
);

CREATE TABLE project
(
    project_id INT PRIMARY KEY,
    description VARCHAR(50) NOT NULL,
    title VARCHAR(50) NOT NULL,
    budget INT NOT NULL, 
	dead_line DATETIME
);

CREATE TABLE student_professor_project
(	
	spp_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    professor_id INT NOT NULL,
    project_id INT NOT NULL, 
	project_grade DECIMAL

);

CREATE TABLE department_course
(
    dep_id INT NOT NULL,
    code INT NOT NULL, 
	PRIMARY KEY(dep_id, code) -- both are foreign keys
);

CREATE TABLE event_department
(
    event_id INT NOT NULL,
    dep_id INT NOT NULL, 
	PRIMARY KEY(event_id, dep_id) -- both are foreign keys
);

CREATE TABLE event
(
    event_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    date DATE NOT NULL,
    time DATETIME NOT NULL,
    location VARCHAR(50)
);



CREATE TABLE stuff(

    stuff_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    contact_info varchar(50) NOT NULL,
	Dno INT -- THIS IS FOREIGN KEY TO DEPARTMENT 
);

CREATE TABLE lecture_hall
(
    hall_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(50) NOT NULL,
    capacity INT NOT NULL,
    location VARCHAR(50) NOT NULL, 
	Fid INT     -- THIS IS FOREIGN KEY FOR FACULTY 
);

CREATE TABLE exam_course_student 
(
	ecs INT PRIMARY KEY,
    exam_id INT NOT NULL,
    course_code INT NOT NULL, -- FK
    student_id INT NOT NULL, -- FK
    date DATE NOT NULL,
    grade INT 
);
CREATE TABLE exam 
(
    exam_id INT PRIMARY KEY,
    location VARCHAR(50) NOT NULL,
    date DATE NOT NULL,
    time DATETIME NOT NULL
);


CREATE TABLE faculty 
(
    faculty_id INT PRIMARY KEY,
    professor_id INT NOT NULL, -- FK
    name VARCHAR(50) NOT NULL,
    hall_id INT NOT NULL -- FK FOR HALL 
);


CREATE TABLE dependent 
(
    dependent_id INT PRIMARY KEY,
    professor_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    gender CHAR(50) NOT NULL,
    relation VARCHAR(50),
	age INT
);
