CREATE TABLE dept6
AS
    SELECT dcode , dname
    FROM dept2
    WHERE dcode IN(1000,1001,1002) ;
    
ALTER TABLE dept6
    ADD (location VARCHAR2(10));
    
    
ALTER TABLE dept7 DROP COLUMN loc ;

TRUNCATE  TABLE  dept7 ;

DROP TABLE dept7 ;

SELECT * FROM t_readonly ;

ALTER TABLE  t_readonly read only ;


CREATE TABLE  sales10
    ( no      NUMBER,
        pcode CHAR(4),
        pdate CHAR(8),
        pqty NUMBER,
        pbungi NUMBER(1)
        GENERATED ALWAYS  AS 
    (
    CASE
        WHEN  SUBSTR(pdate,5,2)  IN  ('01','02','03')  THEN  1
        WHEN  SUBSTR(pdate,5,2)  IN  ('04','05','06')  THEN  2
        WHEN  SUBSTR(pdate,5,2)  IN  ('07','08','09')  THEN  3
        ELSE  4
       END ) virtual );

-----------------------------------------------------

----5장 연습문제

--1번
create table new_emp
    ( NO    NUMBER(5),
    NAME    VARCHAR2(20),
    HIREDATE    DATE,
    BONUS   NUMBER(6,2) );

select * from new_emp;

--2번
create table new_emp2
    as
        select no, name, hiredate from new_emp;

select * from new_emp2;

--3번
create table new_emp3
    as select * from new_emp
    where 1 = 2;
    
--4번
alter table new_emp2
    add (BIRTHDAY DATE default sysdate);

--5번
alter table new_emp2 rename column birthday to birth;

--6번
alter table new_emp2 modify (no number(7) );

--7번
alter table new_emp2 drop column birth;

--8번
insert into new_emp2 vlaues(1, 'hong', sysdate);

truncate table new_emp2;

--9번
drop table new_emp2;




















