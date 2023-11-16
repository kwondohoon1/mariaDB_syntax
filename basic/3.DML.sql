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
