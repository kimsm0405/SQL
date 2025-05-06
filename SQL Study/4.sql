----4장 연습 문제

--1번--
select * from student;
select * from department;

--ANSI JOIN
select e1.name "STU_NAME", e1.deptno1, e2.dname "DEPT_NAME"
from student e1, department e2
where e1.deptno1 = e2.deptno;

--Oracle JOIN
select e1.name "STU_NAME", e1.deptno1, e2.dname "DEPT_NAME"
from student e1 join department e2
on e1.deptno1 = e2.deptno;

--2번--
select * from emp2;
select * from p_grade;

select e1.name, e1.position, e1.pay, e2.s_pay "Low PAY", e2.e_pay "High Pay"
from emp2 e1, p_grade e2
where e1.position = e2.position;

--3번--
--select e1.name, e1.position
--from emp2 e1;

select e.name, trunc((sysdate - e.birthday) / 365, 0) "AGE",
        e.position "CURR_POSITION", p.position "BE_POSITION"
from emp2 e, p_grade p
where trunc((sysdate - e.birthday) / 365)  between p.s_age and p.e_age;

--4번--
select * from customer;
select * from gift;

--select e1.gname, e1.point, e2.gname
--from customer e1, gift e2
--where e2.gname = notebook ;

select c.gname "CUST_NAME", c.point "POINT",
        g.gname "GIFT_NAME"
from customer c, gift g
where g.g_start <= c.point and g.gname = 'Notebook';

--5번--
select * from professor;

select p1.profno, p1.name, 
        to_char(p1.hiredate, 'yyyy-mm-dd'),
        count(p2.hiredate) "COUNT"
from professor p1, professor p2
where p2.hiredate(+) < p1.hiredate
group by p1.profno, p1.name, p1.hiredate
order by 4;

--6번--
select * from emp;

select e1.empno, e1.ename, e1.hiredate, count(e2.hiredate) "COUNT"
from emp e1, emp e2
where e2.hiredate(+) < e1.hiredate
group by e1.empno, e1.ename, e1.hiredate
order by 4;







