--단일행 서브쿼리
SELECT
    *
FROM employee
WHERE salary >=(SELECT salary from employee where ename='SCOTT');

SELECT
    *
FROM employee 
WHERE JOB=(SELECT JOB FROM employee WHERE ENAME='SCOTT');
--다중행쿼리
SELECT
    ENO,ENAME,salary
FROM employee WHERE (DNO,salary) IN (SELECT DNO,MIN(SALARY) FROM employee GROUP BY DNO);

SELECT DNO, MIN(SALARY) FROM employee GROUP BY DNO;

SELECT
    *
FROM employee
WHERE SALARY IN (1250,1300);
--ANY
SELECT
    *
FROM employee where salary < ANY(SELECT salary from employee where Job='SALESMAN')
and job <>'SALESMAN';

SELECT salary from employee where Job='SALESMAN';
--ALL
SELECT
    *
FROM employee where salary < ALL(SELECT salary from employee where Job='SALESMAN')
and job <>'SALESMAN';




SELECT DISTINCT JOB FROM employee;
SELECT JOB
FROM employee GROUP BY JOB;

--1. 이름이 ALLEN인 사원과 같은 업무를 하는 사람의 사원번호, 이름, 업무, 급여 추출
select eno, ename, job, salary from employee
where job=(SELECT JOB FROM employee WHERE ename='ALLEN');

--2. EMP 테이블의 사원번호가 7521인 사원과 업무가 같고 
--급여가 7934인 사원보다 많은 사원의 사원번호, 이름, 담당업무, 입사일, 급여 추출
select eno, ename, job, hiredate, salary from employee
 where job=(SELECT JOB FROM employee WHERE ENO=7521)
   and salary>(SELECT SALARY FROM employee where ENO=7934);
   
--3. EMP 테이블에서 급여의 평균보다 적은 사원의 사원번호, 이름, 업무, 급여, 부서번호 추출
select eno, ename, job, salary, dno from employee
 where salary<( SELECT AVG(salary) FROM employee);--평균2073

--4. 부서별 최소급여가 20번 부서의 최소급여보다 큰 부서의 부서번호, 최소 급여 추출
select dno, min(salary) from employee
 group by dno
having min(salary)>(SELECT MIN(salary) FROM employee WHERE DNO=20);--20번 최소급여 800

SELECT MIN(salary) FROM employee group by dno;   

--5. 업무별 급여 평균 중 가장 작은 급여평균의 업무와 급여평균 추출
select job, avg(salary) from employee
 group by job
having avg(salary)=(SELECT MIN(avg(salary)) FROM employee group by job);

--6. 업무별 최대 급여를 받는 사원의 사원번호, 이름, 업무, 입사일, 급여, 부서번호 추출
select eno, ename, job, hiredate, salary, dno from employee
 where (job, salary) in (SELECT job, max(salary) FROM employee group by job);

--7. 30번 부서의 최소급여를 받는 사원보다 많은 급여를 받는 사원의 
--사원번호, 이름, 업무, 입사일, 급여, 부서번호, 단 30번 부서는 제외하고 추출
select eno, ename, job, hiredate, salary, dno from employee
 where salary>(SELECT MIN(salary) FROM employee WHERE DNO=30)
   and dno != 30
   order by dno;
   
--8. BLAKE와 같은 상사를 가진 사원의 이름,업무, 상사번호 추출
select ename, job, manager from employee
 where manager=(SELECT manager from employee where ename='BLAKE')
 and ename <> 'BLAKE';
 
--9. BLAKE와 같은 부서에 있는 모든 사원의 이름과 입사일자를 추출
select ename, hiredate, dno from employee
where dno=(SELECT dno from employee where ename='BLAKE');

--10. 평균급여 이상을 받는 모든 사원에 대해 사원의 번호와 이름을 급여가 많은 순서로 추출
select eno, ename, salary from employee
 where salary > (SELECT avg(salary) from employee)--평균 2073
 order by salary desc;
 
--11. 이름에 T가 있는 사원이 근무하는 부서에서 근무하는 모든 사원에 대해 사원번호,이름,급여를 출력
--사원번호 순서로 추출(instr)
select dno, eno, ename, salary from employee
 where dno in ( SELECT dno from employee where ename LIKE '%T%' group by dno)
 order by eno;
 
select dno, eno, ename, salary from employee
 where dno in ( SELECT dno from employee where instr(ename,'T',1,1)!=0)
 order by eno; 
 
--12. 부서위치(d.loc)가 CHICAGO인 모든 사원에 대해 이름,업무,급여 추출
select e.ename, e.job, e.salary, d.loc from employee e, department d
 where e.dno=d.dno
   and d.loc='CHICAGO';
   
--13. KING에게 보고하는 모든 사원의 이름과 급여를 추출
select ename, salary, manager from employee
 where manager=(select eno from employee where ename='KING');
 
--14. FORD와 업무와 월급이 같은 사원의 모든 정보 추출
select * from employee 
 where (job, salary) in (select job,salary from employee where ename='FORD');


--15. 업무가 JONES와 같거나 월급이 FORD 이상인 사원의 이름,업무,부서번호,급여 추출
select ename, job, eno, salary from employee
 where job = (select job from employee where ename='JONES')
     or salary >= (select salary from employee where ename='FORD');

select ename, job, eno, salary from employee
 where (job = (select job from employee where ename='JONES')
     or salary >= (select salary from employee where ename='FORD'))
     and ename not in('JONES','FORD');
     
--16. SCOTT 또는 WARD와 월급이 같은 사원의 이름,업무,급여를 추출
select ename, job, salary from employee
 where salary=(select salary from employee where ename='SCOTT')
    or salary=(select salary from employee where ename='WARD');

select ename, job, salary from employee
 where salary in(select salary from employee where ename in('SCOTT','WARD'));

    
--17. SALES에서 근무하는 사원과 같은 업무job 를 하는 사원의 이름,업무,급여,부서번호 추출
select ename, job, salary, dno from employee
    where job in(select job from employee natural join department where dname='SALES');

--18. 자신의 업무별 평균 월급보다 낮은 사원의 부서번호, 이름, 급여, 자신의 부서 평균급여를 추출
select dno, ename, salary,job,
       (select avg(salary) from employee t where t.dno=e.dno) deptavgsal
  from employee e
 where salary < (select avg(salary) from employee t where t.job=e.job);
 
 select avg(salary) from employee t where t.job='CLERK';
 
SELECT E.ENO, E.ENAME, (SELECT DNAME FROM department WHERE DNO= E.DNO) DNO
FROM employee E, department D;
 
--19. 사원번호,사원명,부서명,소속부서 인원수,업무,소속 업무 급여평균,급여를 추출
select eno, ename, dname, (SELECT count(*)from employee t WHERE t.dno=e.dno) "소속부서 인원수", 
    job ,(SELECT round(avg(salary))from employee T WHERE t.job=e.job) "소속 업무 급여평균"
    ,salary
 from employee e, department d
where e.dno=d.dno;


--20. 사원번호,사원명,부서번호,업무,급여, 자신의 소속 업무 평균급여를 추출
select eno, ename, dno, job, salary,
      (SELECT round(avg(salary),1) FROM employee t where t.job =e.job) "업무평균급여"
  from employee e;

--21. 최소한 한 명의 부하직원이 있는 관리자의 사원번호,이름,입사일자,급여 추출
select eno, ename, hiredate, salary from employee e
 where exists(select t.manager from employee t where t.manager=e.eno);
-- where exists(select t.manager from employee t where t.manager=e.eno);
/* 해당ENO 7902 7698  7839 7566  7788  7782 */
select 1 from  employee t where t.manager = 7902;
--SELECT절에서 1은 참 거짓 로우 확인

select eno, ename, hiredate, salary from employee e
where e.eno in( SELECT DISTINCT t.manager from employee t);

--22. 부하직원이 없는 사원의 사원번호, 이름, 업무, 부서번호 추출 
select eno, ename, job, dno from employee e
 where not exists(select manager from employee t where t.manager=e.eno);

--23. BLAKE의 부하직원의 이름, 업무, 상사번호 추출
select ename, job, manager from employee
 where manager=(select eno from employee where ename='BLAKE');


SELECT
    *
FROM employee;





