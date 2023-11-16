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
insert into post(id, title, contents, author_id) values(3, 'hello1', 'hello is..')
insert into post(id, title, contents, author_id) values(4, 'hello1', 'hello is..')

-- author 데이터중 id가 4인 데이터를 email, name을 변경
update author set email='abc@naver.com', name='abc' where id=4;

-- post에 글쓴적이 있는 author 데이터 1개 삭제 에러 조치 후 삭제
-- 방법1
delete from post where author_id=2;
delete from author where id=2;

-- 방법2
update post set author_id = null where author_id=2;
delete from author where id=2;
