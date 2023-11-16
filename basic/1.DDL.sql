-- 데이터베이스 생성
CREATE DATABASE board;
-- 데이터베이스 선택
USE board
-- author 데이터 신규 생성
CREATE TABLE author(id INT, name VARCHAR(255),
email VARCHAR(255), password VARCHAR(255), test1 VARCHAR(255), 
PRIMARY KEY(id));
-- 테이블 목록조회
SHOW TABLES;
-- 테이블 컬럼조회
DESCRIBE author;
-- post 테이블 신규 생성
CREATE TABLE posts(id INT PRIMARY KEY, title VARCHAR(255), 
content VARCHAR(255), author_id INT, FOREIGN KEY(author_id) 
REFERENCES author(id))

-- 테이블 컬럼상세조회
SHOW FULL COLUMNS FROM author;

-- 테이블 생성문 조회
SHOW CREATE TABLE posts;
-- CREATE TABLE `posts` (
--    `id` int(11) NOT NULL,
--    `title` varchar(255) DEFAULT NULL,
--    `content` varchar(255) DEFAULT NULL,
--    `author_id` int(11) DEFAULT NULL,
--    PRIMARY KEY (`id`),
--    KEY `author_id` (`author_id`),
--    CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
--  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

-- 테이블 제약조건 조회
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'posts';

-- 테이블 index 조회
SHOW INDEX FROM posts;

-- ALTER
-- 테이블 이름 변경
 ALTER TAMLE 테이블명 RENAME=ME 새로운 테이블명;
  ALTER TAMLE 테이블명 posts RENAME post;
-- 칼럼 추가(add)
ALTER TABLE 테이블명 ADD COLUMN 컬럼명 자료형 [NULL 또는 NOTNULL]
ALTER TABLE author ADD COLUMN role VARCHAR(50);
-- 컬럼 타입 변경(Modify)
ALTER TABLE 테이블명 Modify COLUMN 컬럼명 타입[제약조건];
ALTER TABLE author Modify COLUMN name VARCHAR(100)NOT NULL;
-- 컬럼 이름변경 => content -> contents
ALTER TABLE 테이블명 CHANGE COLUMN 기존컬럼명 새로운 컬럼명 타입[제약조건];
ALTER TABLE post CHANGE COLUMN content contents varchar(255);
-- 컬럼 삭제 => test1컬럼삭제
ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
ALTER TABLE author DROP COLUMN test1;
-- 테이블 삭제
DROP TABLE 테이블이름

-- 테이블의 데이터만을 지우고 싶을 때
DELETE FROM 테이블이름
TRUNCATE TABLE 테이블이름

IF EXISTS
특정 객체(예: 데이터베이스나 테이블)가 존재하는 경우에만 명령어를 실행
DROP DATABASE 또는 TABLE IF EXISTS abc;

alter table post modify column contents varchar(3000)
ALTER TABLE author ADD COLUMN address VARCHAR(255);

CREATE TABLE `post` (
   `id` int(11) NOT NULL,
   `title` varchar(255) DEFAULT NULL,
   `contents` varchar(3000) DEFAULT NULL,
   `author_id` int(11) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `author_id` (`author_id`),
   CONSTRAINT `post_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci