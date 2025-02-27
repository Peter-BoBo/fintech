#1. passenger, ticket, survived 테이블을 조인하고 Survived가 1인 사람들만 찾아서 Name, Age, Sex, Pclass, survived 컬럼을 출력하시오.
USE titanic;
SHOW Tables;
SELECT p.PassengerId, Name, Age, Sex, Pclass, Survived 
FROM passenger p 
INNER JOIN ticket t ON p.PassengerId = t.PassengerId 
INNER JOIN survived s ON p.PassengerId = s.PassengerId 
WHERE Survived = 1;

#2. 1의 결과를 10개만 출력하시오.
SELECT p.PassengerId, Name, Age, Sex, Pclass, Survived FROM passenger p INNER JOIN ticket t ON p.PassengerId = t.PassengerId INNER JOIN survived s ON p.PassengerId = s.PassengerId WHERE Survived = 10;
#추출되는 10개의 기준은? 특정한 조건이 무엇인지?

#3. Passenger 테이블을 기준 ticket, survived테이블을 LEFT JOIN 한 결과에서 
#성별이 여성이면서 Pclass가 1인 사람 중 생존자(survived=1)를 찾아 이름, 성별, Pclass를 표시하시오.
SELECT Name, Age, Sex, Pclass, survived FROM passenger p 
LEFT JOIN ticket t ON p.PassengerId = t.PassengerId
LEFT JOIN survived s ON p.PassengerId = s.PassengerId
WHERE Sex = "Female" AND Pclass = 1 AND = Survived = 1;

SELECT p.PassengerId, Name, Sex, Pclass FROM passenger p 
LEFT JOIN ticket t ON p.PassengerId = t.PassengerId 
LEFT JOIN survived s ON p.PassengerId = s.PassengerId 
WHERE Sex = "Female" AND Pclass = 1 AND Survived = 1;

#4. passenger, ticket, survived 테이블을 left join 후 
#나이가 10세 이상 20세 이하 이면서 Pclass 2인 사람 중 생존자를  표시하시오.
SELECT * FROM passenger p 
LEFT JOIN ticket t ON p.PassengerId = t.PassengerId 
LEFT JOIN survived s ON p.PassengerId = s.PassengerId 
WHERE Age BETWEEN 10 AND 20 AND Pclass = 2 AND Survived = 1;

#SELECT * FROM passenger p 
#LEFT JOIN ticket t ON p.PassengerId = t.PassengerId 
#LEFT JOIN survived s ON p.PassengerId = s.PassengerId 
#Where (Age BETWEEN 10 AND 20 AND Pclass = 2) AND Survived = 1;

#5. passenger, ticket, survived 테이블을 left join 후 
#성별이 여성 또는 Pclass 가 1인 사람 중 생존자를 표시하시오.

SELECT Name, Age, Sex, Pclass, survived FROM passenger p 
LEFT JOIN ticket t ON p.PassengerId = t.PassengerId
LEFT JOIN survived s ON p.PassengerId = s.PassengerId
WHERE (Sex="Female" OR  Pclass = 1) AND Survived = 1;

#SELECT * FROM passenger p 
#LEFT JOIN ticket t ON p.passengerId = t.PassengerId 
#LEFT JOIN survived s ON p.PassengerId = s.PassengerId 
#WHERE (Sex = "Female" OR Pclass = 1) AND Survived = 1;

#6.  passenger, ticket, survived 테이블을 left join 후 
#생존자 중에서 이름에 Mrs가 포함된 사람을 찾아 이름, Pclass, 나이, Parch, Survived 를 표시하시오.
SELECT Name, Pclass, Age, Survived 
FROM passenger p 
LEFT JOIN ticket t ON p.PassengerId = t.PassengerId 
LEFT JOIN survived s ON p.PassengerId = s.PassengerId 
WHERE Survived=1 AND NAME LIKE "%Mrs%";

#7. passenger, ticket, survived 테이블을 left join 후 
#Pclass가 1, 2이고 Embarked가 s, c 인 사람중에서 생존자를 찾아 이름, 성별, 나이를 표시하시오.
SELECT Name, Sex, Age FROM passenger p 
LEFT JOIN ticket t ON p.PassengerId = t.PassengerId 
LEFT JOIN survived s ON p.PassengerId = s.PassengerId 
WHERE (Pclass IN(1, 2) AND Embarked IN("s", "c")) AND Survived = 1;

#8. passenger, ticket, survived 테이블을 left join 후 
#이름에 James가 들어간 사람중 생존자를 찾아 이름, 성별, 나이 를 표시하고 나이를 기준으로 내림차순 정렬하시오.
SELECT Name, Sex, Age FROM passenger p 
LEFT JOIN ticket t ON p.PassengerId = t.PassengerId 
LEFT JOIN survived s ON p.PassengerId = s.PassengerId 
WHERE NAME LIKE "%James%" AND Survived =1 ORDER BY AGE DESC;

#9. passenger, ticket, survived 테이블을 
#INNER JOIN한 데이터에서 성별별, 생존자의 숫자를 구하시오-> GROUP BY, COUNT ()
#생존자 숫자 결과는 별칭을 Total로 하시오 AS Total

SELECT Sex, count(Survived) Total FROM passenger p 
INNER JOIN ticket t ON p.PassengerId = t.PassengerId 
INNER JOIN survived s ON p.PassengerId = s.PassengerId
WHERE Survived = 1
Group By Sex;

#조건문은 WHERE로만 넣을 수 있다.


#10. passenger, ticket, survived 테이블을 INNER JOIN한 데이터에서 
#성별별, 생존자의 숫자, 생존자 나이의 평균을 구하시오. 
#생존자 숫자 결과는 별칭을 Total로 하시오.
SELECT Sex, count(Survived) Total, avg(Age) FROM passenger p 
INNER JOIN ticket t ON p.PassengerId = t.PassengerId 
INNER JOIN survived s ON p.PassengerId = s.PassengerId
WHERE Survived = 1
Group By Sex;

SELECT * FROM passenger p 
INNER JOIN ticket t ON p.PassengerId = t.PassengerId 
INNER JOIN survived s ON p.PassengerId = s.PassengerId
WHERE Survived = 1;

#11. passenger, ticket, survived 테이블을 INNER JOIN한 데이터에서
#성별별, pclass별, 생존자별로 sex, pclass, survived

#11-1. survived의 클래스별 합계
#11-2. 생존자/사망자의 나이 평균을 구하시오. 

#survived의 별칭은 is_survived로
#생존자 클래스별 합계는 별칭을 survived_total로
#생존자/사망자의 나이 평균은 별칭을 avg_age로 하시오.
#못 풀었슴다...

USE titanic
SELECT Sex, Pclass, Survived is_survivred, count(Survived) survived_total , Avg(Age) avg_age FROM passenger p 
INNER JOIN ticket t ON p.PassengerId = t.PassengerId 
INNER JOIN survived s ON p.PassengerId = s.PassengerId
GROUP BY Sex, Pclass, Survived
ORDER BY Sex, Pclass, Survived;



#SELECT  [FROM passenger p INNER JOIN ticket t ON p.PassengerId = t.PassengerId INNER JOIN survived s ON p.PassengerId = s.PassengerId] GROUP BY Sex;
