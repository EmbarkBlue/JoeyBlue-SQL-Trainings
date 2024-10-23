select * from dbo.financial_transactions
select * from dbo.exchange_rates
select * from dbo.suppliers

--Join
select t.*, c.customer_name, c.email customer_email, c.phone customer_phone
from dbo.financial_transactions t 
inner join dbo.customer_details c on t.customer_id=c.customer_id


/*
alter table dbo.financial_transactions
add [customer_name] [varchar](50) NULL,
	[customer_email] [varchar](100) NULL,
	[customer_phone] [varchar](20) NULL
*/

--truncate table dbo.financial_transactions

/*
create table dbo.exchange_rates
(
from_currency varchar(10),
to_currency	varchar(10),
exchange_rate float,
effective_date date
)

create table dbo.suppliers
(
	supplier_id int,
	supplier_name varchar(100),
	contact_name varchar(100),
	phone varchar(25)
)
*/
/*
alter table dbo.financial_transactions
add amount_USD float
*/

/*
alter table dbo.financial_transactions
add [supplier_contact_name] [varchar](100) NULL,
	[supplier_phone] [varchar](25) NULL
*/