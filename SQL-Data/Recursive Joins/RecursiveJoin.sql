--Recursive Join for Hierarchies

--Skills Required
--CTE's
--Union All
--Joins

with emp
as
(
		select employee_number, employee_name, manager, 1 lvl, 
		cast(',' + cast(employee_number as varchar) + ',' as varchar(250)) emp_concat,
		employee_name as employee_lvl_1,
		cast('' as varchar) as employee_lvl_2,
		cast('' as varchar) as employee_lvl_3,
		cast('' as varchar) as employee_lvl_4
		from employee
		where manager is null
	union all
		select e.employee_number, e.employee_name, e.manager, emp.lvl + 1, 
		cast(emp.emp_concat + cast(e.employee_number as varchar) + ',' as varchar(250)) emp_concat,
		case when emp.lvl = 1 then emp.employee_name else emp.employee_lvl_1 end as employee_lvl_1,
		case when emp.lvl = 1 then e.employee_name else emp.employee_lvl_2 end as employee_lvl_2,
		case when emp.lvl = 2 then e.employee_name else emp.employee_lvl_3 end as employee_lvl_3,
		case when emp.lvl = 3 then e.employee_name else emp.employee_lvl_4 end as employee_lvl_4
		from employee e inner join emp on emp.employee_number=e.manager
)
select * from emp

--King, 7839
----Jones, 7566
------Scott, 7788
------Ford, 7902
--------Smith, 7369
----Blake, 7698
----Clark, 7782

select * from dbo.employee