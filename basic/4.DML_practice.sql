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