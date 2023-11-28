-- 테이블에 새로운 레코드를 추가
INSERT INTO 테이블이름(필드이름1, 필드이름2, 필드이름3) values (데이터값1,
데이터값2, 데이터값3)

insert into author(id, name, email) values(1, 'kim', 'abc@naver.com');

-- author 데이터 5개 추가
-- address는 데이터 넣지 말것
-- select *from author;
insert into author(id, name, email, password, role) values(1, 'kim', 'abc@naver.com', '1234', '100');
insert into author(id, name, email, password, role) values(2, 'kim', 'abc@naver.com', '1234', '100');
insert into author(id, name, email, password, role) values(3, 'kim', 'abc@naver.com', '1234', '100');
insert into author(id, name, email, password, role) values(4, 'kim', 'abc@naver.com', '1234', '100');
insert into author(id, name, email, password, role) values(5, 'kim', 'abc@naver.com', '1234', '100');
-- post 데이터
insert into post(id, title, contents, author_id) values(1, 'hello1', 'hello is..', 2)
insert into post(id, title, contents, author_id) values(2, 'hello1', 'hello is..', 2)
insert into post(id, title, contents) values(3, 'hello1', 'hello is..')
insert into post(id, title, contents) values(4, 'hello1', 'hello is..')

-- author 데이터중 id가 4인 데이터를 email, name을 변경
update author set email='abc@naver.com', name='abc' where id=4;

-- post에 글쓴적이 있는 author 데이터 1개 삭제 에러 조치 후 삭제
-- 방법1
delete from post where author_id=2;
delete from author where id=2;

-- 방법2
update post set author_id = null where author_id=2;
delete from author where id=2;

create table author(id int(11), name varchar(100), email varchar(255), password varchar(255)
, role varchar(50), address VARCHAR(255) PRIMARY KEY(id));

CREATE TABLE posts(id int, title VARCHAR(255), 
content VARCHAR(255), author_id INT, primary key(id), 
FOREIGN KEY(author_id) REFERENCES author(id))



INSERT INTO author(id, name, email, password, role) values(1, 'kwon', 'kwon@naver.com', '1234', 'abc');
INSERT INTO author(id, name, email, password, role) values(2, 'kim', 'kim@naver.com', '1234', 'abc');
INSERT INTO author(id, name, email, password, role) values(3, 'ha', 'ha@naver.com', '1234', 'abc');
INSERT INTO author(id, name, email, password, role) values(4, 'choi', 'choi@naver.com', '1234', 'abc');
INSERT INTO author(id, name, email, password, role) values(5, 'lee', 'lee@naver.com', '1234', 'abc');

insert into post(id, title, content, author_id) values(1, 'hello', 'hellobye', 1);
insert into post(id, title, content, author_id) values(2, 'hello', 'hellobye', 2);
insert into post(id, title, content, author_id) values(3, 'hello', 'hellobye', 3);
insert into post(id, title, content) values(4, 'hello', 'hellobye');
insert into post(id, title, content) values(5, 'hello', 'hellobye');

update post set author_id = null where author_id is not null;
delete from author;
select *from post order by title asc, contents desc limit 3;

ALTER TABLE author ADD COLUMN age tinyint unsigned;
DESCRIBE author;
insert into author(id, age) values(4, '200');
insert into author(id, age) values(3, '500');
ALTER TABLE POST ADD COLMN PRICE DECIMAL(10,3);
UPDATE POST SET PRICE=1000.5 WHERE ID=1;
UPDATE POST SET PRICE=1000.555 WHERE ID=2;
UPDATE POST SET PRICE=1000.5555 WHERE ID=3;


update author set role='user';
ALTER TABLE author MODIFY COLUMN role ENUM('user', 'admin') NOT NULL DEFAULT 'user';
insert into author(id, name, role) values(3, 'kwon', 'admin');
insert into author(id, name, role) values(3, 'kwon', 'super-user');
insert into author(id, name, role) values(3, 'kwon');

ALTER TABLE post ADD COLUMN created_time DATETIME(6) default current_timestamp(6);
insert into post(id) values(6);

select *from author where id not in(1, 2, 4);
select *from post where id BETWEEN 2 and 4;
select *from post where id 2 and 3 and 4;
select *from post where not (id<2 or id>4);

select * from post where (created_time, %Y-m%-%d) 
= date_format(now(), %Y-m%-%d);

SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE where table_name ='post';
alter table post drop foreign key post_ibfk_1;
alter table post drop index author_id;
alter table post add constraint post_author_fk foreign key(author_id)
references author(id) on update cascade;

select * from author;
alter table post drop foreign key post_author_fk;
show index from post;
alter table post drop index post_author_fk;
alter table post add constraint post_author_fk foreign key(author_id)
references author(id) on update set null on delete set null;
update author set id=50 where id=5;

select id, title, content,
case author_id
when 1 then 'First Author'
when 2 then 'Second Author'
ELSE 'Others'
end
as author_type from post;

select id, title, content, if(author_id=1, 'first author', 'others') as author_type from post ;

select * from tableA INNER JOIN tableB ON tableA = tableB.A_id
select * from tableA AS a INNER JOIN tableB as b on a.id =b.a_id;
select * from author INNER JOIN post ON author.id = post.author_id;
select * from author AS a INNER JOIN post as b on a.id =b.author_id;
LEFT OUTER JOIN
SELECT * FROM tableA a LEFT JOIN tableB b ON a.id = b.a_id

select name, title from author as a inner join post as p on a.id = p.author_id;
SELECT name, title FROM author a LEFT JOIN post p ON a.id = p.author_id;
SELECT name, title FROM author a LEFT JOIN post p ON a.id = p.author_id
where age >=25;

SELECT 컬럼1, 컬럼2 FROM TABLE1 UNION SELET 컬럼1, 컬럼2 FROM TABLE2;
SELECT NAME, EMAIL FROM AUTHOR UNION SELECT TITLE, contents 

select round(avg(price), 0) as '평균가격' from post;
select author_id count(*) from post;

select author_id, round(avg(price), 0) from post where price >=2000 group by author_id;
select author_id, round(avg(price), 0) from post group by author_id having avg(price) >=2000;

DELIMITER //
CREATE PROCEDURE procedure_name (parameters)
BEGIN
-- SQL 문법
END //
DELIMITER ;
-- 호출시
CALL 프로시저명();

getUser(IN userld int)
where id = userld

DECLARE 변수명 변수타입 [DEFAULT DEFAULT_VALUE];
SET 변수명 = 수정할값;
IF 조건식 THEN
-- 조건이 참일때
ELSE 
-- 조건이 거짓일때
END IF
WHILE문
WHILE 조건식 DO
END WHILE;

mysqldump -u root -p --default-character-set=utf8mb4 board > dumpfile.sql

-- 스키마 추가 및 변경
-- author 테이블을 나누어 author_address 테이블 추가기능
-- country.state_city, details, zip_code, phonenumber
-- on delete cascade 옵션
-- 1:1 관계 설정

-- 필요산출물
-- ER다이어그램을 통해 추상화
-- 릴레이셔널 스키마를 통해 구체화
-- 테이블 생성문(DDL)
-- 테스트 케이스

-- 스키마 설계
    -- 주문관리 서비스 설계
    -- 요구사항
        -- 모든테이블 컬럼 자유 설계
        -- ORDERSYSTEM 데이터베이스 생성
        -- 해당 서비스에서는 회원가입이 가능
        -- MEMEBERS
        -- 회원의 종류가 user, admin, seller로 구성
        -- 회원이 상품과 재고수량을 동록
        -- ITEMS
        -- 상품명, 상품가격, 재고
        -- 누가 등록했는지에 대한 정보가 남아야 함에 유의
        -- 회원이 여러 상품을 한꺼번에 주문 가능
        -- ORDER, ORDER_DETAILS

-- 필요산출물
    -- ER다이어그램을 통해 추상화
    -- 릴레이셔널 스키마를 통해 구체화
    -- 테이블 생성문(DDL)