DROP TABLE Professor;

CREATE TABLE Professor (
    professor_id int PRIMARY KEY,
	professor_name varchar(100),
	department varchar(100),
	salary numeric,
	salary_level numeric,
	hire_date date
);

CREATE TABLE Student (
	student_id int PRIMARY KEY,
	student_name varchar(100),
	major varchar(100)
);

'''
COURSE 		| SECTION
course_id 	| 과목번호
section_id 	| 분반번호
name		| 과목이름
'''

CREATE TABLE Course (
	course_id int,
	section_id int,
	professor_id int,
	course_name varchar(100),
	PRIMARY KEY (course_id, section_id),  -- 복합키
	FOREIGN KEY (professor_id) REFERENCES Professor (professor_id)
);

'''
수강
grade					| 성적
enrolled_at				| 신청일
student_id + course_id  | 복합키
'''

CREATE TABLE Enrollment (
	student_id int,
	course_id int,
	grade varchar(2),
	points numeric, -- 99.65
	enrolled_at DATE,
	PRIMARY KEY (student_id, course_id),
	FOREIGN KEY (student_id) REFERENCES Student(student_id)
	-- FOREIGN KEY (course_id) REFERENCES Course(course_id) -- Course의 복합키 땜에 오류
);

