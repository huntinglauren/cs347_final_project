-- For the employee display region
select * from nl_emp
where :P2_GROUP_LIST = employee_id

-- For the lists the employee is on
select * from nl_note_list join 
	(select nl_note_list_list_seq_id from nl_member_list
	where :P2_GROUP_LIST = nl_emp_employee_id)
on (nl_note_list_list_seq_id = list_seq_id)

-- For the group select list
select employee_name names, employee_id as return_value, employee_division div
from nl_emp
order by div, names
