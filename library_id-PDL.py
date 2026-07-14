#Program Name:    library_id.py
#Program Purpose: Perform various functions as described in project milestone.
#Date Created:    05/07/2026
#Contributor(s):  Kaylee Froats


#define imports
import sys
import csv
import json


#define constants


#######################
#Function Definitions #
#######################

# Purpose:   Display menu options
# Parameter: none
# Return:    none
function show menu:
    display menu options

# Purpose:   Get menu option
# Parameter: prompt
# Return:    user-selected menu option
function get menu option:
    prompt user for menu option

# Purpose:   get a field value used in a query
# Parameter: prompt
# Return:    field value
function get attribute value:
    prompt user for value

# Purpose:   skeleton function, to be completed later
# Parameter:
# Return:
function query book attributes:
    display "Book records"

# Purpose:   skeleton function, to be completed later
# Parameter:
# Return:
function query loans by member:
    display "Member loan records"

# Purpose:   skeleton function, to be completed later
# Parameter:
# Return:
function query overdue loans:
    display "Overdue loans"

# Purpose:   skeleton function, to be completed later
# Parameter:
# Return:
function insert loan:
    display "Insert record"

# Purpose:   skeleton function, to be completed later
# Parameter:
# Return:
function delete loan:
    display "Delete record"


################
# Main Program #
################
declare user input variable
loop call show menu unless user input is q
call get menu option and get return as user input
