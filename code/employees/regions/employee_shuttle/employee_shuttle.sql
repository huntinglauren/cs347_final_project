select EMPLOYEE_NAME as display_value, EMPLOYEE_ID as return_value 
from NL_EMP
order by 1

-- PL/SQL Script running under processes
declare
	tab apex_application_global.vc_arr2;
begin
	tab := apex_util.string_to_table (:p2_emp_shuttle);
	
	update nl_emp
	set employee_status = 'I';

	FOR i IN 1 .. tab.count LOOP
		update nl_emp
		set employee_status = 'A'
		where employee_id = tab(i);
	END LOOP;
END;
