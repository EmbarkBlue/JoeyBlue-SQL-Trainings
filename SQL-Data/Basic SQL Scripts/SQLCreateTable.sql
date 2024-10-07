CREATE TABLE dbo.employee
(
	employee_number int not null,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	job_description varchar(50) not null,
	manager_number int null,
	hire_date date null,
	salary decimal(19,2) null,
	constraint PK_employee_employee_number primary key (employee_number),
	constraint FK_employee_manager_number foreign key (manager_number) references employee(employee_number)
)






--string
	--varchar - 1 byte
	--nvarchar - 2 bytes
--numbers
	--int - 4 byte integer
	--decimal/numeric - (12,4) - 12,345,678.1234
	--float - rounding
--dates
	--datetime - 1900 min date
	--datetime2 - More dates
	--date - no time portion



select * from employee

CREATE TABLE tableName
(
	column1 varchar,
	column2 varchar
)

CREATE TABLE employee(
	employee_name varchar
)


drop table dbo.EmployeeTest
CREATE TABLE dbo.EmployeeTest
(
	EmployeeNumber int,
	EmployeeFirstName varchar(255),
	EmployeeLastName varchar(255)
)
insert into dbo.EmployeeTest (EmployeeNumber,EmployeeLastName,EmployeeFirstName) values (null,'blue', 'joey')