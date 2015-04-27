with data as(
select
       null as link_type,
       null as parent,
       'All Lists' as id,
       'All Lists' as name,
       null as sub_id
  from NL_NOTE_LIST
union
select 
       null as link_type,
       'All Lists' as parent,
       OWNERSHIP_DIV_CODE as id,
       OWNERSHIP_DIV_CODE as name,
       null as sub_id
  from NL_NOTE_LIST
union
select null as link_type,
       ownership_div_code as parent,
       to_char(list_seq_id) as id,
       list_name as name,
       list_seq_id as sub_id
  from NL_NOTE_LIST
union
select null as link_type,
       to_char(nl_note_list_list_seq_id) as parent,
       null as id,
       (SELECT e.employee_name
	from nl_emp e join nl_member_list m
	on e.employee_id = m.nl_emp_employee_id 
        join nl_note_list l 
	on m.nl_note_list_list_seq_id = l.list_seq_id
	) as name,
      	nl_emp_employee_id as sub_id
  from NL_MEMBER_LIST m
  where m.nl_emp_employee_id != -1
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
