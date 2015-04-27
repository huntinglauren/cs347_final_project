User Selection selects which user is using the application
We created a region called User Selection with a select list item attacted to it with this sql call to populate the list: 
	
   select TYPE as display_value, OWNERSHIP_DIV_CODE as return_value 
   from NL_USER
    order by 1

Once a user is selected then the value of that item is saved for the rest of the application to use to filter information. 
