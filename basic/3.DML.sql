-- 테이블에 새로운 레코드를 추가
INSERT INTO 테이블이름(필드이름1, 필드이름2, 필드이름3) values (데이터값1,
데이터값2, 데이터값3)

insert into author(id, name, email) values(1, 'kim', 'abc@naver.com');

-- update
테이블 레코드의 내용을 수정
update 테이블이름 set 필드이름1=데이터값1, 필드이름2=데이터값2,... where 필드 이름
update author set email='abc2@test.com'where id=1;

DELETE from author where author_id=5;

-- SELECT
SELECT *FROM 테이블이름 [WHERE조건]

모든필드선택
SELECT *FROM author
select *from author where id=1;
select name from author;
select *from author where id>10;
select *from author where id>10 and name ='abc';

-- 이름 중복제거하고 조회
select distinct name from author;

-- order by
-- 기본 설정은 오름차순 asc 이며 내림차순시 desc
-- 여러 필드의 데이터를 쉼표(,)를 사용하여 여러기준으로 정렬할 수 있음
-- order by 생략시 pk를 기준으로 오름차순 정렬하여 결과값 반환
--  select  from author limit number : 반환할 행의 최대 수를 지정
select * from author order by name desc;

-- order by 멀티 : 먼저쓴컬럼 우선 정렬, asc/desc 생략시 asc 적용
select * from author order by name desc, email desc;

-- limit number : 특정숫자로 결과값 개수 제한
select * from author order by name desc limit 2;

-- 별칭(alias)을 이용한 처리
-- 테이블과 필드에 임시로 별칭을 부여하고, 해당 별칭을 select 문에서 사용
-- select 필드이름 as 별칭 from 테이블 이름:
-- select 필드이름 from 테이블이름 as 별칭;

-- alias를 이용한 select문 as는 생략가능
select name as 이름 from author;
select name, email from author as a;

-- 테이블의 타입확인
-- DESCRIBE 테이블명;

-- 숫자타입
-- 정수
-- TINYINT
-- -128 ~127 범위, 1바이트
-- JAVA의 BYTE와 매핑
-- INT
-- 4바이트
-- JAVA의 INT타입과 매핑
-- BIGINT
-- 8바이트
-- JAVA의 LONG타입과 매핑
-- UNSIGNED 타입을 사용하여 양수만 표현가능
-- TINYINT UNSIGNED 이렇게 사용한다면 255까지 사용가능 EX)나이

-- 타입(data type) - 숫자
-- 실수
-- 부동소수점 타입
-- FLOAT, DOUBLE
-- 오차가 발생할 여지가 있음
-- 고정 소수점 타입
-- DECIMAL(M,D)
-- java의 Bigdecimal
-- M은 총자릿수 (정수부+소수부)를 의미하고, 65자리까지 표현가능
-- D는 소수부 의미
-- 정확한 숫자 표현을 위해 사용

-- 타입(data type) - 문자타입
-- CHAR와 varchar
-- CHAR(255)
-- M은 문자열의 최대 길이를 의미
-- 고정길이의 문자열(0~255까지 설정가능)
-- 정해진 자릿수 문자에 제한을 두기 위해서는 사용
-- VACHAR(255) -> 10바이트 -> 10바이트 차지

-- VARCHAR(M)
-- java의 string사용시 varchar
-- 0부터 65,535까지 설정가능
-- 가변 길이의 문자열(M을 통해 길이지정)
-- 길이를 지정하더라도 실제 입력된 문자열의 길이만큼만 저장하고 사용
-- 일반적으로 가장 많이 사용

-- TXET
-- 65,535바이트 저장 가능한 가변 길이 문자열을 위한 타입
-- VACHAR보다 더 큰 범위의 표현이 가능 ex)LONGTEXT는 4GB
-- disk에 저장해서 조회속도가 varchar(메모리저장)에 비해 느림
-- index사용의 어려움(B-tree인덱싱 불가, Full-Text인덱스 가능)

-- 타입(data type) - 문자타입
-- BLOB(longblob)
-- 다양한 크기의 바이너리 데이터를 저장할 수 있는 타입
-- 일반적으로 PNG 와 같은 이미지 파일을 저장할 때 지정하는 타입
-- 예시)
-- INSERT INTO table_blob (id, myimg) VALUES(1, LOAD_FILE('C:\\test_picture.jpg')
-- SELECT HEX(myimg) from table_blob where id = 1;

-- ENUM
-- 미리 들어갈 수 있는 특정 데이터의 값을 지정
-- 컬럼명 enum('데이터값1', '데이터값2'...)
-- not null default 'user'등의 옵션도 추가기능

-- 타입(data type) - 날짜와 시간
-- DATE
-- 날짜를 저장할 수 있는 타입
-- 'YYYY-MM--DD'
-- DATETIME(m)
-- 날짜와 함께 시간까지 저장, m지정시 소수점 microseconds
-- 'YYYY-MM-DD HH:MM:SS'
-- 가장많이 사용
-- java의 Localdatetime과 sync

-- DATETIME DEFAULT CURRENT_TIMESTAMP
-- 현재시간을 default로 삽입하는 형식

-- 비교연산자
-- =
-- !=,<>
-- <,<=,>,>=
-- IS NULL, IS NOT NULL
-- BETWEEN min AND max
-- 피연산자의 값이 min 값보다 크거나 max 작으면 참을 반환함.(이상 이하)
-- IN(), NOT IN()

-- 논리연산자
-- AND &&
-- or ||
-- not !

-- LIKE
-- 특정 패턴을 포함하는 데이터만을 검색하기 위한 와일드 카드(WILDCARD) 문자
-- 일반적으로 %와 함께 사용됨
-- SELECT * FROM author WHERE name LIKE '홍%'
-- SELECT * FROM author WHERE name LIKE '%동'
-- SELECT * FROM author WHERE name LIKE '%길%'

-- NOT LIKE

-- REGEXP
-- 정규 표현식을 토대로 패턴 연산 수행
-- SELECT * FROM author WHERE name REGEXP '[a-z]'
-- SELECT * FROM author WHERE name REGEXP '[가-힣]'

-- NOT REGEXP

-- 타입 변환
-- CAST
-- CAST(a AS type)
-- a값을 type 으로 변환
-- 보통 정수 값을 DATE 타입으로 변환하는데 사용
-- SELECT CAST (20200101 AS DATE); =>2020-01-01
-- CONVERT
-- 문자열을 날짜/시간으로 변환하는 데 사용
-- CONVERT('2020-01-01', DATE); => 2020-01-01
-- DATE_FORMAT
-- DATE_FORMAT 함수는 날짜/시간 타입의 데이터를 지정된 형식의 문자열로 변환
-- 가장많이사용
-- DATE_FORMAT(date, format)
-- ex)SELECT DATE_FORMAT('2020-01-01 17:12:00', '%Y-%m-%d'); => 2020-01-01