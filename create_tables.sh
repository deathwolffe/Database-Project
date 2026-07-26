#!/bin/bash
#Program Name: create_tables.sh
#Program Purpose: create table scripts for library_froa0019
#Date Created: 26/07/26
#Version: 1.0.0
#Author(s): Kaylee Froats

mkdir -p /home/dbadmin/library_froa0019/sql_create_table.d/
touch /home/dbadmin/library_froa0019/sql_create_table.d/create_publisher.sql
touch /home/dbadmin/library_froa0019/sql_create_table.d/create_book.sql
touch /home/dbadmin/library_froa0019/sql_create_table.d/create_book_copy.sql
touch /home/dbadmin/library_froa0019/sql_create_table.d/create_author.sql
touch /home/dbadmin/library_froa0019/sql_create_table.d/create_book_author.sql
touch /home/dbadmin/library_froa0019/sql_create_table.d/create_member.sql
touch /home/dbadmin/library_froa0019/sql_create_table.d/create_loan.sql

cat > /home/dbadmin/library_froa0019/sql_create_table.d/create_publisher.sql <<EOF
CREATE TABLE publisher (
publisher_id serial PRIMARY KEY,
publisher varchar(300) NOT NULL,
contact varchar(200) NOT NULL
);
EOF

cat > /home/dbadmin/library_froa0019/sql_create_table.d/create_book.sql <<EOF
CREATE TABLE book (
isbn char(13) PRIMARY KEY,
publisher_id serial REFERENCES pusblisher(publisher_id),
title varchar(255) NOT NULL,
rental_days int NOT NULL
);
EOF

cat > /home/dbadmin/library_froa0019/sql_create_table.d/create_book_copy.sql <<EOF
CREATE TABLE book_copy (
copy_id serial PRIMARY KEY,
isbn char(13) REFERENCES book(isbn),
acquisition_date date NOT NULL
);
EOF

cat > /home/dbadmin/library_froa0019/sql_create_table.d/create_author.sql <<EOF
CREATE TABLE author (
author_id serial PRIMARY KEY,
first_name varchar(100) NOT NULL,
last_name varchar(200) NOT NULL,
birth_country varchar(200)
);
EOF

cat > /home/dbadmin/library_froa0019/sql_create_table.d/create_book_author.sql <<EOF
CREATE TABLE book_author (
author_id serial REFERENCES author(author_id),
isbn char(13) REFERENCES book(isbn),
PRIMARY KEY (author_id, isbn)
);
EOF

cat > /home/dbadmin/library_froa0019/sql_create_table.d/create_member.sql <<EOF
CREATE TABLE member (
member_id serial PRIMARY KEY,
first_name varchar(100) NOT NULL,
last_name varchar(200) NOT NULL,
phone varchar(20)
);
EOF

cat > /home/dbadmin/library_froa0019/sql_create_table.d/create_loan.sql <<EOF
CREATE TABLE loan (
loan_id serial PRIMARY KEY,
copy_id serial REFERENCES book_copy(copy_id),
member_id serial REFERENCES member(member_id),
loan_date date NOT NULL,
return_date date
);
EOF

