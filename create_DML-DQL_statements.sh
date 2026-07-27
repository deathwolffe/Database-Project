#!/bin/bash
#Program Name: create_DML-DQL_statements.sh
#Program Purpose: setup SQL DML and DQL statements
#Date Created: 26/07/26
#Version: 1.0.1
#Author(s): Kaylee Froats

mkdir -p /home/dbadmin/library_froa0019/sql_crud.d/
touch /home/dbadmin/library_froa0019/sql_crud.d/query_books.sql
touch /home/dbadmin/library_froa0019/sql_crud.d/query_loans_by_member.sql
touch /home/dbadmin/library_froa0019/sql_crud.d/query_overdue_loans.sql
touch /home/dbadmin/library_froa0019/sql_crud.d/insert_record.sql
touch /home/dbadmin/library_froa0019/sql_crud.d/delete_record.sql


cat > /home/dbadmin/library_froa0019/sql_crud.d/query_books.sql <<EOF
SELECT * FROM book;
EOF

cat > /home/dbadmin/library_froa0019/sql_crud.d/query_loans_by_member.sql <<EOF
SELECT * FROM loan
JOIN member ON loan.member_id = member.member_id
ORDER BY member.member_id
;
EOF

cat > /home/dbadmin/library_froa0019/sql_crud.d/query_overdue_loans.sql <<EOF
SELECT * FROM loan
JOIN book_copy ON loan.copy_id = book_copy.copy_id
JOIN book ON book_copy.isbn = book.isbn
WHERE (loan_date + rental_days) < CURRENT_DATE
AND return_date IS NULL
;
EOF

cat > /home/dbadmin/library_froa0019/sql_crud.d/insert_record.sql <<EOF
INSERT INTO book VALUES
('isbn13', 10, 'Adventurers Mishapped Survival', 14)
;
EOF

cat > /home/dbadmin/library_froa0019/sql_crud.d/delete_record.sql <<EOF
DELETE FROM book
WHERE isbn = 'isbn13'
;
EOF

