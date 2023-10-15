CREATE TABLE sensor_data (
  datetime      VARCHAR(20),
  temperature    NUMBER,
  humidity  NUMBER
);
-- 날짜
INSERT INTO sensor_data(datetime , temperature, humidity) VALUES ('2023-06-16 12:23:23', 23, 2323);


select * from sensor_data; 
-- 온도
-- 습도

-- CREATE SEQUENCE aid_seq 
--  start with 1
--  INCREMENT BY 1 
--  MAXVALUE 100
--  NOCYCLE
--  NOCACHE;


-- ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';


-- select * from news ORDER By aid;

delete  from sensor_data;

-- drop SEQUENCE aid_seq;

-- select aid, title, img, ndate as cdate, content from news where aid=1;

-- select aid, title, ndate as cdate from news;

select * from sensor_data order by datetime desc;