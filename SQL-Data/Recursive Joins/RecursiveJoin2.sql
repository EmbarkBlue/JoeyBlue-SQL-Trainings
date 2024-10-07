WITH emp
as
(
		select employee_number, employee_name, manager
		,1 as lvl
		,cast(',' + cast(employee_number as varchar) + ',' as varchar(250)) empConcat
		,employee_name as emp_lvl_1
		,cast(null as varchar(50)) as emp_lvl_2
		,cast(null as varchar(50)) as emp_lvl_3
		,cast(null as varchar(50)) as emp_lvl_4
		from employee 
		where manager is null
	union all
		select e.employee_number, e.employee_name, e.manager
		,lvl + 1 as lvl
		,cast(emp.empConcat + ',' + cast(e.employee_number as varchar) + ',' as varchar(250))
		,case when emp.lvl=1 then emp.employee_name else emp.emp_lvl_1 end as emp_lvl_1
		,case when emp.lvl=1 then e.employee_name else emp.emp_lvl_2 end as emp_lvl_2
		,case when emp.lvl=2 then e.employee_name else emp.emp_lvl_3 end as emp_lvl_3
		,case when emp.lvl=3 then e.employee_name else emp.emp_lvl_4 end as emp_lvl_4
		from emp inner join employee e on emp.employee_number = e.manager
)
select * from emp



