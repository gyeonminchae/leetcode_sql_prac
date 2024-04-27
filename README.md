# leetcode_sql_prac

# 테이블 데이터 조회
~~~~sql
SELECT 컬럼명, 집계함수 as 별명   -----------(5)
FROM 테이블명                  -----------(1)
WHERE 테이블 조건               -----------(2)
GROUP BY 컬럼명                -----------(3)
HAVING 그룹 조건                -----------(4)
ORDER BY 컬럼명                -----------(6)
LIMIT 숫자
~~~~
**<U>순서: FROM and JOIN -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY desc -> LIMIT</U>**
1) FROM: SQL은 구문이 들어오면 테이블을 가장 먼저 확인한다.
2) WHERE: 테이블명을 확인 뒤, 테이블에서 주어진 조건에 맞는 데이터들을 추출한다.
3) GROUP BY: 조건에 맞는 데이터가 추출한 뒤, 공통적인 데이터들끼리 묶어 그룹을 만들어 준다.
4) HAVING: 공통적인 데이터들이 묶여진 그룹 중, 주어진 조건에 맞는 그룹들을 추출한다.
5) SELECT: 최종적으로 추출된 데이터들을 (또 함수로 묶어 계산결과를) 조회한다.
6) ORDER BY: 추출된 데이터들을 정렬해준다.
7) LIMIT: 출력 개수 제한

EX)
~~~~sql
select 필드1, 필드2, sum(필드명) as 별명
from 테이블명
where 필드명1 = 값 (조건)
group by 필드명1
having 별명 > 100 (그룹 조건)
order by 필드명2 desc (정렬)
~~~~
1. from 테이블명에서
2. where 필드명1이 값을 만족하는 것만 (select문에 집계함수가 있든없든 무조건 where조건부터 맞추고 집계함.)
3. group by 그룹핑
4. having 그룹 집계용 조건
5. 필드1, 필드2와 집계함수 결과값을 선택하고 as 별명을 지정
6. order 정렬

## **그룹핑 추가 정리**
1) 그룹핑은 sum() or avg()같은 **묶음데이터들을 통계** 낼때 사용
2) 그룹화 한 것들은 따로 조건 줄땐 where가 아닌 having으로 써야한다.
   - whwere은 그룹핑 전 테이블을 제어
   - having은 그룹핑 후 테이블을 제어

## **논리 연산자**
### 1) AND, OR
~~~~sql
SELECT TRUE OR FALSE AND FALSE; // 1
SELECT (TRUE OR FALSE) AND FALSE; // 0
~~~~
* 여러 조건이 필요한 경우 논리 연산자 사용
* AND가 OR 보다 우선 순위를 가진다.
* MySQL에서는 && 나 ||도 사용 가능

### 2) IN
~~~~sql
SELECT * FROM member
   WHERE addr IN('경기', '전남', '경남');

SELECT * FROM member
   WHERE addr = '경기' AND addr = '전남' AND addr = '경남';
~~~~
* IN()연산자를 이용하여 특정 값이 포함된 데이터를 조회할 수 있다.
* IN 연산자는 동등비교 '='를 여러번 수행하는 효과를 가진다. 따라서 인덱스를 최적으로 활용할 수 있다.

### 3) LIKE
~~~~sql
SELECT * FROM member WHERE mem_name LIKE '블___';

SELECT * FROM member WHERE mem_name LIKE '블%';

SELECT * FROM member WHERE mem_name LIKE '%블%';
~~~~
* 문자열의 일부 글자 검색
  - _:한 글자만
  - %: 몇 글자든
 
## ** 집계 함수 **
1) SUM(): 컬럼의 합계를 반환
2) AVG(): 컬럼의 평균을 반환
3) MIN(): 컬럼의 최소값을 반환
4) MAX(): 컬럼의 최대값을 반환
5) COUNT(): 행의 개수를 셈
6) COUNT(DISTINCT): 행의 개수를 셈
7) STDEV():표준 편차
8) VARIANCE():분산

### COUNT()
~~~~sql
SELECT COUNT(*)
   FROM member;

SELECT COUNT(phone1)
   FROM member;
~~~~
* COUNT(*) 연산은 모든 row를 대상으로 이루어지기 때문에 NULL값이 포함되어있어도 카운트됨
* COUNT(컬럼명)연산은 컬럼명값에 NULL이 있을 경우 카운트하지 않음

## **범위 표현식**
### 1) BETWEEN
~~~~sql
SELECT * FROM member
   WHERE height between 160 and 165;
~~~~
* between 연산자를 이용하여 특정 범위에 해당하는 데이터를 조회
* 하지만 인덱스를 사용할 수 없으므로 주의

## DATE(날짜)
### 1) NOW(), CURDATE(), CURTIME()
~~~~sql
select now(), curdate(), curtime();
~~~~
* NOW(): 현재 날짜와 시간을 반환, 반환되는 값은 'YYYY-MM-DD HH:MM:SS' or YYYYMMDDHHMMSS
* CURDATE(): 현재 날짜를 반환, 이때 반환되는 값은 'YYYY-MM-DD'or HHMMSS
* CURTIME(): 현재 시각을 반환, 이때 반환되는 값은 'HH:MM:SS' or HHMMSS

### 2) DATE() ~ SECOND()
~~~~sql
select
now(),
date(now()),
month(now()),
day(now()),
hour(now()),
minute(now()),
second(now());
~~~~
* DATE(): 전달받은 값에 해당하는 날짜 정보를 반환
* MONTH(): 월에 해당하는 값을 반환, 0~12
* DAY(): 일에 해당하는 값을 반환, 0~31
* HOUR(): 시간에 해당하는 값을 반환, 0~23
* MINUTE(): 분에 해당하는 값을 반환, 0~59
* SECOND(): 초에 해당하는 값을 반환, 0~59

### 3) MONTHNAME, DAYNAME()
~~~~sql
select
now(),
monthname(now()),
dayname(now());
~~~~
* MONTHNAME(): 월에 해당하는 이름을 반환
* DAYNAME(): 요일에 해당하는 이름을 반환

### 4) DAYOFWEEK(), DAYOFMONTH(), DAYOFYEAR()
~~~~sql
select
now(),
dayofweek(now()),
dayofmonth(now()),
dayofyear(now());
~~~~
* DAYOFWEEK(): 일자가 해당 주에서 몇번째 날인지를 반환, 1부터 7사이의 값을 반환
* DAYOFMONTH(): 일자가 해당 월에서 몇 번째 날인지를 반환, 0부터 31사이의 값을 반환
* DAYOFYEAR(): 일자가 해당 연도에서 몇 번째 날인지를 반환, 1부터 366사이의 값을 반환

### 5) DATE_FORMAT()
~~~~sql
select
date_format(now(), '%D %y %a %d %m %n %j');
~~~~
* DATE_FORMAT(): 전달받은 형식에 맞춰 날짜와 시간 정보를 문자열로 반환

## ** 기타 **
### 1) DISTINCT
~~~~sql
SELECT DISTINCT addr
   FROM member;
~~~~
* DISTINCT를 열 이름 앞에 붙이면 중복된 값은 1개만 출력된다.

### 2) 서브 쿼리
~~~~sql
SELECT mem_name, height
   FROM member
   WHERE height > (select height from member where mem_name LIKE '블루');
~~~~
* 2개의 SQL문을 하나로 만듦

##### ANY
~~~~sql
select *
from 테이블명
where 컬럼명 > ANY(
   select 컬럼명
   from 테이블명
   where 컬럼명 = 값);
~~~~
* 서브쿼리의 여러 개의 결과 중 한 가지만 만족해도 가능

##### ANY
~~~~sql
select *
from 테이블명
where 컬럼명 > ALL(
   select 컬럼명
   from 테이블명
   where 컬럼명 = 값);
~~~~
* 서브쿼리의 여러 개의 결과를 모두 만족시켜야 함.

# 다중 테이블 연산
~~~~sql
SELECT
테이블이름.조회할 컬럼명,
테이블이름.조회할 테이블
FROM 기준테이블 이름
(INNER, LEFT, RIGHT FULL) JOIN 조인할테이블 이름
ON 기준테이블이름.기준키 = 조인테이블이름.기준키;
~~~~
![image](https://github.com/gyeonminchae/leetcode_sql_prac/assets/51178411/e0fe7bef-10b7-4d57-ad7a-f0822ad5c0e0)
* INNER JOIN: 기준이 되는 테이블(left table)과 join이 걸리는 테이블(right table) 양쪽 모두에 matching되는 row만 select가 됨.
* LEFT JOIN: 기준이 되는 테이블(left table)의 모든 row와 join이 걸리는 테이블(right table)중 left table과 matching되는 row만 select가 됨.
* RIGHT JOIN: join이 걸리는 테이블(right table)의 모든 row와 기준이 되는 테이블 (left table)에서 right table과 matching되는 row만 select가 됨.
* FULL (OUTER) JOIN: 양족 모두의 모든 row를 select한다.


