CREATE TABLE news (
    aid INT NOT NULL Primary KEY,
    title VARCHAR(50) NOT NULL,
    img VARCHAR(100),
    ndate DATE,
    content VARCHAR(2000) NOT NULL
);

CREATE SEQUENCE aid_seq 
 start with 1
 INCREMENT BY 1 
 MAXVALUE 100
 NOCYCLE
 NOCACHE;


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

INSERT INTO news(aid , title, img, ndate, content) VALUES (aid_seq.NEXTVAL, 'aa', 'bb', CURRENT_TIMESTAMP, 'sdsd');

select * from news ORDER By aid;

delete from news where aid='1';

drop SEQUENCE aid_seq;

select aid, title, img, ndate as cdate, content from news where aid=1;

select aid, title, ndate as cdate from news;

drop table news;