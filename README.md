# leetcode_sql_prac

# 1. 테이블 데이터 조회
~~~~sql
SELECT 컬럼명, 집계함수 as 별명   -----------(5)
FROM 테이블명                  -----------(1)
WHERE 테이블 조건               -----------(2)
GROUP BY 컬럼명                -----------(3)
HAVING 그룹 조건                -----------(4)
ORDER BY 컬럼명                -----------(6)
~~~~
**<U>순서: FROM and JOIN -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY desc -> LIMIT</U>**
1) FROM: SQL은 구문이 들어오면 테이블을 가장 먼저 확인한다.
2) WHERE: 테이블명을 확인 뒤, 테이블에서 주어진 조건에 맞는 데이터들을 추출한다.
3) GROUP BY: 조건에 맞는 데이터가 추출한 뒤, 공통적인 데이터들끼리 묶어 그룹을 만들어 준다.
4) HAVING: 공통적인 데이터들이 묶여진 그룹 중, 주어진 조건에 맞는 그룹들을 추출한다.
5) SELECT: 최종적으로 추출된 데이터들을 (또 함수로 묶어 계산결과를) 조회한다.
6) ORDER BY: 추출된 데이터들을 정렬해준다.

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
