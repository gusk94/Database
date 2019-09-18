-- DML DATA Manipulation Language
INSERT INTO classmates (name, age)
    VALUES ("홍길동", 23);

SELECT * FROM classmates;

INSERT INTO classmates (name, age, address)
    VALUES ("홍길동", 30, "서울");

-- SQlite 는 PK 를 지정하지 않으면 rowid 를 자동으로 정의.
SELECT rowid, * FROM classmates;
/*
rowid       name        age         address
----------  ----------  ----------  ----------
1           홍길동         23
2           홍길동         30          서울
*/

INSERT INTO classmates
    VALUES (1, "홍길동", 30, "서울");

-- 원하는 column 만 가져오기
SELECT name, age FROM classmates;

-- classmates 에서 column 값을 1개만 가지고 오기
SELECT rowid, name FROM classmates LIMIT 1;

-- classmates 에서 column 값을 3번째에 있는 값 하나만 가지고 오기
SELECT rowid, name FROM classmates LIMIT 1 OFFSET 2;

-- classmates 에서 주소가 서울인 사람만 가지고 오기
SELECT * FROM classmates WHERE address="서울";

-- classmates 에서 age 값 전체를 중복없이 가지고 오기
SELECT DISTINCT age FROM classmates;

-- data 삭제(classmates 에서 테이블번호가 4인 data 삭제)
DELETE FROM classmates WHERE rowid=4;

-- data 수정
UPDATE TABLE
    SET column1=value1, column2=value2
    WHERE condition;

-- WHERE 문 심화
-- users.csv
-- users에서 age가 30이상인 사람만 가지고 오기
SELECT * FROM users WHERE age>=30;

-- 이름만 가지고 오기
SELECT first_name FROM users WHERE age>=30;

-- 조건이 두 개일 경우
SELECT last_name, age FROM users WHERE age>=30 AND last_name="김";

-- Expressions
-- 레코드의 개수
SELECT COUNT(column) FROM tables;
SELECT COUNT(*) FROM users;

-- 평균s
SELECT AVG(column) FROM table;
SELECT AVG(age) FROM users WHERE age>=30;

-- max
SELECT MAX(balance), first_name, last_name FROM users;

-- 30살 이상 사람의 계좌 평균 잔액
SELECT AVG(balance) FROM users WHERE age>=30;

-- LIKE
-- 20대인 사람
SELECT * FROM users WHERE age LIKE '2%';

-- 지역번호가 02 인 사람
SELECT * FROM users WHERE phone LIKE '02-%';

-- 이름이 '준' 으로 끝나는 사람
SELECT * FROM users WHERE first_name LIKE '%준';

-- 중간 번호가 5114 인 사람
SELECT * FROM users WHERE phone LIKE '%5114%';

-- ORDER
-- users 에서 나이 순으로 오름차순하여 상위 10개만 뽑아보기
SELECT * FROM users ORDER BY age ASC LIMIT 10;

-- 나이 순, 성 순으로 오름차순 정렬하여 상위 10개만 뽑아보기
SELECT * FROM users ORDER BY age, last_name ASC LIMIT 10;

-- 계좌 잔액 순으로 내림차순 정렬
SELECT last_name, first_name, balance FROM users ORDER BY balance DESC LIMIT 10;

-- Table 이름 변경
ALTER TABLE exist_table RENAME TO new_table;

-- 새로운 column 추가
ALTER TABLE 'table' ADD COLUMN 'col_name' DATATYPE;

-- NOT NULL 을 제외
ALTER TABLE news ADD COLUMN created_at DATETIME;
INSERT INTO news VALUES ('title', 'content', datetime('now','localtime'));

/* 만약 NOT NULL 을 넣는다면
ALTER TABLE news ADD COLUMN created_at DATETIME NOT NULL;
Error: Cannot add a NOT NULL column with default value NULL 의 에러가 뜬다 */

-- DEFAULT 값을 넣는다
ALTER TABLE news ADD COLUMN subtitle TEXT NOT NULL DEFAULT 1;
/*
sqlite> SELECT * FROM news
   ...> ;
title       content          created_at  subtitle
----------  ---------------  ----------  ----------
1번째 글       heollo database  DELETE      1
title       content          2019-09-18  1
*/