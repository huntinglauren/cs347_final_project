with data as(
select
       null as link_type,
       null as parent,
       'All Lists' as id,
       'All Lists' as name,
       null as sub_id
  from NL_NOTE_LIST
union
select null as link_type,
       'All Lists' as parent,
       ownership_div_code as id,
       ownership_div_code as name,
       null as sub_id
  from NL_NOTE_LIST
union
select null as link_type,
       ownership_div_code as parent,
       list_name as id,
       list_name as name,
       null as sub_id
  from NL_NOTE_LIST
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
