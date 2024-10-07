--Create Database
Create Database Customer;

--Create Customer Table
create table Customer
(
	FirstName varchar(50),
	LastName varchar(50),
	Age int
);

--Insert Initial Data
insert into Customer (FirstName,LastName,[Age]) values ('Joey','Blue',40);
insert into Customer (FirstName,LastName,[Age]) values ('Barry','Bonds',50);
insert into Customer (FirstName,LastName,[Age]) values ('Mike','Schmidt',60);
insert into Customer (FirstName,LastName,[Age]) values ('Mike','Schmidt1',61);
insert into Customer (FirstName,LastName,[Age]) values ('Mike','Schmidt2',62);
insert into Customer (FirstName,LastName,[Age]) values ('Mike','Schmidt3',63);
insert into Customer (FirstName,LastName,[Age]) values ('Mike','Schmidt4',64);
insert into Customer (FirstName,LastName,[Age]) values ('Mike','Schmidt5',65);

--This deletes mike schmidt
/*
DELETE Customer
where FirstName='Mike'
and LastName Like 'Schmidt_';
*/

--Select Mike Schmidt
select *
from Customer
where FirstName='Mike'
and LastName Like 'Schmidt_';

--Update City on Barry Bonds
update Customer
Set City='Goddard'
where FirstName='Barry'
and LastName = 'Bonds' ;

--Add City to the Customer Table
alter table customer
add City varchar(50);

--Drop the Customer Table
drop table customer;

--Create Customer Table with Primary Key
create table Customer
(
	Id int Primary Key identity(1,1),
	FirstName varchar(50),
	LastName varchar(50),
	Age int,
	City varchar(50)
)

--Insert Customer Data
insert into Customer 
(FirstName,LastName,[Age],City) values ('Joey','Blue',40, 'Goddard');
insert into Customer 
(FirstName,LastName,[Age],City) values ('Barry','Bonds',50, 'San Francisco');
insert into Customer 
(FirstName,LastName,[Age],City) values ('Mike','Schmidt',60, 'KC');

--Create Products Table
create table Products
(
	id int primary key identity(1,1),
	ProductName varchar(50)
)

--Add Price to Products Table
alter table Products
add Price float;

--Select everything from Products table
select * from Products

--Insert Products
insert into Products (ProductName, Price) values ('Baseball', 5.95);
insert into Products (ProductName, Price) values ('Bat', 195.99);

--Create Orders Table
Create table Orders
(
	OrderId int primary key identity(1,1),
	OrderDate Datetime,
	CustomerID int,
	ProductID int
)

--Insert Orders
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),1,1);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),1,1);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),2,1);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),2,1);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),2,2);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),2,2);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),2,2);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),2,2);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),3,2);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),3,2);
insert into Orders (OrderDate,CustomerID,ProductID) values (GetDate(),4,2); --Bad Record

--Select from Tables
select * from Orders;
select * from Products;
select * from Customer;

--Delete Bad Order  **Your OrderId may be different
delete Orders
where OrderId=21;

--Add Foreign Keys to the Orders table
alter table orders
add foreign key (CustomerId) references Customer(Id);

alter table orders
add foreign key (ProductId) references Products(Id);

--Find the Total and Average Price per City
select c.City,sum(p.Price),AVG(p.price) Total
from Orders o 
inner join Products p on o.ProductID=p.id
inner join Customer c on o.CustomerID=c.Id
group by c.City