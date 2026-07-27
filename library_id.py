#!/usr/bin/env    python3
#Program Name:    library_id.py
#Program Purpose: Perform various functions as described in project milestone.
#Date Created:    05/07/2026
#Contributor(s):  Kaylee Froats


#define imports
import sys
import psycopg2


#define constants
answer = 42

#######################
#Function Definitions #
#######################

# Purpose:   Display menu options
# Parameter: none
# Return:    none
def show_menu():
    print("menu options:")
    print("(1): query book attributes")
    print("(2): query loans by member")
    print("(3): query overdue loans")
    print("(4): insert loan")
    print("(5): delete loan")
    print("(q): quit")
    print("(t): temporary to test get attribute value")

# Purpose:   Get menu option
# Parameter: prompt
# Return:    user-selected menu option
def get_menu_option():
    return input("please input a menu option:").lower()

# Purpose:   get a field value used in a query
# Parameter: prompt
# Return:    field value
def get_attribute_value():
    return input("please input a field value:").lower()

# Purpose:   skeleton function, to be completed later
# Parameter:
# Return:
def query_book_attributes():
    print("Book records")

# Purpose:   skeleton function, to be completed later
# Parameter:
# Return:
def query_loans_by_member():
    print("Member loan records")

# Purpose:   skeleton function, to be completed later
# Parameter:
# Return:
def query_overdue_loans():
    print("Overdue loans")

# Purpose:   skeleton function, to be completed later
# Parameter:
# Return:
def insert_loan():
    print("Insert record")

# Purpose:   skeleton function, to be completed later
# Parameter:
# Return:
def delete_loan():
    print("Delete record")


################
# Main Program #
################

#database connection
try:
    connection=psycopg2.connect(database='library_froa0019', user='library_froa0019')
except psycopg2.DatabaseError:
    print("Error: Connection to database not established.")
    sys.exit(1) #early exit if DB not available
print("Database connection established")
#cursor setup
cursor = connection.cursor()

#declares user input variable
menu_option = None
#the loop calls show menu unless user input is q
while menu_option != "q":
    show_menu()
    menu_option = get_menu_option()

    #If/elif statement block for each valid menu option
    if menu_option == "1":
        query_book_attributes()

    elif menu_option == "2":
        query_loans_by_member()

    elif menu_option == "3":
        query_overdue_loans()

    elif menu_option == "4":
        insert_loan()

    elif menu_option == "5":
        delete_loan()

    elif menu_option == "q":
        print("Quitting program...")

    elif menu_option == "t":
        print(get_attribute_value())

    else:
        print("Invalid option, try again")


#Close cursor and database connection
cursor.close()
connection.close()
