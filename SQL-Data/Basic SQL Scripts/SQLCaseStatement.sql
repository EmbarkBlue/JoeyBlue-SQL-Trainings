--SQL CASE Statement

--CASE --Column to Check
--	WHEN /*Condition*/ THEN --What to do if the condition is met
--	ELSE --What to do if we don't capture the record in the When
--END

select
case 
	when S_DEGREE_LEVEL='U' then 'Undergraduate'
	when S_DEGREE_LEVEL='G' then 'Graduate'
	when S_DEGREE_LEVEL like 'D%' then 'Doctorate'
	else 'Undefined'
end DegreeDescription
,* 
from [dbo].[STUDENT]





select 
case 
	when g.G_GPA = 4 then 'Excellent'
	when g.G_GPA between 3.5 and 3.99 then 'Great'
	when g.G_GPA >= 3 then 'OK'
	else 'Needs Work'
end as GPA_Status
,* 
from [dbo].[STUDENT] s 
left join [dbo].[GPA] g 
	on s.S_ID=g.S_ID




