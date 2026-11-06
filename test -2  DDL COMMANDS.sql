drop database if exists company_training;

create database company_training;
use company_training;

create table departments(
department_id int not null,
-- rename dept_name to department_name
department_name varchar(80) not null,
city varchar(60)
);

insert into  departments(department_id,department_name,city)
values
(1,'manager','delhi'),
(2,'ceo','noida');

select *from departments;
describe departments;

create table employees(
employee_id int not null,
employee_name varchar(100) not null,
email varchar(120),
department_id int not null,
salary decimal(10,2),
status varchar(20)
);

insert into employees (employee_id,employee_name,email,department_id,salary,status)
values
(101, 'Monu', 'monu@gmail.com', 1, 25000.00, 'Active'),
(102, 'Manohar', 'manohar@gmail.com', 2, 35000.00, 'Active');

select*from employees;
-- this is the old table name i rename it to staff. 
select* from staff;

-- before
describe employees;
-- now 
describe staff;




--  01. Add a PRIMARY KEY constraint on departments.department_id.
 alter table departments add primary key(department_id);
 
 -- 02. Add a PRIMARY KEY constraint on employees.employee_id.
  alter table employees add primary key(employee_id);
  
  -- 03. Add a new column named location of type VARCHAR(100) to the departments table.
  alter table departments add column location varchar(100);
  
  -- 04. Rename the column dept_name to department_name in the departments table, keeping its existing data type and NOT NULL requirement.
  alter table departments change column  dept_name department_name varchar(80);
  
 -- 05. Modify employees.salary to DECIMAL(12,2) and ensure that it does not allow NULL values.
alter table employees modify column salary decimal(12,2) not null;

-- 06. Set the default value of employees.status to Active.
alter table  employees modify column status varchar(20) default 'active';

-- 07. Add a UNIQUE constraint on employees.email.
alter table employees  add constraint un_email unique(email);

-- 08. Rename the employees table to staff.
alter table employees  rename to staff;

select* from staff;
describe staff;

-- 09. Add a FOREIGN KEY constraint on staff.department_id referencing departments.department_id.
alter table staff add constraint fk_department foreign key(department_id) references departments(department_id);

show create table staff;

-- 10. Drop the UNIQUE constraint added to staff.email in Question 7.
alter table staff drop index un_email;

describe staff;

-- 11. Drop the FOREIGN KEY constraint created in Question 9 without dropping the department_id column.
alter table staff drop foreign key fk_department;

-- 12. Drop the PRIMARY KEY constraint from the staff table, retaining its employee_id column.
alter table staff drop primary key;

-- 13. Add the PRIMARY KEY constraint back on staff.employee_id.
alter table staff add primary key(employee_id);

-- 14. Drop the location column from the departments table.
alter table departments drop column location;

-- 15. Rename the database from company_training to company_management using MySQL-supported DDL operations. Create the new database, move both tables to it, and remove the old empty database. (MySQL does not support a direct RENAME DATABASE command.)

create database company_management;

rename table company_training.departments to company_management.departments;
rename table company_training.staff to company_management.staff;

drop database company_training;




