USE [master]
GO

if not exists(select * from sys.databases where name = 'SqlTrainingOnlineUniversityDB')
CREATE DATABASE [SqlTrainingOnlineUniversityDB]
GO

USE [SqlTrainingOnlineUniversityDB]
GO

/* SqlTrainingOnlineUniversityDB - DDL */
create table STUDENT 
(
	S_ID int PRIMARY KEY
	,S_FNAME varchar(30)
	,S_LNAME varchar(30)
	,S_ADDRESS varchar(100)
	,S_CITY varchar(30)
	,S_STATE varchar(30)
	,S_ZIPCODE varchar(5)
	,S_PHONE varchar(12)
)
go

create table SCHOLARSHIPS
(
	S_ID int PRIMARY KEY FOREIGN KEY REFERENCES STUDENT
	,SC_MAJOR varchar(30)
	,SC_ACADEMIC float
	,SC_ATHLETIC float
)
go

create table GPA
(
	S_ID int PRIMARY KEY FOREIGN KEY REFERENCES STUDENT
	,G_GPA float
	,G_CLASS tinyint /*(4 is for Seniors)*/
)
go

/* SqlTrainingOnlineUniversityDB DML */
--Student Table Data
insert into student (S_ID,S_FNAME,S_LNAME,S_ADDRESS,S_CITY,S_STATE,S_ZIPCODE,S_PHONE) values (1,'Bob','Smith','123 Oak Rd.','Kansas City','KS','66105','555-661-4567');
insert into student (S_ID,S_FNAME,S_LNAME,S_ADDRESS,S_CITY,S_STATE,S_ZIPCODE,S_PHONE) values (2,'Bill','Doe','124 Summer Lane','Wichita','KS','67202','555-672-4568');
insert into student (S_ID,S_FNAME,S_LNAME,S_ADDRESS,S_CITY,S_STATE,S_ZIPCODE,S_PHONE) values (3,'Steve','Eck','125 Midnight Ct.','New York City','NY','10004','555-100-4569');
insert into student (S_ID,S_FNAME,S_LNAME,S_ADDRESS,S_CITY,S_STATE,S_ZIPCODE,S_PHONE) values (4,'Jan','Ricke','126 Autumn Ct.','San Francisco','CA','94104','555-941-4570');
insert into student (S_ID,S_FNAME,S_LNAME,S_ADDRESS,S_CITY,S_STATE,S_ZIPCODE,S_PHONE) values (5,'Tommy','Simone','127 Maple Avenue','Dallas','TX','75212','555-752-4571');
insert into student (S_ID,S_FNAME,S_LNAME,S_ADDRESS,S_CITY,S_STATE,S_ZIPCODE,S_PHONE) values (6,'Sally','Brown','128 Greenwood Rd.','Orlando','FL','32822','555-328-4572');
insert into student (S_ID,S_FNAME,S_LNAME,S_ADDRESS,S_CITY,S_STATE,S_ZIPCODE,S_PHONE) values (7,'Eve','Red','129 Evergreen Rd.','Anchorage','AK','99504','555-995-4573');
go

--GPA Table Data
insert into GPA (S_ID,G_GPA,G_CLASS) values (1,3.14,2);
insert into GPA (S_ID,G_GPA,G_CLASS) values (2,3.76,3);
insert into GPA (S_ID,G_GPA,G_CLASS) values (3,4,4);
insert into GPA (S_ID,G_GPA,G_CLASS) values (4,3.33,2);
insert into GPA (S_ID,G_GPA,G_CLASS) values (5,2.75,3);
insert into GPA (S_ID,G_GPA,G_CLASS) values (6,3.21,1);
insert into GPA (S_ID,G_GPA,G_CLASS) values (7,3,4);
go

--Scholarships Table Data
insert into scholarships (S_ID,SC_MAJOR,SC_ACADEMIC,SC_ATHLETIC) values (1,'Education',0.35,0);
insert into scholarships (S_ID,SC_MAJOR,SC_ACADEMIC,SC_ATHLETIC) values (2,'Mathematics',0.25,0.6);
insert into scholarships (S_ID,SC_MAJOR,SC_ACADEMIC,SC_ATHLETIC) values (3,'Music',0.4,0);
insert into scholarships (S_ID,SC_MAJOR,SC_ACADEMIC,SC_ATHLETIC) values (4,'Business Administration',0.63,0);
insert into scholarships (S_ID,SC_MAJOR,SC_ACADEMIC,SC_ATHLETIC) values (5,'Psychology',0.25,0);
insert into scholarships (S_ID,SC_MAJOR,SC_ACADEMIC,SC_ATHLETIC) values (6,'Sociology',0.25,0);
insert into scholarships (S_ID,SC_MAJOR,SC_ACADEMIC,SC_ATHLETIC) values (7,'Chemistry',0.45,0);
go
