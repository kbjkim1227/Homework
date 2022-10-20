

CREATE TABLE address(
  id NUMBER(3)
, name VARCHAR2(50)
, addr VARCHAR2(100)
, phone VARCHAR2(30)
, email VARCHAR2(100));

CREATE TABLE addr_second
AS
SELECT
    *
FROM address WHERE 0=1;

CREATE TABLE addr_forth
AS
SELECT
 id, name
FROM address WHERE 0=1;

INSERT INTO address VALUES('01','슬기','안산','112','seulgizzang@naver.com');
INSERT INTO address VALUES('02','아이린','대구','119','dkdlfls@nate.com');
INSERT INTO address VALUES('03','웬디','America','911','wendy123@yahoo.com');
INSERT INTO address VALUES('04','조이','인천','032','joyjoyjoy@hanmail.net');
INSERT INTO address VALUES('05','예리','몬스터볼','3123','KKobugi1@monsterball.com');

CREATE TABLE Address2
AS
SELECT
 id, name
FROM address WHERE 1=1;

SELECT
    *
FROM address2;

ALTER TABLE address
ADD (
birth DATE);

ALTER TABLE address
ADD (
comments varchar2(50));

ALTER TABLE address
DROP COLUMN comments;

ALTER TABLE address
MODIFY( phone VARCHAR(50));

RENAME addr_second AS client_address;

ALTER TABLE addr_second
RENAME TO client_address;

DROP TABLE client_address;

truncate TABLE address2;

-------------
DROP TABLE member_third;
CREATE TABLE Member(
USERID       VARCHAR2(10),
USERNAME VARCHAR2(10),  
PASSWD    VARCHAR2(10),  
IDNUM      VARCHAR2(10),  
PHONE      NUMBER(13),  
ADDRESS    VARCHAR2(20),  
REGDATE    DATE );

CREATE TABLE member_second
AS
SELECT
    *
FROM Member WHERE 1=1;

CREATE TABLE member_third
AS
SELECT
  userid, username, passwd
FROM Member WHERE 1=1;

CREATE TABLE member_forth 
AS
SELECT
  *
FROM Member WHERE 0=1;

ALTER TABLE Member
ADD (
email varchar2(50));

ALTER TABLE Member
ADD (
country varchar2(50));

ALTER TABLE Member
DROP COLUMN IDNUM;

ALTER TABLE Member
MODIFY (
ADDRESS varchar2(30));

SELECT  
    *
FROM MEMBER;

create SEQUENCE sample_seq
increment by 10 
start with 10;

SELECT
    sample_seq.nextval
FROM dual;


SELECT
    *
FROM DEPARTMENT;
insert into department
   VALUES (sample_seq.nextval, 'Recreation', 'KOREA');

SELECT
    *
FROM USER_IND_COLUMNS;
CREATE INDEX IDX_EMPLOYEE_ENAME ON EMPLOYEE(ENAME);

DROP INDEX IDX_EMPLOYEE_ENAME;

CREATE VIEW V_EMP2 AS SELECT E.ENO,E.ENAME,E.JOB,D.LOC FROM employee E NATURAL JOIN department D;

SELECT
    *
FROM USER_VIEWS;

SELECT
    *
FROM V_EMP2;

--EMPLOYEES 테이블에서 30 부서의 세부사항을 포현하는 EMP_30 VIEW를 생성하세요.
CREATE VIEW EMP_30 AS SELECT * FROM employee  where dno=30;

--EMPLOYEE 테이블에서 10번 부서만 
--ENO를 EMP_NO로 ENAME을 NAME으로 SALARY를 SAL로 바꾸어 EMP_10을 생성하세요.

SELECT
    *
FROM department;
CREATE VIEW EMP_10 AS 
SELECT
eno emp_no, ename name, job, manager, hiredate, salary sal,commission,dno
FROM employee  where dno=10;

--부서별로 부서명, 최소 급여, 최대 급여, 부서의 평균 급여를 포함하는 DEPT_SUM VIEW를 생성하세요.
--(  DNAME, MIN_SAL, MAX_SAL, SUM_SAL, AVG_SAL )
CREATE VIEW DEPT_SUM AS 
SELECT
d.dname ,min(e.salary) MIN_SAL, max(e.salary) MAX_SAL, sum(e.salary) SUM_SAL, avg(e.salary) AVG_SAL
FROM employee e natural join Department d group by dname;

drop view DEPT_SUM;
SELECT
    *
FROM DEPT_SUM;

SELECT
    *
FROM employee;

commit;



