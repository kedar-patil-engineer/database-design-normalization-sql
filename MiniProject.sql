CREATE DATABASE SCHEDULE;


create table Address_T
(
Add_ID varchar(6) NOT NULL,
City varchar(20),
ZIP varchar(20),
constraint AddressPK Primary key (Add_ID));
drop table Address_T

create table StudentT
(
Net_ID varchar(6) NOT NULL,
Sname varchar(20),
Major varchar(20),
GradSem varchar(10),
Saddress varchar(20),
Add_ID varchar(6),
constraint StudentPK Primary key (Net_ID),
constraint AddressFK1 foreign key (Add_ID) references Address_T(Add_ID));
drop table StudentT

create table InstructorT
(
Instructor_ID varchar(10) NOT NULL,
Instructor_Name varchar(20),
Office varchar(20),
Tadd varchar(20),
Add_ID varchar(6),
constraint InstructorPK Primary key (Instructor_ID),
constraint AddressFK2 foreign key (Add_ID) references Address_T(Add_ID));
drop table InstructorT

create table CourseT(
Course# varchar(10) NOT NULL,
Course_Name varchar(20),
Credit_hours integer,
Classroom varchar(10),
Instructor_ID varchar(10),
constraint Course Primary key (Course#),
constraint InstructorFK foreign key (Instructor_ID) references InstructorT(Instructor_ID));
drop table CourseT

create table StudentEnrollment(
Net_ID varchar(6),
Course# varchar(10),
Enrollment_year integer,
constraint StudentEnrollmentPK primary key (Enrollment_year,Net_ID,Course#),
constraint StudentFK foreign key (Net_ID) references StudentT(Net_ID),
constraint CourseFK foreign key (Course#) references CourseT(Course#));
drop table StudentEnrollment

create table BookT
(
Course_Book varchar(20),
CourseBookPublisher varchar(20),
Course# varchar(10),
constraint BookPK primary key (Course_Book,Course#),
constraint CourseFK1 foreign key (Course#) references CourseT(Course#));
drop table BookT



insert into Address_T values
('1','San Jose','94440'),
('2','San Mateo','98650'),
('3','San Francisco','95510'),
('4','San Jose','95742'),
('5','San Mateo','98650'),
('6','Fremont','96582'),
('7','Oakland','98552'),
('8','Fresno','94770'),
('9','Hayward','94541'),
('10','Hayward','94543'),
('11','Hayward','94545');

insert into StudentT values
('de6475','Sagar P','Data Visualization','May-20','Highpoint way','9'),
('rk6443','Kedar P','Data Analysis','May-20','Highpoint way','9'),
('qx3576','Christina','Project Management','May-20','Ferry Perry','10'),
('gg7990','Ayushi','Data Warehousing','May-19','City View','11'),
('hw4587','Shubhangi','Data Design','May-19','City View','11'),
('mc5962','Siddharth Ji','Data Science','May-20','City Centre','9'),
('pr6970','Rutweek','Data Administration','May-20','City Centre','9');


insert into InstructorT values
('T7550','Chonqwi','VBT311','Mission','1'),
('T6930','Jiming','VBT301','Wodland','2'),
('T5289','Jyotishka','VBT323','Baker street','3'),
('T5670','Patrick','VBT468','Jackson st','4'),
('T4557','Paula','VBT416','Woodland','5'),
('T6841','Surendra','VBT121','Crest Blvd','6'),
('T8215','Timothy','VBT595','Bill Hills','7'),
('T2200','Lan Wang','VBT 212','Grenwich','8');

insert into CourseT values
('BAN 601','Stats','3','N2322','T7550'),
('BAN 602','Python','3','S1234','T6930'),
('BAN 610','Database','3','S2121','T5289'),
('BAN 622','Text Mining','3','N8989','T5670'),
('BAN 640','Data Warehousing','3','S1234','T6930'),
('BAN 630','Big Data','3','S7996','T4557'),
('BAN 650','Data Mining','3','V4847','T8215'),
('BAN 620','Data Analytics','3','V1122','T2200');

insert into StudentEnrollment values
('de6475','BAN 601','2018'),
('de6475','BAN 602','2018'),
('de6475','BAN 610','2018'),
('rk6443','BAN 601','2018'),
('rk6443','BAN 602','2018'),
('rk6443','BAN 610','2018'),
('qx3576','BAN 601','2018'),
('qx3576','BAN 602','2018'),
('qx3576','BAN 610','2018'),
('qx3576','BAN 620','2018'),
('gg7990','BAN 601','2018'),
('gg7990','BAN 602','2018'),
('gg7990','BAN 610','2018'),
('gg7990','BAN 620','2018'),
('gg7990','BAN 622','2018'),
('gg7990','BAN 640','2018'),
('gg7990','BAN 630','2018'),
('gg7990','BAN 650','2018'),
('hw4587','BAN 601','2018'),
('hw4587','BAN 602','2018'),
('hw4587','BAN 610','2018'),
('hw4587','BAN 620','2018'),
('hw4587','BAN 622','2018'),
('hw4587','BAN 640','2018'),
('hw4587','BAN 630','2018'),
('hw4587','BAN 650','2018'),
('mc5962','BAN 601','2018'),
('mc5962','BAN 602','2018'),
('mc5962','BAN 610','2018'),
('pr6970','BAN 601','2018'),
('pr6970','BAN 602','2018'),
('pr6970','BAN 610','2018');


insert into BookT values
('Fun with stats','Simone joy','BAN 601'),
('Python for begineers','Fredrick B','BAN 602'),
('Advanced database','Vaibahv J','BAN 610'),
('Mining Tools','Kim T','BAN 622'),
('Warehouse basics','Fred H','BAN 640'),
('Big DataTechs','Rahul K','BAN 630'),
('Data Mining Book','Wolfram','BAN 650'),
('Analytics Guide','Matthew P','BAN 620');

ALTER AUTHORIZATION ON DATABASE::SCHEDULE TO [SA];

--Query 1
Select COUNT(Net_ID) AS No_Of_Students_Taking_Same_COurse from StudentT 
Where GradSem IN (Select GradSem from StudentT)
Group by GradSem;


--Query 2
Select DISTINCT Sname, Major from StudentT,StudentEnrollment
where  Course# = 'BAN 610'

--Query 3
Select Distinct StudentT.Net_ID, Sname from StudentT 
Inner Join StudentEnrollment On StudentT.Net_ID = StudentEnrollment.Net_ID
where Enrollment_year= 2018 AND StudentEnrollment.Net_ID in(
select Net_ID from StudentEnrollment 
Group by Net_ID
Having Count(Course#)= 8);



--Query 4
select Net_id,count(course#)*3 as totalcredithours from studentENROLLMENT group by net_ID;


--Query 5
select instructort.instructor_name,count(courset.course#) As Course_Book_Count 
from instructort,courset 
where instructort.instructor_id=courset.instructor_id 
group by instructort.instructor_name;
