This is a shuttle to take inactive employees and convert them to active
We create a static content region named Set Inactive/Active
Then we created and a shuttle item attached to that region named P2_EMP_SHUTTLE
that populates the shuttle with this sql cal;:

select EMPLOYEE_NAME as display_value, EMPLOYEE_ID as return_value 
from NL_EMP
order by 1

then converts them based on the "shuttled" employees
