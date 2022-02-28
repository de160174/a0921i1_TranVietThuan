create database `student_management`;
use student_management;
create table if not exists Class(
id INT primary key,
`name` varchar(50)
);
create table if not exists Teacher(
id INT primary key,
`name` varchar(50),
age INT,
country varchar(50)
);
select * from Teacher;