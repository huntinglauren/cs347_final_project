with data as(
select
       null as link_type,
       null as parent,
       'All Employees' as id,
       'All Employees' as name,
       null as sub_id
  from NL_EMP
union
select null as link_type,
       'All Employees' as parent,
       employee_division as id,
       employee_division as name,
       null as sub_id
  from NL_EMP
union
select null as link_type,
       employee_division as parent,
       employee_name as id,
       employee_name as name,
       null as sub_id
  from NL_EMP
)
select case when connect_by_isleaf = 1 then 0
            when level = 1             then 1
            else                           -1
       end as status, 
       level, 
       name as title, 
       null as icon, 
       id as value, 
       'View' as tooltip, 
       null as link 
from data
start with parent is null
connect by prior id = parent
order siblings by name
