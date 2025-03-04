USE univ_lms;
SHOW TABLES;

# 문제1. 학생번호, 학생명, 키높이, 학과번호, 학과명 정보를 출력합니다.
SELECT * FROM student;
SELECT * FROM department;

SELECT student_id, student_name, height, s.department_id, department_name 
FROM student s
LEFT JOIN department d
ON s.department_id = d.department_id;

# 문제2. '가교수' 교수의 교수아이디를 출력하세요.
SELECT professor_id FROM professor WHERE professor_name='가교수';

# 문제3. 학과이름별 교수의 수를 출력하세요.
SELECT * FROM professor;
SELECT * FROM department;

SELECT department_name, count(professor_id)
FROM professor p
LEFT JOIN department d
ON p.department_id = d.department_id
GROUP BY department_name;

# 문제4. '정보통신공학'과의 학생정보를 출력하세요.

SELECT * FROM student s
LEFT JOIN department d
ON s.department_id = d.department_id
WHERE department_name='정보통신공학';

# 문제5. '정보통신공학'과의 교수명을 출력하세요.

SELECT professor_id, professor_name, p.department_id, department_name FROM professor p
LEFT JOIN department d
ON p.department_id = d.department_id
WHERE department_name='정보통신공학';

# 문제6. 학생 중 성이 '아'인 학생이 속한 학과명과 학생명을 출력하세요.

SELECT student_name, department_name FROM student s
LEFT JOIN department d
ON s.department_id = d.department_id
WHERE student_name LIKE "아%";

# 문제7. 키카 180~190 사이에 속하는 학생 수를 출력하세요.	

SELECT count(student_id)
FROM student
WHERE height between 180 and 190;

# 문제8. 학과이름별 키의 최고값, 평균값을 출력하세요.

SELECT department_name, MAX(height), round(AVG(height), 0)
FROM student s
LEFT JOIN department d
ON s.department_id = d.department_id
GROUP BY department_name;

# 문제9. '다길동' 학생과 같은 학과에 속한 학생의 이름을 출력하세요.

SELECT student_name FROM student s
LEFT JOIN department d
ON s.department_id = d.department_id
WHERE s. department_id
=(SELECT department_id FROM student WHERE student_name='다길동');

# 문제10. 2016년 11월 시작하는 과목을 수강하는 학생의 이름과 수강과목을 출력하세요.

SELECT student_name, course_name FROM student s 
LEFT JOIN student_course sc
ON s.student_id = sc.student_id
LEFT JOIN course c
ON sc.course_id = c.course_id
WHERE start_date LIKE '2016-11%';

# 문제11. '데이터베이스 입문' 과목을 수강신청한 학생의 이름은?

SELECT student_name FROM student s 
LEFT JOIN student_course sc
ON s.student_id = sc.student_id
LEFT JOIN course c
ON sc.course_id = c.course_id
WHERE course_name = '데이터베이스 입문';

# 문제12. '빌게이츠' 교수의 과목을 수강신청한 학생수는?

SELECT count(*) FROM student s 
LEFT JOIN student_course sc
ON s.student_id = sc.student_id
WHERE course_id
=(SELECT course_id FROM professor p LEFT JOIN course c  ON p.professor_id = c.professor_id WHERE professor_name = '빌게이츠');



