--문1) 직원번호가 7900  인 직원정보를 출력해보세요
  -- v_no||' '||v_name||' '||v_sal 

DECLARE
  v_no employee.eno%TYPE ;


--문2) 직원번호가 7900  인 직원정보를  ROWTYPE 변수를 활용하여 데이터 출력해보세요

DECLARE
  v_row employee%ROWTYPE ;


SET SERVEROUTPUT ON ;


--문제3) employee, department를 조인해서 eno 7900인 사람의 정보를 출력해보세요
--(v_empno||' '||v_ename||' '||v_deptno||' '||v_dname)
SET SERVEROUTPUT ON
DECLARE

  v_empno employee.eno%TYPE ;
  v_ename employee.ename%TYPE ;
  v_deptno department.dno%TYPE ;
  v_dname department.dname%TYPE ;

BEGIN

  SELECT    e.eno, e.ename, d.dno, d.dname
    INTO     v_empno, v_ename, v_deptno, v_dname
   FROM    employee e, department d
  WHERE    e.eno = 7900 
     AND    e.dno = d.dno ;

DBMS_OUTPUT.PUT_LINE(v_empno||' '||v_ename||' '||v_deptno||' '||v_dname) ;

END ;

/

--문제4) 7369사원의 급여가 10000이상이면 '상'을 
--5000 이상이면 '중'을 
--그이하면 '하' 출력 

SET SERVEROUTPUT ON 

DECLARE 
 v_level varchar2(10); 
 v_salary employee.salary%TYPE; 
 v_empno employee.eno%TYPE := 7369; 
  
BEGIN 
SELECT salary INTO v_salary FROM employee WHERE employee.eno = v_empno ; 

IF(v_salary  >= 10000) THEN v_level := '상'; 
ELSIF (v_salary >=  5000) THEN v_level := '중'; 
ELSE v_level :='하'; 
END IF; 

DBMS_OUTPUT.PUT_LINE( v_empno || '번 사원의 급여' || v_salary || '는 '|| v_level); 
END; 
/

--문제 5 ) 1부터 숫자중 홀수 10개만 출력하기

SET SERVEROUTPUT ON

DECLARE 
v_N NUMBER := 1; 
v_C NUMBER := 1; 

BEGIN 
 LOOP 
 EXIT WHEN v_C > 10;
   DBMS_OUTPUT.PUT_LINE(v_N); 
   v_N := v_N+2; 
   v_C := v_C+1; 
 END LOOP; 
END; 
/

SET SERVEROUTPUT ON

DECLARE 
  v_N NUMBER := 1; 
  v_C NUMBER := 1; 

BEGIN 
 WHILE v_C<=10 LOOP 
   DBMS_OUTPUT.PUT_LINE(v_N); 
   v_N := v_N+2; 
   v_C := v_C+1; 
 END LOOP; 
END; 
/

--문제6) 사원테이블에서 30 번 부서인 사원의 사원번호, 이름, 직책 출력하기  (cursor 사용)
-- (v_emp.eno || '  ' || v_emp.ename || '  ' || v_emp.job)
SET SERVEROUTPUT ON

DECLARE
  v_emp  employee%rowtype ;
  cursor c1
  is
  select * from  employee where dno = 30;

BEGIN
  for v_emp in c1 loop
    exit when c1%notfound;
    dbms_output.put_line(v_emp.eno || '  ' || v_emp.ename || '  ' || v_emp.job);
  end loop;
END ;


--문제7) 문제6번 에서 커서 패치 사용  출력
SET SERVEROUTPUT ON

DECLARE
  v_emp  employee%rowtype ;
  cursor c1
  is
  select * from  employee where dno = 30;

BEGIN
  open c1;
  loop
  fetch c1 into v_emp;
  exit when c1%NOTFOUND;
    dbms_output.put_line(v_emp.eno || '  ' || v_emp.ename || '  ' || v_emp.job);
  end loop;
  close c1;
END ;
/