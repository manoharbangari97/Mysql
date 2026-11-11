-- 1 database and sample data

drop database if exists training_functions;
create database training_functions;
use training_functions;

create table courseEnrollments(
studentId int primary key,
firstname varchar(40),
lastname varchar(40),
coursename varchar(40),
fee decimal(10,2),
enrollmentdate date,
completiondate date
);



insert into courseEnrollments(studentId,firstname,lastname,coursename,fee,enrollmentdate,completiondate)
values
(1, 'Manohar', 'Singh', 'MySQL', 5000.50, '2026-11-11', '2026-12-11'),
(2, 'Monu', 'rawat', 'Python', 6000.75, '2026-11-12', '2027-01-12'),
(3, 'Mayank', 'bangari', 'Java', 7000.25, '2026-11-13', '2027-02-13');

select * from courseEnrollments;

-- string functions
-- 01.-------------?
select 
upper(concat(firstname,' ',lastname)) 
as fullname
from courseEnrollments;

-- 02.-------------?
select 
concat(upper(substring(firstname,1,1)),substring(firstname,2), ' ', lastname)
as fullname
from courseEnrollments;

-- 03.-------------?
select
concat(upper(left(coursename,3)),'_',studentId)
as studentcode
from courseEnrollments;

-- 04.-------------?
select firstname,
reverse(firstname) as reversedfirstname,
char_length(firstname) as charactercount
from courseEnrollments;

-- 05.-------------?
select firstname,
locate('a',firstname)
from courseEnrollments;

-- 06.-------------?
select firstname,
upper(replace(firstname,'a', 'o') )as firstnamereplace 
from courseEnrollments;

-- 07.-------------?
select firstname,
lpad(firstname,12,'0') 
from courseEnrollments;

-- 08.-------------?
select 
concat(right(coursename,2),'_',left(firstname,2))
as courselable
from courseEnrollments;

-- 09.-------------?
select
concat(
upper(substring(firstname,1,3)),lower(right(lastname,2)))
as studentname
from courseEnrollments;

-- Numeric functions
-- 10.-------------?
select firstname,
fee,round(fee,1) as rounded_one_decimal,
fee,round(fee,0) as rounded_whole_number
from courseEnrollments;

-- 11.-------------?
select 
firstname,
fee,
ceil(fee) as feeceiling,
floor(fee) as feefloor
from courseEnrollments;

-- 12.-------------?
select
firstname,
fee,mod(fee,500) as remainder 
from courseEnrollments;

-- 13.-------------?
select
firstname,
fee,abs(fee-10000) as feeabs
from courseEnrollments;

-- 14.-------------?
select
firstname,
fee,round(fee*1.18,2) as feeround
from courseEnrollments;

-- 15.-------------?
select
firstname,
fee,format(fee,2) as feeformat
from courseEnrollments;

-- Date functions
-- 16.-------------?
select
firstname,
date_format(enrollmentdate,'%Y/ %D %M/ %W') as enrollmentdate
from courseEnrollments;

-- 17.-------------?
select 
firstname,
date_format(enrollmentdate,'%D/%M/%Y') as enrollmentdate,
date_format(completiondate,'%D/%M/%Y') as completiondate
from courseEnrollments;

-- 18.-------------?
select
firstname,
timestampdiff(day,enrollmentdate,completiondate) as totaldays
from courseEnrollments;

-- 19.-------------?
select
firstname,
enrollmentdate,
date_add(date_add(enrollmentdate,interval 1 month), interval 10 day) as newenrollmentdate
from courseEnrollments;

-- 20.-------------?
select
firstname,
completiondate,
date_add(completiondate, interval -7 day)  as PreviousDate
from courseEnrollments;

-- 21.-------------?
select
firstname,
enrollmentdate,
completiondate,
timestampdiff(month,enrollmentdate,completiondate) as totalmonths
from courseEnrollments;

-- 22.-------------?
select
firstname,
enrollmentdate,
date_add(date_add(date_add(enrollmentdate, interval 1 year), interval 2 month ),interval 5 day) as newenrollmentdate
from courseEnrollments;

-- 23.-------------?
select
firstname,
enrollmentdate,
dayname(enrollmentdate) as enr_weekdayname,
completiondate,
dayname(completiondate) as com_weekdayname
from courseEnrollments;

-- 24.-------------?
select
studentId,
firstname,
enrollmentdate,
timestampdiff(day,enrollmentdate,curdate()) as totaldays
from courseEnrollments;

-- 25.-------------?
select
firstname,
date_format(completiondate,'%d/%m/%Y') as OriginalDate_formate,
date_format(date_add(completiondate,interval 15 day),'%D/%M/%Y') as newdate_formate
from courseEnrollments;