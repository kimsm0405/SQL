select * from emp;

desc emp;
select empno, ename, hiredate, to_char((sal*12)+comm, '$999,999') "SAL", to_char(sal*1.15, '$999,999') "15% UP"
from emp
where comm is not null;


select empno, ename, sal, comm, nvl2(comm, sal+comm, sal*0) "NVL2"
from emp
where deptno = 30;

select empno, ename, comm, nvl2(comm, 'Exist', 'null') "NVL2"
from emp
where deptno = 30;


select * from student;


SELECT name, jumin,
       DECODE(SUBSTR(jumin, 7, 1), '1', 'MAN', '2', 'WOMAN') "GENDER"
FROM student
WHERE deptno1 = 101;

select name, tel,
        decode(
        case
        when substr(tel, 1, 2) = '02' then '02'
        else substr(tel, 1, 3)
        end, '02', 'SEOUL', '031', 'GYEONGGI', '051', 'BUSAN', '052', 'ULSAN', '055', 'GYEONGNAM')
from student
where deptno1 = 101;




--select empno, ename, sal,
--        case when sal between '1' and '1000' then 'Level 1'
--             when sal between '1001' and '2000' then 'Level 2'
--             when sal between '2001' and '3000' then 'Level 3'
--             when sal between '3001' and '4000' then 'Level 4'
--             when sal > '4001' then 'Level 5'
--        end "LEVEL"
--from emp
--order by sal desc


--select * from professor2
--order by deptno, position 



--select ename, hiredate, sal, 
--        lag(sal,1,0) over (order by hiredate) "LAG"
--    From emp;

select * from emp;

select max(sal+0) , min(sal + 0) , avg(sal + 0)
from emp
where comm is null;


--3장 문제풀이

--1
SELECT 
    ROUND(MAX(sal + COALESCE(comm, 0)), 1) AS max_total,
    ROUND(MIN(sal + COALESCE(comm, 0)), 1) AS min_total,
    ROUND(AVG(sal + COALESCE(comm, 0)), 1) AS avg_total
FROM emp;

--2
desc student;
select count(*)||'EA' "TOTAL",
        count(DECODE(TO_CHAR(birthday, 'MM'), '01', 0))||'EA' "JAN",
        count(DECODE(TO_CHAR(birthday, 'MM'), '02', 0))||'EA' "FEB",
        count(DECODE(TO_CHAR(birthday, 'MM'), '03', 0))||'EA' "MAR",
        count(DECODE(TO_CHAR(birthday, 'MM'), '04', 0))||'EA' "APR",
        count(DECODE(TO_CHAR(birthday, 'MM'), '05', 0))||'EA' "MAY",
        count(DECODE(TO_CHAR(birthday, 'MM'), '06', 0))||'EA' "JUN",
        count(DECODE(TO_CHAR(birthday, 'MM'), '07', 0))||'EA' "JUL",
        count(DECODE(TO_CHAR(birthday, 'MM'), '08', 0))||'EA' "AUG",
        count(DECODE(TO_CHAR(birthday, 'MM'), '09', 0))||'EA' "SEP",
        count(DECODE(TO_CHAR(birthday, 'MM'), '10', 0))||'EA' "OCT",
        count(DECODE(TO_CHAR(birthday, 'MM'), '11', 0))||'EA' "NOV",
        count(DECODE(TO_CHAR(birthday, 'MM'), '12', 0))||'EA' "DEC"
from student;

--3
select count(*) "TOTAL",
        count(decode(substr(tel, 1, instr(tel, ')') -1), '02', 0)) "SEOUL",
        count(decode(substr(tel, 1, instr(tel, ')') -1), '031', 0)) "GYEONGGI",
        count(decode(substr(tel, 1, instr(tel, ')') -1), '051', 0)) "BUSAN",
        count(decode(substr(tel, 1, instr(tel, ')') -1), '052', 0)) "ULSAN",
        count(decode(substr(tel, 1, instr(tel, ')') -1), '053', 0)) "DAEGU",
        count(decode(substr(tel, 1, instr(tel, ')') -1), '055', 0)) "GYEONGNAM"
from student;

--4
--set pagesize 50
--select empno, ename, job, sal from emp;

insert into emp (empno, deptno, ename, sal)
values (1000, 10, 'Tiger', 3600);

insert into emp (empno,deptno,ename,sal)
values (2000,30,'Cat',3000);

select empno, ename, job, sal, deptno from emp;

select deptno, 
        sum(decode(job, 'CLERK', sal, 0)) "CLERK",
        sum(decode(job, 'MANAGER', sal, 0)) "MANAGER",
        sum(decode(job, 'PRESIDENT', sal, 0)) "PRESIDENT",
        sum(decode(job, 'ANALYST', sal, 0)) "ANALYST",
        sum(decode(job, 'SALESMAN', sal, 0)) "SALESMAN",
        sum(NVL2(job, sal, 0)) "TOTAL"
from emp
group by rollup(deptno);

--5
select deptno, ename, sal, sum(sal) over(order by sal) "TOTAL"
from emp;

--order by sal asc;

--6
--select * from fruit;

select sum(decode(name, 'apple', 100)) "APPLE",
        sum(decode(name, 'grape', 200)) "GRAPE",
        sum(decode(name, 'orange', 300)) "ORANGE"
from fruit;

--7
select * from emp;

select count(*)||'EA (' || (COUNT(*) / count(*))*100 || '%)' "TOTAL",
        count(decode(substr(tel, 1, instr(tel, ')') -1), '02', 0))||'EA (' ||
        (count(decode(substr(tel, 1, instr(tel, ')') -1), '02', 0))/count(*)) * 100 ||'%)' "SEOUL",
        count(decode(substr(tel, 1, instr(tel, ')') -1), '031', 0))||'EA (' ||
        (count(decode(substr(tel, 1, instr(tel, ')') -1), '031', 0))/count(*)) * 100 ||'%)' "GYEONGGI",
        count(decode(substr(tel, 1, instr(tel, ')') -1), '051', 0))||'EA (' ||
        (count(decode(substr(tel, 1, instr(tel, ')') -1), '051', 0))/count(*)) * 100 ||'%)' "BUSAN",
        count(decode(substr(tel, 1, instr(tel, ')') -1), '052', 0))||'EA (' ||
        (count(decode(substr(tel, 1, instr(tel, ')') -1), '052', 0))/count(*)) * 100 ||'%)' "ULSAN",
        count(decode(substr(tel, 1, instr(tel, ')') -1), '053', 0))||'EA (' ||
        (count(decode(substr(tel, 1, instr(tel, ')') -1), '053', 0))/count(*)) * 100 ||'%)' "DAEGU",
        count(decode(substr(tel, 1, instr(tel, ')') -1), '055', 0))||'EA (' ||
        (count(decode(substr(tel, 1, instr(tel, ')') -1), '055', 0))/count(*)) * 100 ||'%)' "GYEONGNAM"
from student;

--8
select deptno, ename, sal, 
        sum(sal) over(partition by deptno order by sal) "TOTAL"
from emp;

--order by deptno asc;

--9
select deptno, ename, sal, 
        sum(sal) over() "TOTAL_SAL",
        ROUND((RATIO_TO_REPORT(SUM(sal)) OVER()) * 100, 2) "%"
from emp
group by deptno, ename, sal
order by 5 desc;

--10
select deptno, ename, sal, 
        sum(sal) over(partition by deptno) "SUM_DEPT",
        ROUND((RATIO_TO_REPORT(SUM(sal)) OVER(partition by deptno)) * 100, 2) "%"
from emp
group by deptno, ename, sal
order by 1;

--update emp set deptno = 10 where ename = 'cat';

--11
select * from loan;

select l_date "대출일자", l_code "대출종목코드", l_qty "대출건수", l_total "대출총액", sum(l_total) over(order by l_date) "누적대출금액"
from loan
where l_store = 1000;

--12
select l_code "대출종목코드", l_store "대출지점", l_date "대출일자", 
        l_qty "대출건수", l_total "대출액", 
        sum(l_total) over(partition by l_code, l_store order by l_date) "누적대출금액"
from loan;

--13
select l_date "대출일자", l_code "대출구분코드", l_qty "대출건수", l_total "대출총액", 
        sum(l_total) over(partition by l_code order by l_total) "누적대출금액"
from loan
where l_store = 1000;

--14
select deptno, name, pay,
        SUM(pay) over() "TOTAL PAY",
        ROUND(RATIO_TO_REPORT(sum(pay)) over() * 100, 2) "RAITO %"
from professor
group by deptno, name, pay
order by 5 desc;

--15
select deptno, name, pay,
        SUM(pay) over(partition by deptno) "TOTAL DEPTNO",
        ROUND(RATIO_TO_REPORT(sum(pay)) over(partition by deptno) * 100, 2) "RAITO %"
from professor
group by deptno, name, pay
order by 1;

