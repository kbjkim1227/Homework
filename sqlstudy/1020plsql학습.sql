SET SERVEROUTPUT ON;

BEGIN
    dbms_output.put_line('welcome to oracle');
END;
/


--구구단
SET SERVEROUTPUT ON

DECLARE
    dan   NUMBER := 1;
    i     NUMBER := 1;
BEGIN
    LOOP
        i := 1;
        dan := dan + 1;
        LOOP
            dbms_output.put_line(dan
                                 || '*'
                                 || i
                                 || '='
                                 ||(dan * i)
                                 || '  ');

            i := i + 1;
            IF i > 9 THEN
                dbms_output.new_line;
                EXIT;
            END IF;
        END LOOP;

        IF dan >= 9 THEN
            EXIT;
        END IF;
    END LOOP;
END;
/

SET SERVEROUTPUT ON

DECLARE
    v_level   VARCHAR2(10);
    v_sal     employee.salary%TYPE;
    v_eno     employee.eno%TYPE := 7369;
BEGIN
    SELECT
        salary
    INTO v_sal
    FROM
        employee
    WHERE
        employee.eno = v_eno;

    IF ( v_sal >= 10000 ) THEN
        v_level := '상';
    ELSIF ( v_sal >= 5000 ) THEN
        v_level := '중';
    ELSE
        v_level := '하';
    END IF;

    dbms_output.put_line(v_eno
                         || '번 사원의 급여'
                         || v_sal
                         || '는 '
                         || v_level);

END;
/

--1부터 숫자중 홀수 10개만 출력하기
SET SERVEROUTPUT ON

DECLARE
    v_N   NUMBER := 1; -- 홀수변수
    v_C   NUMBER := 1; -- 회차변수
BEGIN
    LOOP
        EXIT WHEN v_C > 10;
    
--    dbms_output.put_line(v_N);
--    v_N := v_N + 2;
--    v_C := v_C + 1;
    
        if mod(v_N, 2) = 1 then
      dbms_output.put_line(v_N);
      v_C := v_C + 1;
    end if;
    v_N := v_N + 1;

    END LOOP;
END;
/


--사원테이블에서 30 번 부서인 사원의 사원번호, 이름, 직책 출력하기  (cursor 사용)
SET SERVEROUTPUT ON

DECLARE
    v_emp   employee%rowtype;
    CURSOR c1 IS
    SELECT * FROM employee WHERE dno = 30;

BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO v_emp;
        EXIT WHEN c1%notfound;
        dbms_output.put_line(v_emp.eno
                             || '  '
                             || v_emp.ename
                             || '  '
                             || v_emp.job);

    END LOOP;

    CLOSE c1;
END;
/

-- cursor for loop 사용
set serveroutput on  
declare
  v_emp  employee%rowtype ;
  cursor c1
  is
  select * from  employee where dno = 30;
begin
  for v_emp in c1 loop
    exit when c1%notfound;
    dbms_output.put_line(v_emp.eno || '  ' || v_emp.ename || '  ' || v_emp.job);
  end loop;
end;
/

