select LIST_NAME as display_value, LIST_SEQ_ID as return_value 
  from NL_NOTE_LIST
WHERE :LOGIN = OWNERSHIP_DIV_CODE and LIST_STATUS = 'A'
 order by 1
