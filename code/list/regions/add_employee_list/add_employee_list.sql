--sql for populating drop downs
select 
"MEMBER_LIST_ID",
"NL_NOTE_LIST_LIST_SEQ_ID",
"NL_EMP_EMPLOYEE_ID",
"NL_NOTE_ID"
from "#OWNER#"."NL_MEMBER_LIST"
WHERE #OWNER#."NL_MEMBER_LIST"."NL_NOTE_LIST_LIST_SEQ_ID" = :LIST

