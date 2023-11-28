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

-- 타입변환
-- CAST, CONVERT 사용시 유의사항
-- 최신버전
-- CAST('123' as INT)방식으로 int 사용 가능
-- CAST('123' as signed)방식으로 signed(또는 unsigned) 사용 가능
-- 구버전
-- CAST('123' as signed)방식으로 signed(또는 unsigned)만 사용 가능
-- 여기서 signed는 부호있는 정수. 즉 음수/양수 모두 포함
-- unsigned는 부호 없는 정수로서 0이상 양수를 포함

-- 특정날짜, 기간조회
-- 날짜데이터 조회하는 방식중 많이 사용하는방식
-- DATE_FORMAT(date, format)을 활용한 조회
-- Y mm dd H i s 
-- LIKE 를 상요하여 문자열 형식으로 조회
-- SELECT * FROM post where created_time like '2023-11-23%'
-- BETWEEN 연산자
-- 특정날짜 범위를 지정하여 데이터를 검색
-- WHERE created_time BETWEEN '2021-01-01' AND '2023-11-17'
-- 날짜비교연산자
-- WHERE created_time >= '2021-01-01' AND created_time <= '2023-11-17'
-- 오늘날짜 관련 함수
-- now()
-- 제약조건
-- 데이터를 입력받을 때 실행되는검사 규칙
-- CREATE 문으로 테이블을 생성 또는 ALTER 문으로 필드를 추가할 때 설정
-- 종류
-- NOT NULL
-- PRIMARY KEY -> NOT NULL, UNIQUE, 한테이블당 1개
-- FOREIGN KEYUNIQUE -> 한테이블에 여러개 설정가능

-- AUTO_INCREMENT 키워드와 함께
-- 새로운 레코드가 추가될 때마다 1씩 증가된 값을 저장
-- author, post 테이블의 id auto_increment로 바꿔보자
-- ALTER TABLE author MODIFY COLUMN id int auto_increment

-- 제약조건 - UNIQUE
-- CREATE TABLE 테이블 이름
-- (필드이름 필드타입, ...,[CONSTRAINT 제약조건이름] UNIQUE (필드이름))
-- UNIQUE 제약 조건을 별도로 정의하며, 선택적으로 제약조건에 이름을 부여하는 방법

-- UNIQUE 제약 조건을 설정하면, 해당 필드는 자동으로 인덱스(INDEX)로 설정
-- SHOW INDEX FROM 테이블명;
-- INDEX삭제 : ALTER TABLE 테이블이름 DROP INDEX 인덱스명;
-- 제약조건 삭제시 index 삭제, index 삭제시 제약조건 삭제

-- alter table 테이블이름 modify column 필드이름 필드타입 UNIQUE
-- alter table 테이블 이름 add constraint 제약조건 이름 unique(필드이름)
-- 제약조건 제거 : index를 삭제하면 같이 삭제됨.
-- 제약조건 목록조회(SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE)
-- alter table 테이블명 drop unique 제약조건이름;
-- alter table author drop constraint email;
-- alter table 테이블명 drop unique 제약조건이름;
-- alter table author drop foreign key email;

-- 제약조건 -primary KEY
-- primary KEY 제약조건을 가진  칼럼을 기본키(pk)라함
-- not null과 unigue 제약 조건의 특징을 모두 가진다

-- primary key는 테이블당 오직 하나의 필드에만 설정
-- unique는 한테이블의 여러 필드에 설정 가능
-- not null도 물론 여러 필드에 설정 가능

-- 제약조건 - foreign key
-- 외래키라고 부르며 한테이블은 다른 테이블과 연결해주는 역할
-- 기준이 되는 다른 테이블의 내용을 참조해서 레코드가 입력
-- 하나의 테이블을 다른 테이블에 의존하게 만드는 것
-- 다른 테이블의 필드는 반드시 unigue나 primary key 제약 조건이어야함
-- 문법
-- create table 테이블이름

-- 참조되는 테이블에서 데이터의 수정이나 삭제가 발생시 영향
-- on delete
-- on update
-- 기본값은 delete, update 모두 restrict 옵션이 걸려 있으므로, 변경하고 싶다면 각각 지정필요

-- 위설정시 동작옵션
-- cascade
-- 참조되는 테이블에서 데이터를 삭제/수정하면 같이 삭제/수정
-- set null
-- 참조되는 테이블에서 데이터를 삭제/수정하면 데이터는 null로 변경
-- restrict
-- fk로 잡은 테이블의 데이터가 남아 있으면, fk대상 데이터 수정/삭제 불가
-- 동작옵션을 주지 않으면 기본은 restrict
-- 제약조건 on update cascade
-- 외래키 제약조건에서 on update cascade등의 옵션

-- post 테이블에 on update cascade 설정
-- 먼저, 기존의 foreign key 제약조건을 조회 후 삭제
-- SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE where table name = 'post';
-- alter table post drop foreign key post_ibfk_1;
-- alter table post drop index author_id;
-- 새롭게 제약조건 추가
-- alter table post add constraint post_author_fk foreign key(author_id)
-- references author(id) on update cascade;
-- set null 추가
-- on update set null on delete set null; 

-- 제약조건 - default
-- 데이터를 입력할 때 해당 필드 값을 전달하지 않으면, 자동으로 설정된 기본값을 저장
-- 문법
-- CREATE TABLE test
-- (in int, name varchar(30) default 'anonymous')
-- 시간 세팅시 가장 많이 사용

-- 흐름제어
-- CASE 자바 switch랑 비슷
-- CASE values
-- WHEN [compare_value] THEN result
-- WHEN [compare_value] THEN result...
-- ELSE result
-- END
-- CASE와 END로 이루어져 있고, 원하는 조건내에 존재하지 않으면 ELSE문을 타고, ELSE문이 없을 경우
-- null을 return
-- select id, title, content,
-- case author_id
-- when 1 then 'First Author'
-- when 2 then 'Second Author'
-- ELSE 'Others'
-- end
-- as author_type from post;

-- 흐름제어
-- IF()
-- IF(a, b, c)
-- a는 조건 b는 참일경우 반환값, c는 거짓일 경우 반환값
-- 만약 a조건이 참이면 b를 반환하고, 거짓이면 c를 반환합니다,
-- select if(0<1, 'yes','no');

-- ifnull(a, b)
-- 만약 a의 값이 null이 아니면 a 그자체를 반환하고 null이면 b를 반환

-- select id, title, content, if(author_id=1, 'first author', 'others') as author_type from post ;

-- view

--  뷰(view)는 데이터베이스의 테이브로가 유사한 구조를 가지지만, 가상의 테이블로서 실제 데이터를 
--  저장하지 않는 데이터 베이스, 실제 데이터베이스를  참조만 문법
--  CREATE view 뷰네임 as
--  SELECT 컬럼1, 컬럼2
--  FROM 테이블명;

--  GRANT SELECT ON 데이터베이스이름, 뷰이름 TO 'testuser'@'localhost'

-- string 관련
키에 값을 설정
set key values키의값을 가져옴
get keysetit not EXISTSset key value nx

최초접속시 


zset(정렬된 집합)
주식 코인 등의 실시간 시세 또는 게임등의 사용자의 점수나 순위를 관리하는데 사용
기본문법
ZADD key score MEMEBERS
score 멤버를 정렬하는데 사용되는 점수
member형식을 json형식으로도 가능
ex)zadd my_key 1 {"hello","world"}
zrem key member
특정키의 특정멤버 삭제
zrank key member
특정멤버의 위치 정보 반환
zrange stock_prices 0 -1
score기준 오름차순 조회
zrevrange stock_prices 0 -1
score기준 내림차순 조회