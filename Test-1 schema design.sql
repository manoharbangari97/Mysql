-- Part 1: Database Setup
-- 1.Drop the Shopping_Management database if it already exists.

 drop database if exists shopping_Management;

-- 2.Create a database named Shopping_Management.
 
 create database shopping_Management;
 
 -- 3.Select Shopping_Management as the current database.
use shopping_Management;

-- Part 2: Create the Parent Table — customers

create table customers(
customer_id int primary key auto_increment,
customer_name varchar(50) not null,
email varchar(50) unique,
phone_number varchar(10) not null unique,
age tinyint unsigned check(age>0),
gender enum('male','femail','other'),
country varchar(50) default'india',
city varchar(50) not null,
pincode varchar(6) default'263661',
registration_date date default(current_date),
registration_time time default( current_time),
created_at_datetime timestamp default(current_timestamp),
address tinytext,
customer_status enum('Active','Inactive','Blocked') default 'active',
customer_notes tinytext

);

select * from customers;



insert into customers(customer_name,email,phone_number,age,gender,city,address)
values
('mayank','mayank.singhi97@gmail.com',547595015,'29','male','noida','sec.62');





-- Part 3: Create the Child Table — orders

create table orders(
order_id int primary key auto_increment,
customer_id int,
order_date date default(current_date),
order_amount decimal(10,2) not null,
order_status enum('Pending', 'Processing','Shipped','Delivered','Cancelled') default 'pending',
payment_method enum('Cash', 'Card', 'UPI','Net Banking'),
payment_status enum('Pending', 'Paid','Failed') default 'pending',
shipping_address varchar(250) not null,
delivery_pincode varchar(6),
quntity int not null check (quntity>0),
discount_amount decimal(10,2) default '0',
delivery_date date default null,
create_at timestamp default(current_timestamp),
tracking_number varchar(20) unique,
delivery_status enum('Not Dispatched','InTransit','Delivered','Returned') default 'Not Dispatched',
order_notes tinytext,
foreign key(customer_id) references customers(customer_id) on delete cascade,
foreign key(customer_id) references customers(customer_id) on update cascade
);


select *from orders;


insert into orders(customer_id,order_amount,payment_method,shipping_address,delivery_pincode,quntity ,discount_amount,delivery_date, tracking_number,delivery_status,order_notes)
values
(1, 2500.00, 'Cash', 'Dammam Saudi Arabia',
 '32211', 2, 100.00, NULL, 'TRK001',
 'Not Dispatched', 'First order');


SELECT *
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;
