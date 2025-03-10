USE korea_exchange_rate;

SHOW Tables;

SELECT COUNT(*) FROM exchange_rate WHERE date >= "2000-05-04"; 
SELECT * FROM exchange_rate WHERE date >= "2000-01-01"
AND date <= "2020-12-31";

# 2020년 1월1일부터 12월31일까지 데이터에서 통화별 
# 현찰_살때_환율의 최소, 최대, 평균가
# 각각 별칭을 최저가, 최고가, 평균가로 한다.
# SQL 함수 ROUND (값, 소수점 N번째 자리)

SELECT 통화, min(현찰_살때_환율) 최저가, max(현찰_살때_환율) 최고가, round(avg(현찰_살때_환율), 2) 평균가 
FROM exchange_rate 
WHERE date >= "2020-01-01"
AND date <= "2020-12-31"
GROUP BY 통화;

use korea_stock_info;
show tables;

SELECT * FROM 2024_08_stock_price_info;
SELECT * FROM 2024_07_stock_price_info;
# 7,8월 데이터테이블을 합칠 때 월별 테이블은 고정키가 없고 
# 좌/우로 이어 붙이는 데 한계가 있기 때문에 JOIN을 쓰지 않는다.

# JOIN을 쓸 수 없으므로 UNION을 사용
# 아래로 누적해서 병합하는 명령어
select * from 2024_07_stock_price_info
UNION ALL
select * from 2024_08_stock_price_info
UNION ALL
select * from 2024_09_stock_price_info;

# UNION 테이블 조회 결과를 그대로 활용해서 새로운 테이블을 만드는 방법
# CREATE table 테이블명 AS UNION 코드
CREATE table sotck_2024_all AS
select * from 2024_07_stock_price_info
UNION ALL
select * from 2024_08_stock_price_info
UNION ALL
select * from 2024_09_stock_price_info;

#############################################################

# SQL 함수
# SELECT 함수(값) MIN(), MAX()

# 절대값 ABS()
SELECT ABS(-34), ABS(1), ABS(-256);

# 문자열의 길이 측정: LENGTH(문자열);
# 문자와 문자열의 차이: "문자" ㅣ문ㅣ자ㅣ열ㅣ (문자열은 문자 하나하나가 '줄을 서' 있는 것)

# 모든 프로그래밍 언어에서 '공백'은 문자로 인식한다
# 프로그래밍 환경에서는 '우리 눈에 보이는 것'그대로 컴퓨터가 인식하지 않는다
# 따라서 LENGTH는 상당히 많이 사용하는 함수이다.
SELECT LENGTH("my  sql");

# 반올림 함수 round()
SELECT round(3.14567, 2);
SELECT round(3.14467, 2);

# 올림 함수 ceil, 내림 floor (0보다 크면/작으면 올린다/내린다)
select ceil(4.1);
select floor(4.9);

# 연산자를 통한 계산 +, -, *, /, %,mod(나머지), div(몫)
select 7/2;
select 7*2;
select 7+2;
select 7-2;
select 7%2;
select 7 div 2;
select 7 mod 2;

# power(제곱), sqrt(루트), sign(음수양수) 확인
select power(4, 3);
select sqrt(9);
select sign(3), sign(-78);

# truncate(값, 자릿수) 버림함수
select round(2.2345, 3), truncate(2.2345, 3);
select round(1153.2345, -2), truncate(1153.2345, -2);

# 문자열 함수
# 문자의 길이를 알아보는 함수 char_length
select char_length('mysql'), length('mysql');
select char_length('   '), length('동');
#length 사용할 때, 한글은 한 자당 3자로 취급된다.

# 문자를 연결하는 함수 concat(텍스트1, 텍스트2 ...): 문자 단순연결
# concat_ws(구분절, 텍스트1, 텍스트2 ...): 문자 사이마다 구분절을 두고 연결 
# 자료 자체에 특정한 자료를 넣치않고 
select concat('this', 'is', 'mysql') as concat1;
select concat(' this', ' is ', 'mysql ') as concat1;
select concat('this', null, 'mysql ')as concat1;
select concat_ws(' VS ', '헐크', '아이언맨', '타노스') as concat1;

# 대문자를 소문자로 lower(), 소문자를 대문자로 upper()
select lower('ABcd');
select upper('efgh');

# 문자열의 자릿수를 일정하게 하고 빈 공간을 지정한 문자로 세우는 함수
# lpad(값, 자릿수, 채울문자), rpad(값, 자릿수, 채울문자)
select lpad('sql', 7 , "=");

select rpad('sql', 7 , "=");

# 공백을 없애는 함수 ltrim(문자열): 좌측공백 삭제, rtrim(문자열):우측공백 삭제
select ltrim('   SQL   ');
select rtrim('   SQL   ');
# trim(문자열): 문자열의 앞 뒤 공백을 삭제
select trim('   SQL  ');
# 문자열 사이에 있는 공백은 삭제할 수 없다. 문자열 사이에 공백이 있다면, 이미 그 공백은 하나의 문자로 인식되기 떄문이다.
select trim('   My SQL  ');
select trim('   My SQL STUDY  ');

# 문자열을 잘라내는 함수 left(문자열, 길이), right(문자열, 길이)
select left('this is my sql', 4), right('this is my sql', 5);
select left('이것이 mysql이다.', 5), right('이것이 mysql이다.', 5);

# 문자열을 중간에서 잘라내는 함수 substr(문자열, 시작위치, 길이)
select substr('this is my sql', 6, 5);
# 길이를 지정하지 않으면 시작위치에서 문자열의 끝까지 출력한다.
select substr('this is my sql', 6);

# 문자열의 공백을 앞 뒤로 삭제하고 문자열 앞 뒤에 포함된 특정 문자도 삭제하는 함수
# trim(leading '삭제할 문자' from, 전체 문자열): 문자열 앞 삭제
# trim(trailing '삭제할 문자' from, 전체 문자열):문자열 뒤 삭제
# trim(both '삭제할 문자' from, 전체 문자열):문자열 앞 뒤 모두 삭제
select trim('   my sql    ');
select trim(leading '*' from '****my sql****');
select trim(trailing '*' from '****my sql****');
select trim(both '*' from '****my sql****');
select trim(both '*' from '*dwnbkj***my * sql**dwn**');

# 날짜형 함수
select curdate(); # 현재 년월일
select curtime(); # 현재 시간
select now(); #현재 년월일 + 현재 시간
select current_timestamp(); #현재 년월일 + 현재 시간

# 영문 요일 표시 함수 
select dayname(now());
select dayname("2025-10-09");

# 요일을 번호로 표시 
# dayofweek(날짜), 일(1), 월(2), 화(3), 수(4), 목(5), 금(6), 토(7)
select dayofweek(now());
select dayofweek("2024-5-5");

# 1년 중 오늘이 몇 일째인지 dayofyear(날짜)
select dayofyear(now());
select dayofyear("2025-5-8");

# 날짜를 세분화해서 보는 함수들
# 현재 달의 마지막 날이 몇 일까지 있는지
select last_day(now());
select last_day("2025-10-01");

# 입력한 날짜에서 연도만 추출
select year (now());
select year ("2025-10-01");

# 입력한 날짜에서 월만 출력
select month (now());
select month ("2025-10-01");

# 입력한 날짜에서 월만 영어로 출력
select monthname("2025-10-01");

# 몇 분기인지 출력
select quarter(now());
select quarter("2025-10-01");

# 몇 주차인지
select weekofyear(now());
select weekofyear("2025-12-25");

# 날짜와 시간이 같이 있는 데이터에서 날짜와 시간을 구분해주는 함수
select now();
select date(now());
select time(now());

# 날짜를 지정한 날 수 만큼 더하는 함수 
#date_add(날짜, interval 더할 날 수 day);
#adddate(날짜, 더할 날 수);

select date_add("2025-12-25", interval 5 day);
select adddate(now(), 5);

# 날짜를 지정한 날 수 만큼 빼는 함수
# subdate(날짜, interval 뺄 날 수 day); 날짜 뒤에 바로 숫자를 넣어도 빼진다
select subdate(now(), interval 5 day);
select subdate(now(), 5);

# 날짜와 시간을 년월, 날 시간, 분초 단위로 추출하는 함수
# extract(옵션, from 날짜시간)
select extract(year_month from now());
select extract(day_hour from now());
select extract(minute_second from now());


# 날짜 1에서 날짜 2를 뺀 일 수 계산하는 함수
# datediff(날짜1, 날짜2)
select datediff(now(), '2024-12-25');

# 날짜 포멧 함수 - 지정한 형식에 맞춰서 출력해주는 함수
# %Y 4자리 연도, %y 2자리 연도
# %M 월의 영문표기, %m 2자리 월 표시, %b 월의 축약 영문표기
# %d 2자리 일 표기, %e 1자리 일 표기 (두 자리수 날짜는 그대로 표기하나, 한 자리 수일 때 앞에 0을 붙이지 않는다.
select date_format(now(), '%d-%b-%Y');
select date_format('2025-01-01', '%d-%M-%Y');
select date_format('2025-01-01', '%d-%m-%y');
select date_format('2025-01-01', '%e-%m-%y');

# 시간 표기
# %H 24시간, %h 12시간, %p AM, PM 표시
# %i 2자리 분 표기
# %S 2자리 초
# %T 24시간 표기법 시:분:초
# %r 12시간 표기법 시:분:초 AM/PM
# %W 요일의 영문표기, %w 숫자로 요일 표시 (일0, 월1, 화2, 수3, 목4, 금5, 토6)
select date_format(now(), '%H:%i:%S');
select date_format(now(), '%p %h:%i:%S');
select date_format(now(), '%T');
select date_format(now(), '%r');
select date_format(now(), '%w %r');
select date_format("2025-02-23 17:23:54", '%w %r');

select extract(DAY_HOUR from "2025-02-23 17:23:54:);
select now();
select extract(DAY_HOUR from now()) dayhour;