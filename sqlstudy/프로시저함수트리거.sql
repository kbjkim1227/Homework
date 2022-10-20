-- 예제1) 사원번호 입력 받고 그 사원의 급여에 1000을 더한 값으로 갱신하라.
 
ACCEPT p_eno PROMPT '사원의 번호를 입력하시오(+1000):'
DECLARE
    v_sal NUMBER;
BEGIN
    UPDATE employee
    SET salary = salary + 1000
    WHERE eno = &p_eno;
 
    SELECT salary INTO v_sal
    FROM employee
    WHERE eno = &p_eno;
    
    DBMS_OUTPUT.PUT_LINE('사원번호:'||&p_eno||' '||'급여:'||v_sal);
END;
/
 
/*
예제2) 이름,급여,부서번호를 입력받아 EMP 테이블에 자료를 등록하는 SCRIPT를 작성하여라. 
단 10번 부서일 경우, 입력한 급여의 20%를 추가하고 
초기값이 9000부터 9999까지 1씩 증가하는 SEQUENCE(emp_eno_seq)작성하여 
사용하고 아래의 표를 참고하여라.
이    름: 홍길동
급    여: 2000
부서번호: 10
*/
CREATE SEQUENCE emp_eno_seq
INCREMENT BY 1
START WITH 9000
MAXVALUE 9999;
 
ACCEPT p_ename PROMPT '이 름:'
ACCEPT p_sal PROMPT '급 여:'
ACCEPT p_dno PROMPT '부서번호:'
 
DECLARE
    v_name   employee.ename%TYPE := UPPER('&p_ename');
    v_sal    employee.salary%TYPE := &p_sal;
    v_dno    employee.dno%TYPE := &p_dno;
BEGIN
    
    IF v_dno = 10 THEN
        v_sal := v_sal * 1.2;
    END IF;
    
    INSERT INTO employee(eno, ename, hiredate, salary, 
                        dno, job)
    VALUES(emp_eno_seq.nextval, v_name, sysdate, v_sal,
                        v_dno, 'IT_PROG');
END;
/
 
SELECT *
FROM employee
WHERE ename = 'ADMIN';
 
/*
예제3) 
EVEN_ODD(
    ID:NUMBER(4) 
    GUBUN:VARCHAR2(10)
) 
테이블을 작성하고 START숫자와 END숫자를 입력 받아 그 사이의 숫자를 ID에   
ID의 숫자가 짝수이면 GUBUN에 “짝수”를 홀수이면 GUBUN에 “홀수”라고 입력하는 
SCRIPT를 WHILE문으로 작성하여라.
*/
CREATE TABLE EVEN_ODD(
    ID NUMBER(4),
    GUBUN VARCHAR2(10)
);
 
 SET VERIFY OFF;


ACCEPT p_start PROMPT 'start 숫자:'
ACCEPT p_end PROMPT 'end 숫자:'
DECLARE
    v_start NUMBER(4) := &p_start;
    v_end NUMBER(4) := &p_end;
BEGIN
    IF v_start > v_end THEN
        DBMS_OUTPUT.PUT_LINE('start가 end보다 큽니다.');
    ELSE
        WHILE v_start <= v_end LOOP            
            IF MOD(v_start, 2) = 0 THEN
                INSERT INTO EVEN_ODD(id, gubun)
                VALUES(v_start, '짝수');
            ELSE
                INSERT INTO EVEN_ODD(id, gubun)
                VALUES(v_start, '홀수');
            END IF;        
            v_start := v_start + 1;
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE(&p_start || '로부터 ' || &p_end || '까지 '||
                            TO_CHAR(&p_end - &p_start + 1)||'개의 자료가 입력되었습니다');
    END IF;
END;
/
SELECT * FROM EVEN_ODD;
 








--부서명 얻기 -함수
create or replace function func_dname(in_din_eno number) return varchar2 is
  v_dname department.dname%type;
begin
  select dname into v_dname from department where dno=in_dno;
  return v_dname;
end;
/



--삭제  procedure
create or replace procedure del_emp(in_eno employee.eno%type) is
begin
  delete from employee where eno=in_eno;
end;
/
execute up_b(3);   --sql developer에선 실행안되고 cmd->sqlplus에서 한다.

--수정
create or replace procedure upt_emp(in_eno employee.eno%type,
                                    in_job employee.job%type) is
begin
  update employee set job=in_job where eno=in_eno;
end;
/

CREATE OR REPLACE PROCEDURE getDeptName(in_eno IN NUMBER, out_dname OUT VARCHAR2)
IS  
BEGIN
    SELECT e.ename INTO out_dname
      FROM employee e
     WHERE e.eno = in_eno;
END;
/
 

-- 예제4)사원번호를 입력 받으면 다음과 같이 출력되는 PROCEDURE를 작성하라
-- SALES 부서명의 사원입니다
CREATE OR REPLACE PROCEDURE getDeptName(in_eno IN VARCHAR2, out_dname OUT VARCHAR2)
IS  
BEGIN
    SELECT d.dname INTO out_dname
      FROM employee e, department d
     WHERE e.dno = d.dno
       AND e.eno = in_eno;
END;
/
 
VAR dname VARCHAR2(50);
EXECUTE getDeptName(7934, :dname);
PRINT dname;
 
-- 예제5)사원번호를 입력받고, 소속부서의 최고, 최저연봉 차액을 파라미터로 출력하는 
-- PROCEDURE를 작성하라.
CREATE OR REPLACE PROCEDURE emp_diff_sal(in_eno IN employee.eno%TYPE,
                                        out_diff OUT NUMBER)
IS
    v_dno employee.dno%TYPE;
BEGIN
    -- 부서 번호
    SELECT dno INTO v_dno
    FROM employee
    WHERE eno = in_eno;
    
    -- 최고, 최소의 차액
    SELECT (MAX(salary) - MIN(salary)) INTO out_diff
    FROM employee
    WHERE dno = v_dno;
    
END;
/
 
VAR di NUMBER;
execute emp_diff_sal(7934, :di);
PRINT di;
 


-- function(SCOTT)
-- 1) 두 숫자를 제공하면 덧셈을 해서 결과값을 반환하는 함수를 정의하시오.(함수명 add_num)
CREATE OR REPLACE FUNCTION add_num(in_num1 INTEGER, in_num2 INTEGER) 
    RETURN INTEGER
IS    
BEGIN
    RETURN in_num1 + in_num2;
END;
/
 
SELECT add_num(23, 34)
FROM dual;
 
/*
2) 부서번호를 입력하면 해당 부서에서 근무하는 사원 수를 반환하는 함수를 정의하시오.
   (함수명 get_emp_count)
*/
CREATE OR REPLACE FUNCTION get_emp_count(in_dno IN NUMBER) RETURN NUMBER
IS  
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
      FROM employee
    WHERE dno = in_dno
    GROUP BY dno;
    
    RETURN v_count;
END;
/
 
VAR count NUMBER;
EXEC :count := get_emp_count(10);
PRINT count;
 
-- 3) emp테이블을 이용해서 입사일을 제공하면 근무연차를 구하는 함수를 정의하시오.(소수점 
--   자리 절삭, 함수명 get_info_hiredate
-- MONTHS_BETWEEN 함수 사용)
CREATE OR REPLACE FUNCTION get_info_hiredate(hire_date employee.hiredate%TYPE)
    RETURN NUMBER
IS
    v_years NUMBER;
BEGIN
    v_years := trunc( MONTHS_BETWEEN(sysdate, hire_date) / 12 );
    RETURN v_years;
END;
/

SELECT ename, get_info_hiredate(hiredate) as 근무연차
FROM employee;
 
-- 4) emp테이블을 이용해서 사원번호를 입력하면 해당 사원의 관리자 이름을 구하는 함수를
--   정의하시오.(함수명 get_mgr_name)
CREATE OR REPLACE FUNCTION get_mgr_name(in_eno IN INTEGER) 
    RETURN VARCHAR2
IS
    v_mgrname VARCHAR2(10);
BEGIN
    SELECT m.ename INTO v_mgrname
    FROM employee a, employee m
    WHERE a.manager = m.eno
        AND a.eno = in_eno;
        
    RETURN v_mgrname;
END;
/
 
SELECT ename, get_mgr_name(empno) as "관리자명"
FROM employee;
 
/*
5) emp테이블을 이용해서 사원번호를 입력하면 급여 등급을 구하는 함수를 정의하시오.
(4000~5000 A, 3000~4000미만 B, 2000~3000미만 C, 1000~200미만 D, 1000미만 F,
 함수명 get_sal_grade
 --  CASE WHEN 문 사용 )
*/
CREATE OR REPLACE FUNCTION get_sal_grade(in_eno employee.eno%TYPE) 
    RETURN VARCHAR2
IS
    sgrade CHAR(1);
BEGIN
    SELECT
        CASE WHEN salary >= 4000 AND salary <= 5000 THEN 'A'
             WHEN salary >= 3000 AND salary < 4000 THEN 'B'
             WHEN salary >= 2000 AND salary < 3000 THEN 'C'
             WHEN salary >= 1000 AND salary < 2000 THEN 'D'
             ELSE 'F'
        END INTO sgrade
    FROM employee
    WHERE eno = in_eno;
    
    RETURN sgrade;
END;
/
 
SELECT ename, sal, get_sal_grade(eno) AS "급여등급"
FROM employee;
