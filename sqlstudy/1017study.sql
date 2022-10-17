select * from employee;

select * from department;

select * from salgrade;

commit;


select DISTINCT dno
from employee;

SELECT
    *
FROM employee 
where ename='SCOTT';

-- NOT != <>

SELECT
    *
FROM employee
where commission in(300,500,1400);

SELECT
    *
FROM employee
where commission is null;

SELECT
    *
FROM employee
ORDER BY dno desc;
-- order by 굳이 안쓴다. 정렬된 부분을 처리할 때 (사용자의 요구사항이 있을땐 쓰고 )

SELECT SUBSTRB('오라클매니아', 3,7) from dual; --3바이트

SELECT 'ORACLE' || ' MANIA' FROM DUAL;

SELECT INSTR('ORACLE MANIA', 'MANIA') FROM DUAL;

SELECT ename, decode(INSTR(ename, 'SCOTT'),1,'ok','not')FROM employee;
--decode는 if else 같은느낌

SELECT  RPAD(ename,15, '*')|| LPAD(SALARY, 10,0) from employee;

SELECT TRIM (' ORACLE MANIA ') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD DAY') FROM DUAL;

SELECT SYSDATE-1 어제, SYSDATE 오늘 FROM DUAL;

SELECT ROUND(SYSDATE-HIREDATE) 근무일수 FROM employee;

SELECT HIREDATE,ADD_MONTHS(HIREDATE,6) FROM employee;

SELECT SYSDATE, NEXT_DAY(SYSDATE,'토요일') FROM DUAL;

SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;

SELECT COUNT(*) from employee;
--count(1) 1은 칼럼 번호

SELECT
    *
FROM employee;

SELECT DISTINCT job "직업 종류" from employee;

SELECT ename, salary from employee 
where salary = (SELECT max(salary) from employee);
--일반 칼럼에 그룹함수를 사용 불가능
--그룹함수를 사용할 때 select 절과 group by절을 일치 시켜줘야합니다.

select dno, avg(salary) from employee GROUP by dno;

SELECT
    dno, max(salary)
FROM employee
GROUP BY dno
HAVING max(salary) >=3000
order by dno asc;


SELECT
    *
FROM employee a, department b
where a.dno = b.dno
order by a.dno;

--join--
SELECT
    *
FROM employee e NATURAL join department d
where eno = '7788';


SELECT
   e.eno, e.ename, d.dname, dno
FROM employee e join department d
using(dno)
where eno = '7788';

SELECT
   e.eno, e.ename, d.dname, d.dno
FROM employee e join department d
on(e.dno = d.dno)
where eno = '7788';

SELECT
    *
FROM salgrade;

-- non-equi jon--
SELECT ename, salary, grade
from employee, salgrade 
where salary BETWEEN losal and hisal;

--self join
SELECT
 e.eno,e.ename,m.eno mgreno,m.ename mgrename
FROM employee e
,employee m
where e.manager = m.eno;

SELECT employees.ename ||'의 직속은 '|| nvl(manager.ename,'없음')
from employee employees, employee manager
where employees.manager = manager.eno(+);

SELECT employees.ename ||'의 직속은 '|| nvl(manager.ename,'없음')
from employee employees left outer join employee manager
on employees.manager = manager.eno(+);

commit;

--------------------------------------------------------------------------------------------------------

select * from employee;
SELECT * from department;

--1. 사원수가 3명 이상인 부서명(d.dname)과 인원수를 출력하시오. ( group by, having )
-- having절 -- group by로 묶은 값들에 조건을 추가한다 (=where)
select d.dname 부서명, count(*) 인원수
from employee e, department d
where e.dno = d.dno
group by e.dno, d.dname
--group by d.dname
having count(*) >= 3;

--직책(job)별로 3명이상인 직책명과 인원수를 출력하시오
select job 직책명, count(*) 인원수
from employee
group by job
having count(*) >= 3;


--2. 직무 중 가장 적게 수입을 가지는 직무의 평균 월급을 출력하시오.
select  min(avg(salary))
from employee
group by job;

select job, avg(salary)
from employee
group by job
having min(salary) =
(select min(salary)
from employee);

select job, avg(salary)
from employee
group by job
having avg(salary) =
(select  min(avg(salary))
from employee
group by job);

--3. 사원번호, 사원이름, 부서이름, 부서번호를 출력하시오. ( Natural 조인 ,  Join On  , Join Using )
-- Oracle 내부조인 -- 테이블간에 동일한 컬럼을 조인
--join
select e.eno, e.ename, d.dname, d.dno
 from employee e, department d
 where e.dno = d.dno;

--natural join
 select ename, eno, dname, dno
  from employee natural join department;

--join on
select e.eno, e.ename, d.dname, d.dno
 from employee e join department d
 on e.dno = d.dno;

--join using
select e.eno, e.ename, d.dname, dno  
 from employee e join department d
 using(dno);

--4. 부서가 30이고, 급여가 1500이상인 사원의 이름, 급여, 부서명, 부서번호를 출력하시오. ( Join on ) 
select e.ename, e.salary, d.dname, d.dno
  from employee e join department d
    on e.dno = d.dno
    where d.dno=30 and e.salary>=1500;


    
--5. 사원수가 5명이 넘는 부서의 부서명과 사원수를 출력하시오.
select d.dname, count(*)
  from employee e, department d
 where e.dno = d.dno
group by e.dno
       , d.dname
having count(*) >= 5;

--6. ADAMS 사원이 근무하는 부서이름과 지역이름을 출력하시오.
select e.ename, d.dname, d.loc
  from employee e, department d
  where e.dno = d.dno and e.ename = 'ADAMS';
  
--7. NEWYORK 이나 DALLAS 지역(d.loc)에 근무하는 사원들의 사원번호, 사원이름을 사원번호 순으로 검색하시오.
select e.eno, d.loc, e.ename
  from employee e, department d
  where e.dno = d.dno and (d.loc='NEW YORK' or d.loc='DALLAS')
  order by e.eno ;
  
  select e.eno, d.loc, e.ename
  from employee e, department d
  where e.dno = d.dno and d.loc in ('NEW YORK','DALLAS')
  order by e.eno ;
  
   -- 만기일자 date_expired
select DECODE(SIGN(date_expired - trunc(sysdate)), -1, date_expired, 'OK')
  from tablename;

  
commit;

 



