#!/bin/bash
#Program Name: insert_recordss.sh
#Program Purpose: insert record scripts for library_froa0019
#Date Created: 26/07/26
#Version: 1.0.0
#Author(s): Kaylee Froats

mkdir -p /home/dbadmin/library_froa0019/sql_insert.d/
touch /home/dbadmin/library_froa0019/sql_insert.d/insert_publisher.sql
touch /home/dbadmin/library_froa0019/sql_insert.d/insert_book.sql
touch /home/dbadmin/library_froa0019/sql_insert.d/insert_book_copy.sql
touch /home/dbadmin/library_froa0019/sql_insert.d/insert_author.sql
touch /home/dbadmin/library_froa0019/sql_insert.d/insert_book_author.sql
touch /home/dbadmin/library_froa0019/sql_insert.d/insert_member.sql
touch /home/dbadmin/library_froa0019/sql_insert.d/insert_loan.sql

cat > /home/dbadmin/library_froa0019/sql_insert.d/insert_publisher.sql <<EOF
INSERT INTO publisher (publisher, contact) VALUES
('Viz Media', vizmedia@gmail.com),
('IDW Publishing', idwpub@gmail.com),
('Skybound Entertainment', skybound@gmail.com),
('Green Spark Productions', greenspark@gmail.com),
('Cold Forge Inc.', coldforge@gmail.com),
('Terran Corp.', terran@gmail.com),
('Variance Inc.', variance@gmail.com),
('Tarn Hauser Entertainment', tarnhauser@gmail.com),
('Lamp Light Studio', lamplight@gmail.com),
('Overlord Inc.', overlord@gmail.com),
('Cybertron Productions', cybertron@gmail.com),
('Dragon LTD.', dragon@gmail.com);
EOF

cat > /home/dbadmin/library_froa0019/sql_insert.d/insert_book.sql <<EOF
INSERT INTO book (isbn, publisher_id, title, rental_days) VALUES
('isbn1', 10, 'When Wolf meets Sheep', 14),
('isbn2', 9, 'Can you Hear me now?', 14),
('isbn3', 12, 'WayFinder's Guide to Eberon', 14),
('isbn4', 3, 'Transformers Skybound Collection 1', 14),
('isbn5', 3, 'Transformers Skybound Collection 2', 14),
('isbn6', 3, 'Transformers Skybound Collection 3', 14),
('isbn7', 1, 'RWBY Volume 1', 7),
('isbn8', 1, 'RWBY Volume 2', 7),
('isbn9', 1, 'RWBY Volume 3', 7),
('isbn10', 1, 'RWBY Volume 4', 7),
('isbn11', 1, 'RWBY Volume 5', 7),
('isbn12', 1, 'RWBY Volume 6', 7);
EOF

cat > /home/dbadmin/library_froa0019/sql_insert.d/insert_book_copy.sql <<EOF
INSERT INTO book_copy (isbn, acquisition_date) VALUES
('isbn1', 2020-12-24),
('isbn2', 2020-12-24),
('isbn3', 2020-12-24),
('isbn4', 2020-12-24),
('isbn5', 2021-02-12),
('isbn6', 2021-02-12),
('isbn7', 2021-02-12),
('isbn8', 2022-04-07),
('isbn9', 2022-04-07),
('isbn10', 2022-04-07),
('isbn11', 2022-04-07),
('isbn12', 2022-04-07);
EOF

cat > /home/dbadmin/library_froa0019/sql_insert.d/insert_author.sql <<EOF
INSERT INTO author (first_name, last_name, birth_country) VALUES
('John', 'Dee', 'Australia'),
('Orion', 'Pax', 'Croatia'),
('Guss', 'Forge', 'England'),
('Chris', 'Kringle', 'Iceland'),
('Nancy', 'Crystal', 'America'),
('Carly', 'Carter', 'Canada'),
('Matilda', 'Cortella', 'Brazil'),
('John', 'Parker', 'Canada'),
('Mike', 'Prowl', 'Croatia'),
('Smith', 'Kent', 'America'),
('Jayden', 'Grafe', 'Canada'),
('Daniel', 'Warren', 'Canada');
EOF

cat > /home/dbadmin/library_froa0019/sql_insert.d/insert_book_author.sql <<EOF
INSERT INTO book_author (author_id, isbn) VALUES
(6, 'isbn1'),
(11, 'isbn2'),
(1, 'isbn3'),
(2, 'isbn4'),
(2, 'isbn5'),
(2, 'isbn6'),
(7, 'isbn7'),
(7, 'isbn8'),
(7, 'isbn9'),
(7, 'isbn10'),
(7, 'isbn11'),
(7, 'isbn12');
EOF

cat > /home/dbadmin/library_froa0019/sql_insert.d/insert_member.sql <<EOF
INSERT INTO member (first_name, last_name, phone) VALUES
('Mary', 'Gilmour', 1234684245),
('Hailey', 'Mare', 1286655443),
('Joel', 'Grawn', 2334275243),
('Ella', 'Farn', 4478678344),
('Victoria', 'Hekate', 2124634523),
('Arial', 'Cortella', 3432552145),
('Carly', 'Carter', 5661468414),
('Harker', 'Cortella', 5644846616),
('Maria', 'Ellenna', 6148878954),
('John', 'Adams', 4895678125),
('Hamund', 'Cross', 1525487659),
('Jacob', 'Jacobs', 1315498766);
EOF

cat > /home/dbadmin/library_froa0019/sql_insert.d/insert_loan.sql <<EOF
INSERT INTO loan (copy_id, member_id, loan_date, return_date) VALUES
(1, 6, 2023-12-01, 2023-12-15),
(1, 6, 2023-12-15, 2023-12-29),
(1, 6, 2023-12-29, 2024-01-12),
(1, 6, 2024-01-12, 2024-01-26),
(2, 9, 2023-02-04, 2023-02-07),
(5, 11, 2023-05-21, NULL),
(6, 9, 2026-02-18, 2026-02-18),
(7, 6, 2023-11-5, 2023-11-15),
(12, 3, 2023-06-01, 2023-06-07),
(8, 1, 2025-04-23, NULL),
(9, 2, 2025-02-12, 2026-01-01),
(10, 10, 2024-02-14, 2024-02-24);
EOF

