
-- 13-14
GRANT CREATE VIEW TO SCOTT;


 -- 13-15
CREATE VIEW VW_EMP20
    AS (SELECT EMPNO, ENAME, JOB, DEPTNO
        FROM EMP
        WHERE DEPTNO = 20);

SELECT * 
    FROM VW_EMP20;


--- describe the views