SELECT type, id, search_title, details
FROM (
    SELECT 
    'Employee' type,
    e.employee_id id,
    e.employee_name search_title,
    'Division: ' || e.employee_division details
    FROM NL_EMP e
    WHERE instr(upper(e.employee_id),upper(:P19_SEARCH)) > 0
        or instr(upper(e.employee_name),upper(:P19_SEARCH)) > 0
        or instr(upper(e.employee_lab),upper(:P19_SEARCH)) > 0
        or instr(upper(e.employee_division),upper(:P19_SEARCH)) > 0
        or instr(upper(e.employee_status),upper(:P19_SEARCH)) > 0
        or instr(upper(e.status_eff_date),upper(:P19_SEARCH)) > 0 
        or :P19_SEARCH is null
    UNION ALL
    SELECT 
    'Notice List' type,
    list.list_seq_id id,
    list.list_name search_title,
    'Division: '|| list.ownership_div_code details
    FROM NL_NOTE_LIST list
    WHERE instr(upper(list.list_seq_id),upper(:P19_SEARCH)) > 0
        or instr(upper(list.list_status),upper(:P19_SEARCH)) > 0
        or instr(upper(list.list_name),upper(:P19_SEARCH)) > 0
        or instr(upper(list.list_description),upper(:P19_SEARCH)) > 0
        or instr(upper(list.ownership_div_code),upper(:P19_SEARCH)) > 0
        or instr(upper(list.external_view_name),upper(:P19_SEARCH)) > 0
        or instr(upper(list.status_eff_date),upper(:P19_SEARCH)) > 0
        or :P19_SEARCH is null
    UNION ALL
    SELECT 
    'User' type, 
    u.user_id id,
    u.type search_title,
    'Division: ' || u.ownership_div_code details
    FROM NL_USER u
    WHERE instr(upper(u.user_id),upper(:P19_SEARCH)) > 0
        or instr(upper(u.type),upper(:P19_SEARCH)) > 0
        or instr(upper(u.ownership_div_code),upper(:P19_SEARCH)) > 0
        or :P19_SEARCH is null
)
