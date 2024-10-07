--Recursive Join for Hierarchies

WITH cteTable
as
(
		select 0 as num
	union all
		select num + 1 from cteTable where num < 10
)
select * from cteTable