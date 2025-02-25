USE titanic;
SHOW tables;
# 데이터 조회 명령 SELECT	FROM 컬럼명1, 컬럼명2, * FROM 테이블명;
SELECT * FROM p_info;

# 테이블에서 1개 컬럼만 조회할 때 SELECT 컬럼명1 FROM 테이블명;
SELECT Name from p_info;

# 테이블에서 2개 컬럼만 조회할 때 SELECT 컬럼명1, 컬럼명2 FROM 테이블명;
SELECT Name, Age from p_info;
DESC p_info;

# 테이블에서 데이터를 10개만 조회하고 싶을 때 SELECT * FROM 테이블명 LIMIT 10
SELECT * FROM p_info LIMIT 10;

# 조건에 맞는 데이터 검색하기 WHERE + 비교연산자, 논리 연산자
# 성별이 남자인 경우만 조회하고 싶을 때
SELECT * FROM p_info WHERE Sex != "male";

# 나이가 40세 초과인 사람만 조회
SELECT * FROM p_info WHERE Age <= 40;

# 조건을 2개 이상 줄 때 논리연산자로 묶음 and, or
# 성별이 남성이고 나이가 10세 미만인 경우
SELECT * FROM p_info where Sex="male" and Age < 10;

# 성별이 남성이거나 나이가 10세 미만인 경우
SELECT * FROM p_info where Sex="male" or Age < 10;

#성별이 여성이고 나이가 20살 이상 50세 미만인 경우
SELECT * FROM p_info where Age >= 20 and Age <50 and Sex="female";

#p_info 테이블에서 SibSp가 1이거나 Parch가 1이상인 사람
SELECT * FROM p_info where Sibsp = 1 or Parch >= 1; 

#t_info 테이블에서 Pclass가 1인 승객을 조회하시오.
DESC t_info;
SELECT * FROM t_info WHERE Pclass = 1;

#t_info 테이블에서 Pclass가 2 또는 Fare가 50초과인 승객을 조회하시오.
SELECT * FROM t_info WHERE Pclass = 2 or Fare > 50;

#Survived 테이블에서 Survived 1인 승객을 조회하시오
SELECT * FROM Survived where Survived = 1;

# IN, LIKE, BETWEEN, IS NULL, IS NOT NULL

# "Braund, Mr. Owen Harris" 에서 Owen이라는 이름을 찾고 싶을 때는 LIKE
#컴퓨터는 정확하게 일치하는 것만 찾는다! 앞에 이름으로 시작하는 Braund% 뒤에 이름으로 끝나는%Harris 
#중간 어디에나 있기만 하면 되는 %Owen%

# p_info 테이블에서 Sibsp 컬럼의 값이 1,2,3인 행을 찾으세요.
SELECT * FROM p_info WHERE Sibsp in(1,2,3);

# p_info 테이블에서 Sibsp 컬럼의 값이 0,1,2,3이 아닌 행을 찾으세요.
SELECT * FROM p_info WHERE Sibsp Not in(0,1,2,3);

#LIKE: 문자열 안에서 특정 단어를 포함한 행을 찾을 때. 
# p_info Table에서 Owen 이름 들어간 사람 찾으시오
SELECT * FROM p_info WHERE Name LIKE("Braund%");

SELECT * FROM p_info WHERE Name LIKE "Rice, Master, Eugene";
SELECT * FROM p_info WHERE Name LIKE "Rice%";
SELECT * FROM p_info WHERE Name LIKE "%Eric";
SELECT * FROM p_info WHERE Name Not LIKE "%Eric%";

# BETWEEN a and b, a이상 b이하를 찾을 때 (초과와 미만은 안 된다)
# Age 컬럼의 값이 20이상 40이하인 값 찾기
SELECT * FROM p_info WHERE Age between 20 and 40;

# p_info 테이블에서 Age의 NULL값 찾기
SELECT * FROM p_info WHERE Age IS NOT NULL;

#t_info 테이블에서 Fare가 100 이상 1000 이하인 승객을 조회하시오.
SELECT * FROM t_info WHERE Fare BETWEEN 100 AND 1000;

#t_info 테이블에서 Ticket이 PC로 시작하고 Embarked가 C 혹은 S인 승객을 조회하시오.
SELECT * FROM t_info WHERE Ticket LIKE "pc%" AND Embarked IN("C", "S");

#t_info 테이블에서 Pclass가 1혹은 2인 승객을 조회하시오.
SELECT * FROM t_info WHERE Pclass in (1,2);

#t_info 테이블에서 Cabin에 숫자 59가 포함된 승객을 조회하시오.
# "1","2", C1, C2, C1.0 => 문자
SELECT * FROM t_info WHERE Cabin like "%59%";

#p_info 테이블에서 Age가 Null이 아니면서 이름에 James가 포함된 40세 이상의 남성을 조회하시오. (조건 하나씩 결과;를 보면서 이어나가기! 차근차근!)
SELECT * FROM p_info WHERE Age IS NOT NULL AND NAME LIKE "%James%" AND Age >= 40 AND Sex="male";
SELECT * FROM p_info WHERE NAME LIKE "%James%" AND Age >= 40 AND Sex="male";


# 데이터의 순서 정렬하기 ORDER BY
# SELECT * FROM 테이블명 WHERE 컬럼명 + 조건 ORDER BY "기준컬럼" ASC(오름)/DESC(내림)
# p_info 테이블에서 Age가 NULL이 아니면서 이름에 Miss가 포함된 40세 이하의 여성을 조회하고 나이를 기준으로 내림차순 정렬하세요
SELECT * FROM p_info WHERE Age IS NOT NULL AND Name Like "%Miss%" AND Age <= 40 AND Sex ="female" ORDER BY Age ASC;

# GROUP BY 특정 컬럼을 기준으로 그룹 연산을 할 때 (평균, 최솟값, 최대값, 중복값 없는 행 갯수)
# SELECT 기준 컬럼명, 그룹연산 함수 FROM 테이블명 WHERE 컬럼명 GROUP BY 기준컬럼;
# 그룹연산 함수 AVG()-평균, MIN()-최솟값, MAX()-최대값, COUNT()-행 갯수
# p_info 테이블에서 나이가 NULL이 아닌 행의 성별별 나이 평균을 구하시오.
SELECT Sex, AVG(Age) FROM p_info WHERE AGE IS NOT NULL GROUP BY Sex;

# 그룹 연산 후의 결과(GROUP BY 후)에서 특정 조건을 충족하는 행을 찾고 싶을 때 HAVING
# GROUP BY 연산 이후의 과정이기 때문에, WHERE(GROUP BY와 함께 쓸 수 없다) 명령어를 사용하지 않는다.
# t_info 테이블에서 Pclass별 Fare 가격 평균을 구하고 그 중 가격 평균이 50을 초과하는 결과만 조회하시오.
SELECT Pclass, AVG(Fare) FROM t_info GROUP BY Pclass HAVING AVG(Fare) > 50;

