# 학과 department

insert into department values(1, '수학');
insert into department values(2, '국문학');
insert into department values(3, '정보통신공학');
insert into department values(4, '모바일공학');

# 학생 student

insert into student values(1, '가길동', 177, 1);
insert into student values(2, '나길동', 178, 1);
insert into student values(3, '다길동', 179, 1);
insert into student values(4, '라길동', 180, 2);
insert into student values(5, '마길동', 170, 2);
insert into student values(6, '바길동', 172, 3);
insert into student values(7, '사길동', 166, 4);
insert into student values(8, '아길동', 192, 4);

# 교수 professor
insert into professor values(1, '가교수', 1);
insert into professor values(2, '나교수', 2);
insert into professor values(3, '다교수', 3);
insert into professor values(4, '빌게이츠', 4);
insert into professor values(5, '스티브잡스', 3);

# 개설과목 course
insert into course values(1, '교양영어', 1, '2016/9/2', '2016/11/30');
insert into course values(2, '데이터베이스 입문', 3, '2016/8/20', '2016/10/30');
insert into course values(3, '회로이론', 2, '2016/10/20', '2016/12/30');
insert into course values(4, '공업수학', 4, '2016/11/2', '2017/1/28');
insert into course values(5, '객체지향프로그래밍', 3, '2016/11/1', '2017/1/30');

# 수강 student_course
insert into student_course values(1, 1);
insert into student_course values(2, 1);
insert into student_course values(3, 2);
insert into student_course values(4, 3);
insert into student_course values(5, 4);
insert into student_course values(6, 5);
insert into student_course values(7, 5);

# 문제 1
# 학생번호, 학생명, 키높이, 학과번호, 학과명 정보를 출력합니다.
SELECT * FROM student;
SELECT * FROM department;

SELECT * FROM student s 
RIGHT JOIN department d 
ON s.department_id = s.department_id;

# 문제 2
# '가교수'교수의 교수아이디를 출력하세요.

SELECT professor_id FROM professor
WHERE professor_name = '가교수';

# 문제 3
# 학과이름별 교수의 수를 출력하세요.

SELECT * FROM department; 
SELECT * FROM professor;

SELECT department_name, count(professor_id) 
FROM department d 
RIGHT JOIN professor p 
ON d.department_id = p.department_id
GROUP BY department_name;
# 학과이름별 교수의 수는 정확하나, 예시와 조금 다르게 출력됨 (오름차순, 내림차순?)
# RIGHT JOIN 이었음

# 문제 4
# '정보통신공학'과의 학생정보를 출력하세요.

SELECT * FROM student s
LEFT JOIN department d
ON s.department_id = d.department_id
WHERE department_name = '정보통신공학';

# 문제 5
# '정보통신공학'과의 교수명을 출력하세요.

SELECT * FROM professor p
LEFT JOIN department d
ON p.department_id = d.department_id
WHERE department_name = '정보통신공학';

# 문제 6.
# 학생 중 성인 '아'인 학생이 속한 학생명과 학생명을 출력하세요.

SELECT student_name, department_name FROM student s
LEFT JOIN department d
ON s.department_id = d.department_id
WHERE student_name LIKE '아%';

# 문제 7.
# 키가 180~190 사이에 속하는 학생 수를 출력하세요

SELECT count(student_id) 
FROM student
WHERE height BETWEEN 180 AND 190;

# 문제 8.
# 학과이름별 키의 최고값, 평균값을 출력하세요.

SELECT department_name, MAX(height), AVG(height)
FROM student s
LEFT JOIN department d
ON s.department_id = d.department_id
GROUP BY department_name;
# 예제 정답예시랑 다르게 출력?



# 문제 9
# '다길동' 학생과 같은 학과에 속한 학생의 이름을 출력하세요.


#SELECT student_name FROM student s LEFT JOIN department d ON s.department_id = d.department_id
#못 풀겠다

# 문제 10
# 2016년 11월 시작하는 과목을 수강하는 학생의 이름과 수강과목을 출력하세요.

SELECT student_name, course_name FROM student s 
INNER JOIN student_course sc
ON s.student_id = sc.student_id
INNER JOIN course c
ON sc.course_id = c.course_id
WHERE start_date > '2016-11-01';

#날짜 부분 질문해...

# 문제 11
# '데이터베이스 입문' 과목을 수강신청한 학생의 이름은?

SELECT student_name FROM student s 
RIGHT JOIN student_course sc
ON s.student_id = sc.student_id
RIGHT JOIN course c
ON sc.course_id = c.course_id
WHERE course_name = '데이터베이스 입문';

# 문제 12
# '빌게이츠' 교수의 과목을 수강신청한 학생수는

select count(*) from student s LEFT JOIN student_course sc
ON s.student_id=sc.student_id 
where course_id=(select course_id from professor p LEFT JOIN course c
on p.professor_id = c.professor_id
where professor_name='빌게이츠');
