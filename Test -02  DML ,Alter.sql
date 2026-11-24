CREATE DATABASE interview_commands_practice;
USE interview_commands_practice;
SET autocommit = 1;
CREATE TABLE employees (
 employee_id INT PRIMARY KEY,
 employee_name VARCHAR(60),
 department VARCHAR(30),
 city VARCHAR(40),
 salary DECIMAL(10, 2),
 employment_status VARCHAR(15),
 phone VARCHAR(15)
) ENGINE = InnoDB;

INSERT INTO employees
(employee_id, employee_name, department, city,
 salary, employment_status, phone)
VALUES
(1, 'Rahul Sharma', 'IT', 'Delhi',
 45000.00, 'Active', '9000000001'),
(2, 'Priya Verma', 'HR', 'Mumbai',
 42000.00, 'Active', '9000000002'),
(3, 'Amit Patel', 'Sales', 'Ahmedabad',
 38000.00, 'Inactive', '9000000003'),
(4, 'Anjali Singh', 'IT', 'Kolkata',
 50000.00, 'Active', '9000000004'),
(5, 'Vijay Kumar', 'Finance', 'Bangalore',
 55000.00, 'Active', '9000000005'),
(6, 'Sanjay Reddy', 'Sales', 'Hyderabad',
 36000.00, 'Active', '9000000006'),
(7, 'Megha Iyer', 'IT', 'Chennai',
 48000.00, 'Active', '9000000007'),
(8, 'Neha Gupta', 'HR', 'Delhi',
 32000.00, 'Inactive', '9000000008'),
(9, 'Arjun Mehta', 'Finance', 'Pune',
 52000.00, 'Active', '9000000009'),
(10, 'Pooja Shah', 'Sales', 'Mumbai',
 40000.00, 'Active', '9000000010');
COMMIT;


-- Q1----------?

INSERT INTO employees
                    (employee_id, employee_name, department, city,
					salary, employment_status, phone)
                     values
                    (11,'manohar','IT','delhi',70000,'Active',9803060000);
 
-- Q2----------?

INSERT INTO employees
                  (employee_id, employee_name, department, city,
                  salary, employment_status, phone)
				  values
                  (12, 'Simran Kaur', 'HR', 'Delhi',35000.00, 'Active', 9000000012),
				  (13, 'Rohan Das', 'Sales', 'Pune',33000.00, 'Inactive', 9000000013);
 
-- Q3----------?

update 
     employees
     set
     city ='gurgaon',
     salary = 46000.00
     where employee_id=11;
  
-- Q4----------?
  
  update 
     employees
     set
     salary = salary * 1.10
     where employee_id in (1,4,7);
     COMMIT;
     SELECT @@autocommit;

-- Q5----------?

delete 
      from employees
      where employee_id in (3,8,13);

-- Q6----------?

alter
     table employees
     add column 
     email varchar(100) null;
     
-- Q7----------?

alter
     table employees
     modify column phone varchar(20) null;
     
describe employees;

-- Q8----------?

alter
     table employees
     rename column city to work_city;
     
select *from employees;

-- Q9----------?

alter
     table employees
     drop column email;
     
-- Q10----------?

rename
       table employees 
       to staff;

select *from staff;

-- Q11----------?

start transaction;
INSERT INTO staff
                  (employee_id, employee_name, department, work_city,
                  salary, employment_status, phone)
				  values
                  (14, 'Nisha Rao', 'IT', 'Noida', 44000.00, 'Active', 9000000014);

update  
      staff
      set salary =45000.00
      where employee_id =2;
      
commit;
rollback;

select *
       from staff
       where employee_id in (2,14);
       
-- Q12----------?

start transaction;
update  
      staff
      set salary =60000.00
      where employee_id =5;
      
delete from staff
                where employee_id =6;
rollback;
select *
       from staff
       where employee_id in (5,6);

-- Q13----------?

start transaction;
-- 1
update  
      staff
      set salary = 47000.00
      where employee_id =14;
      
savepoint salary_saved;
-- 2
update  
      staff
		set work_city = 'jaipur'
       where employee_id =14;
       
savepoint city_saved; 
-- 3
delete from staff
                where employee_id =14;

rollback to city_saved;
rollback to salary_saved;
commit;

-- Q14----------?

start transaction;
truncate table staff;
rollback;
select *from staff;

-- Q15----------?
	
drop DATABASE interview_commands_practice;