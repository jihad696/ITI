use university_project


ALTER TABLE student_scholarship
 
ADD CONSTRAINT FK_id FOREIGN KEY (student_id) REFERENCES student(student_id);
Alter table student_scholarship
ADD CONSTRAINT FK_s FOREIGN KEY (scholarship_id) REFERENCES scholarship(scholarship_id);



ALTER TABLE professor_course 

 ADD CONSTRAINT FK_p FOREIGN KEY (professor_id) REFERENCES  professor(professor_id);
 ALTER TABLE professor_course
 ADD CONSTRAINT FK_ccourse__id FOREIGN KEY (course_code) REFERENCES  course(code);


ALTER TABLE department 

ADD CONSTRAINT FK_professor_id FOREIGN KEY (professor_id) REFERENCES  professor(professor_id);
ALTER TABLE department
ADD CONSTRAINT FK_facultycode FOREIGN KEY (faculty_id) REFERENCES  faculty(faculty_id);


ALTER TABLE department_location
ADD
CONSTRAINT FK_dep_id FOREIGN KEY (dep_id) REFERENCES  department(dep_id);


ALTER TABLE department_course 
ADD CONSTRAINT FK_dep_course_id FOREIGN KEY (dep_id) REFERENCES  department(dep_id);
ALTER TABLE department_course 

ADD CONSTRAINT FK_code FOREIGN KEY (code) REFERENCES  course(code);


ALTER TABLE event_department



ADD CONSTRAINT FK_eventid FOREIGN KEY (event_id) REFERENCES  event(event_id);
ALTER TABLE event_department

ADD CONSTRAINT FK_event_dep_id FOREIGN KEY (dep_id) REFERENCES  department(dep_id);


ALTER TABLE stuff_department 

ADD CONSTRAINT FK_department_id FOREIGN KEY (dep_id) REFERENCES  department(dep_id);
ALTER TABLE stuff_department 
ADD CONSTRAINT FK_stuff FOREIGN KEY (stuff_id) REFERENCES  stuff(stuff_id);


ALTER TABLE exam_course_student 

ADD CONSTRAINT FK_exam_id FOREIGN KEY (exam_id) REFERENCES  exam(exam_id);
ALTER TABLE exam_course_student 

ADD CONSTRAINT FK_course_id FOREIGN KEY (course_code) REFERENCES  course(code);
ALTER TABLE exam_course_student 

ADD CONSTRAINT FK_student_id FOREIGN KEY (student_id) REFERENCES  student(student_id);


ALTER TABLE faculty

ADD CONSTRAINT FK_faculty_id FOREIGN KEY (professor_id) REFERENCES  professor(professor_id);
ALTER TABLE faculty

ADD CONSTRAINT FK_hall_number FOREIGN KEY (hall_id) REFERENCES  lecture_hall(hall_id);

ALTER TABLE dependent

ADD CONSTRAINT FK_faculty_professor_id FOREIGN KEY (professor_id) REFERENCES  professor(professor_id);

ALTER TABLE student_professor_project

ADD CONSTRAINT FK_sid FOREIGN KEY (student_id) REFERENCES student(student_id);
ALTER TABLE student_professor_project

ADD CONSTRAINT FK_pid FOREIGN KEY (professor_id) REFERENCES professor(professor_id);
ALTER TABLE student_professor_project

ADD CONSTRAINT FK_ppid FOREIGN KEY (project_id) REFERENCES project(project_id);


ALTER TABLE professor
ADD
CONSTRAINT FK_head_of_department FOREIGN KEY (dep_id) REFERENCES department(dep_id);

ALTER TABLE student_scholarship
ADD CONSTRAINT FK_student_id FOREIGN KEY (student_id) REFERENCES student(student_id);
ALTER TABLE student_scholarship

ADD CONSTRAINT FK_scholarship_id FOREIGN KEY (scholarship_id) REFERENCES scholarship(scholarship_id);

