-- 과정 1.
/*
[Entities]
- Member

[Member Properties]
- student_id 		VARCHAR(10) PRIMARY KEY
- name 				VARCHAR(20)
- department 		VARCHAR(50)
- phone 			VARCHAR(15)
- join_date 		DATE
*/


-- 과정 4.
CREATE TABLE ClubMember (
    student_id VARCHAR(10) PRIMARY KEY, 	-- 학번
    name VARCHAR(20),         				-- 이름
    department VARCHAR(50),    			    -- 학과
    phone VARCHAR(15),          			-- 연락처
    join_date DATE			    			-- 가입일
);

INSERT INTO ClubMember (student_id, name, department, phone, join_date) VALUES
	('20210001', '김철수', '소프트웨어학과', '010-1234-5678', '2026-03-02'),
	('20210002', '이영희', '컴퓨터공학과', '010-2345-6789', '2026-03-05'),
	('20220015', '박지민', '전자공학과', '010-3456-7890', '2026-03-10'),
	('20230042', '최수연', '소프트웨어학과', '010-4567-8901', '2026-03-12'),
	('20200088', '한강호', '경영학과', '010-5678-9012', '2026-03-15');

-- a. 전체 조회
SELECT * FROM ClubMember;

-- b. 정렬 (ORDER BY)
SELECT * FROM ClubMember
ORDER BY join_date DESC;

-- c. 조건 검색 (WHERE)
SELECT name, student_id, phone 
FROM ClubMember 
WHERE department = '소프트웨어학과';