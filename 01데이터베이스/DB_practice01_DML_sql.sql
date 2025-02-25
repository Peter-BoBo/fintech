# INNER JOIN (교집합) 왼쪽, 오른쪽에 있는 테이블에서 기준 컬럼의 값이 일치하는 것만 합침.
# passenger 컬럼(왼쪽) ticket 컬럼(오른쪽)을 Inner 조인하세요.

SELECT * FROM passenger LIMIT 3;
SELECT * FROM ticket LIMIT 3;

# SELECT * FROM 테이블1명 (왼쪽) INNER JOIN 테이블2명 (오른쪽) ON 테이블 1명(왼쪽).기준컬럼명 = 테이블 2명(오른쪽).기준컬러명;
SELECT * FROM passenger INNER JOIN ticket ON passenger.PassengerId = ticket.PassengerId;

# LEFT JOIN
SELECT * FROM passenger LEFT JOIN ticket ON passenger.passengerId = ticket.passengerId;

# RIGHT JOIN
SELECT * FROM passenger RIGHT JOIN ticket ON passenger.passengerId = ticket.passengerId;

# 두 개의 테이블을 INNER JOIN 하면서 Name, Age, Pclass, Fare 컬럼만 보고 싶을 떄 (4개의 컬럼만 보고 싶을 때)
SELECT Name, Age FROM passenger;
SELECT Pclass, Fare FROM ticket;

SELECT passenger.passengerId, Name, Age, Pclass, Fare FROM passenger LEFT JOIN ticket ON passenger.PassengerId = ticket.PassengerId;

# 약칭, 별칭 AS 
SELECT p.passengerId, Name, Age, Pclass, Fare FROM passenger AS p LEFT JOIN ticket AS t ON p.PassengerId = t.PassengerId;
# AS를 생략하고 별칭주기
SELECT p.passengerId, Name, Age, Pclass, Fare FROM passenger p LEFT JOIN ticket t ON p.PassengerId = t.PassengerId;

# 3개의 테이블을 1개로 합치기 (테이블1 INNER JOIN 테이블2) INNER JOIN 테이블 3
SELECT * FROM passenger p INNER JOIN ticket t ON p.PassengerId = t.PassengerId INNER JOIN survived s ON p.PassengerId = s.PassengerId;

#INNER JOIN 외에도 LEFT/RIGHT JOIN을 어떻게 합치느냐에 따라 결과가 달라진다.

#성별이 여성이면서 


