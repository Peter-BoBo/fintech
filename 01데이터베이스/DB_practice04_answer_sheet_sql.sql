# 문제 1
# 학생번호, 학생명, 키높이, 학과번호, 학과명 정보를 출력합니다
select * from student; # N
select * from department; # 1

select student_id, student_name, height, s.department_id, department_name
FROM department d
LEFT JOIN student s
ON d.department_id = s.department_id;
#LEFT JOIN_department를 왼쪽에 넣어야 하는 이유? 더 많은 컬럼 보유한 테이블을 기준으로 하기 
#department_id는 중복이니 s. 이나 d.을 붙이자.
# 문제 2 가교수의 교수아이디를 출력하세요.
select professor_id FROM professor WHERE professor_name='가교수';

# 문제 3
# 학과이름별 교수의 수를 출력하세요.

SELECT * FROM department;
SELECT * FROM professor;

SELECT department_name, count(professor_id) 
FROM professor p  
LEFT JOIN department d 
ON p.department_id = d.department_id
GROUP BY department_name;

# 문제 4
# '정보통신공학'과의 학생정보를 출력하세요.
select student_id, student_name, height, s.department_id, department_name 
from student s LEFT JOIN department d
ON s.department_id = d.department_id
WHERE department_name = '정보통신공학';

# 문제 5. '정보통신공학'과의 교수명을 출력하세요.

select professor_id, professor_name, p.department_id, department_name
FROM professor p LEFT JOIN department d
ON p.department_id = d.department_id
WHERE department_name = '정보통신공학';

# 문제 6. 학생 중 성이 '아'인 학생이 속한 학과명과 학생명을 출력하세요.alter

SELECT student_name, department_name 
FROM student s
LEFT JOIN department d
ON s.department_id = d.department_id
WHERE student_name LIKE '아%';

# 문제 7. 키카 180~190사이에 속하는 학생 수를 출력하세요.

SELECT count(student_id)
FROM student
WHERE height BETWEEN 180 AND 190;

# 문제 8. 학과 이름별 키의 최고값, 평균값을 출력하세요.

SELECT department_name, MAX(height), AVG(height)
FROM student s
LEFT JOIN department d
ON s.department_id = d.department_id
GROUP BY department_name;

# 문제 9. '다길동' 학생과 같은 학과에 속한 학생의 이름을 출력하세요. (쪼개서 생각하기)
# **********티스토리에 상세히 기록하자**********
SELECT * FROM student WHERE student_name='다길동';
SELECT student_name FROM student WHERE department_id=1;

# 서브쿼리: 1개의 SQL 문장 안에 SELECT문이 2개 이상
#SELECT student_name FROM student WHERE department_id= + (SELECT department_id FROM student WHERE student_name='다길동');
#위서브쿼리를 잘 활용하면 SQL을 잘 할 수 있다.
SELECT student_name FROM student WHERE department_id=(SELECT department_id FROM student WHERE student_name='다길동');

# 문제10. 2016 11월 시작하는 과목을 수강하는 학생의 이름과 수강과목을 출력하세요.

SELECT student_name, course_name FROM student s 
LEFT JOIN student_course sc
ON s.student_id = sc.student_id
LEFT JOIN course c
ON sc.course_id = c.course_id
WHERE start_date like "2016-11%";
# 날짜 like 잘 기억해두기
# 다시풀자 이거 티스토리에! (student_course 인설트에 중복값있어서 이상하게 나옴!)

# 문제 11. '데이터베이스 입문' 과목을 수강신청한 학생의 이름은?

SELECT student_name FROM student s 
LEFT JOIN student_course sc
ON s.student_id = sc.student_id
LEFT JOIN course c
ON sc.course_id = c.course_id
WHERE course_name = '데이터베이스 입문';

# 문제 12. '빌게이츠' 교수의 과목을 수강신청한 학생수는?

SELECT * FROM student s
LEFT JOIN department d
ON s.department_id = d.department_id
WHERE professor_name='빌게이츠'; # course_id = 4

SELECT course_id FROM professor p
LEFT JOIN course c
ON p.professor_id = c.professor_id
WHERE professor_name='빌게이츠'; 

SELECT count(*) FROM student s LEFT JOIN student_course sc
ON s.student_id=sc.student.id
where course_id=(SELECT course_id FROM professor p
LEFT JOIN course c
ON p.professor_id = c.professor_id
WHERE professor_name='빌게이츠');

