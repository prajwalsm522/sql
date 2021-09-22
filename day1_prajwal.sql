create database student;

use student;

create table student_details(
id int not null primary key,
name varchar(20),
marks int );

select * from student_details;

insert into student_details values(5,'prajwal',70);

select * from student_details where marks >70 and marks <90;

select * from student_details where marks >70 or marks <90;

select * from student_details where name= 'raju';

select id as student_roll_number from student_details;

select * from student_details order by id asc;

select * from student_details order by id desc;

select * from student_details where id>3 order by id desc;

select count(*) from student_details;

select count(*) as total from student_details;

select distinct id from student_details;

select * from dept;
select * from dept d, student_details s  where s.dept_id =100;

select s.* from dept d, student_details s where s.marks >50 and d.dep_name= 'maths' and s.dep_id=d.dep_id;

select dep_id from dept where dep_name= 'computer';

select * from student_details where dep_id = (select dep_id from dept where dep_name= 'computer');

select dep_id from dept where dep_name='computer'|| dep_name='maths';

select * from student_details where dep_id in (select dep_id from dept where dep_name='computer'|| dep_name='maths');

select * from student_details s, dept d where s.marks > 70 and d.dep_name= 'maths';