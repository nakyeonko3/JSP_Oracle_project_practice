CREATE TABLE student (
    id INT NOT NULL Primary KEY,
    username VARCHAR(20),
    univ VARCHAR(40),
    birth DATE,
    email VARCHAR(40)
);

CREATE SEQUENCE id_seq 
 start with 1
 INCREMENT BY 1 
 MAXVALUE 100
 NOCYCLE
 NOCACHE;


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

INSERT INTO student(id, username, univ, birth, email)
     VALUES (id_seq.NEXTVAL, '김길동', 'AA대학교', '1099-08-01', 'kim@aa.com');

INSERT INTO student(id, username, univ, birth, email)
     VALUES (id_seq.NEXTVAL, 'ddd', 'BB대학교', '1990-08-01', 'aim@aa.com');

INSERT INTO student(id, username, univ, birth, email)
     VALUES (id_seq.NEXTVAL, 'sss', 'oo대학교', '1997-08-01', 'cimpp@aa.com');

INSERT INTO student(id, username, univ, birth, email)
     VALUES (id_seq.NEXTVAL, 'kkk', 'kk대학교', '1990-01-01', 'cilm@aa.com');

INSERT INTO student(id, username, univ, birth, email)
     VALUES (id_seq.NEXTVAL, 'dddd', 'dd대학교', '1999-04-01', 'cdim@aa.com');



select * from student ORDER By id;


SELECT
  sysdate
FROM
  dual;

drop SEQUENCE id_seq;
drop table student;
delete from student where USERNAME='고낙연';