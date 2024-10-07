--select * from DimAccount where ParentAccountKey is null

with account
as
(
	select AccountKey,AccountDescription, cast(null as nvarchar(50)) as ParentDescription,
	1 lvl, 
	AccountDescription as account_lvl_1,
	cast('' as nvarchar(50)) as account_lvl_2,
	cast('' as nvarchar(50)) as account_lvl_3,
	cast('' as nvarchar(50)) as account_lvl_4,
	cast('' as nvarchar(50)) as account_lvl_5,
	cast('' as nvarchar(50)) as account_lvl_6,
	cast('' as nvarchar(50)) as account_lvl_7
	from DimAccount where ParentAccountKey is null
union all
	select da.AccountKey,da.AccountDescription, a.AccountDescription,
	a.lvl + 1, 
	case when a.lvl = 1 then a.AccountDescription else a.account_lvl_1 end as account_lvl_1,
	case when a.lvl = 1 then da.AccountDescription else a.account_lvl_2 end as account_lvl_2,
	case when a.lvl = 2 then da.AccountDescription else a.account_lvl_3 end as account_lvl_3,
	case when a.lvl = 3 then da.AccountDescription else a.account_lvl_4 end as account_lvl_4,
	case when a.lvl = 4 then da.AccountDescription else a.account_lvl_5 end as account_lvl_5,
	case when a.lvl = 5 then da.AccountDescription else a.account_lvl_6 end as account_lvl_6,
	case when a.lvl = 6 then da.AccountDescription else a.account_lvl_7 end as account_lvl_7
	from account a inner join DimAccount da on a.AccountKey=da.ParentAccountKey
)
select * from account acct inner join DimAccount da on acct.AccountKey=da.AccountKey
where account_lvl_1 = 'Balance Sheet'