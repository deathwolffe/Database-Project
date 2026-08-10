#!/usr/bin/env    python3
#Program Name:    library_id.py
#Program Purpose: Perform various functions as described in project milestone.
#Date Created:    05/07/2026
#Contributor(s):  Kaylee Froats


#define imports
import sys
import psycopg2
from datetime import date

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

# Purpose:   Query all books with all attributes, including author and publisher, sorted by title
# Parameter: cursor
# Return: none
def query_book_attributes():
    print("Book records:")
    cursor.execute("SELECT * FROM book")
    display_query()

# Purpose:   Query all current loans made by a given member and sorted by date
# Parameter: cursor, member ID
# Return: none
def query_loans_by_member():
    print("Member loan records:")
    member = query_member_id()
    cursor.execute(f"SELECT * FROM loan WHERE member_id = {member} ORDER BY loan_date")
    display_query()

# Purpose:   Query all loans that are overdue
# Parameter: cursor
# Return: none
def query_overdue_loans():
    print("Overdue loans:")
    cursor.execute("""
SELECT * FROM loan
JOIN book_copy ON loan.copy_id = book_copy.copy_id
JOIN book ON book_copy.isbn = book.isbn
WHERE (loan_date + rental_days) < CURRENT_DATE
AND return_date IS NULL
""")
    display_query()

# Purpose:   Query member id based on member phone number
# Parameter: cursor, member phone number
# Return: member ID
def query_member_id():
    phone = input("please input a member's phone number:")
    cursor.execute(f"SELECT member_id FROM member WHERE phone = '{phone}'")
    query = cursor.fetchone()
    return query[0][0]

# Purpose:   Display query result
# Parameter: cursor
# Return: none
def display_query():
    query = cursor.fetchall()
    for row in query:
        print(row)

# Purpose:   Insert a loan
# Parameter: cursor, member ID, book copy ID
# Return: none
def insert_loan():
    member = query_member_id()
    copy = input("Please input a copy to be loaned:")
    date = date.today()
    cursor.execute(f"""INSERT INTO loan (copy_id, member_id, loan_date) VALUES
({copy}, {member}, '{date}')""")

# Purpose:   Delete a loan
# Parameter: cursor, loan ID
# Return: none
def delete_loan():
    loan = input("Please input a loan to be deleted:")
    cursor.execute("DELETE FROM loan WHERE loan_id = '{loan}'")


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
