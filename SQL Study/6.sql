INSERT INTO table [(column1, column2,……)]
VALUES (value 1 , value 2,….) ;

insert into dept2 (dcode, dname, pdept, area)
values(9000, 'temp_1', 1006, 'Temp Area');

ALTER SESSION SET NLS_DATE_FORMAT=’YYYY-MM-DD:HH24:MI:SS’ ;

update professor
set bonus = 200
where position = 'assistant professor' ;

update professor
set pay = pay * 1.15
where position = ( select position
                    from professor
                    where name = 'Sharon Stone')
and pay < 250 ;

------------------------------------

---- 6장 연습문제
--1번
select * from dept2;

insert into dept2 (dcode, dname, pdept, area)
values (9010, 'temp_10', 1006, 'temp area');

--2번
insert into dept2 (dcode, dname, pdept)
vlaues (9020, 'temp_20', 1006);

--3번
select * from professor;

create table professor4
as
    select profno, name, pay
    from professor
    where 1 = 2;

insert into professor4 (profno, name, pay)
    select profno, name, pay
    from professor
    where profno <=3000;

--4번
update professor
set bonus = 100
where name = 'sharon stone' ;





