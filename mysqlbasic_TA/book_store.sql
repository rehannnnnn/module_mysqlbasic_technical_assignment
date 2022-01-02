-- SHOW database untuk melihat list database yang ada pada mysql
	SHOW DATABASES;
-- CREATE database bernama bookstore
	CREATE DATABASE bookstore;
-- USE database bookstore
	USE bookstore;
-- SHOW seluruh table yang ada pada database bookstore
	show tables
-- Buatlah table bernama books dengan attribute/column yang berisi
-- 	id
-- 		Tipe data: Integer
-- 		Auto Increment
-- 		Primary Key
-- 	author1
-- 		Tipe data: String
-- 		Not Null
-- 		Max length of string: 100
-- 	author2
-- 		Tipe data: String
-- 		Max length of string: 100
-- 	author3
-- 		Tipe data: String
-- 		Max length of string: 100
-- 	title
-- 		Tipe data: String
-- 		Max length of string: 100
-- 	description
-- 		Tipe data: String
-- 	place_sell
-- 		Tipe data String
-- 		Fixed length of string: 3
-- 	stock
-- 		Tipe data: Integer
-- 		Default value: 0
-- 	creation_date
-- 		Tipe data: Datetime
-- 		Timestamp
-- 		Default Value: CURRENT_TIMESTAMP
-- 		On Update Value: CURRENT_TIMESTAMP


CREATE TABLE books
     (id INT AUTO_INCREMENT PRIMARY KEY,
     author1 VARCHAR(100) NOT NULL,
     author2 VARCHAR(100),
     author3 VARCHAR(100),
     title VARCHAR(100),
     description VARCHAR(100),
     place_sell VARCHAR(3),
     stock INT DEFAULT 0,
     creation_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
     );


-- Pada suatu waktu, kamu harus mengupdate column dari table books yang sudah ada. Berikut update yang harus dilakukan:
-- ADD column
-- price
-- Tipe data: Integer
-- Default value: 0
	
	ALTER TABLE books
    	ADD price int default 0;

-- status
-- Tipe data: Enum
-- Enum value: 'available', 'out of stock', 'limited'
-- 	ALTER TABLE books
    	ADD status enum ('available', 'out of stock', 'limited');
	

-- DROP column
-- place_sell

	ALTER TABLE books
    	DROP COLUMN place_sell;

-- INSERT 3 data untuk semua column yang ada pada table books

	insert into books (author1, author2, author3, title, description, stock, creation_date, price, status) values ("muhammad", "nur", "wahyu", "bumi langit", "buku ini ditujukan untuk anak anak", 100, NOW(), 100000, 'limited'),
	("indra", "azizah", "ani", "bulan bintang", "ayo baca buku buku jembatan ilmu", 80, NOW(), 95000, 'out of stock'),
	("amelia", "aisyah", "rio", "hujan di bulan desember", "semua orang bisa membaca buku ini", 250, NOW(), 68000, 'limited');

-- SELECT semua row pada table books

	SELECT * FROM books

-- SELECT menggunakan ALIAS. Column id digantikan ID, author1 digantikan A1, author2 digantikan A2, author3 digantikan A3.
	
    select id as ID, author1 as A1, author2 as A2, author3 as A3 from books;

-- SELECT data menggunakan WHERE untuk id tertentu
	
    SELECT * FROM books WHERE id = 2;

-- SELECT data menggunakan WHERE untuk dengan operator logical AND
	
    SELECT * FROM books WHERE stock = 80 AND price = 95000;

-- SELECT data menggunakan WHERE untuk dengan operator logical OR
	
    SELECT * FROM books WHERE stock = 80 OR price = 100000;

-- SELECT data menggunakan WHERE untuk dengan operator logical NOT

	SELECT * FROM books WHERE NOT status = 'limited';

-- SELECT seluruh column dari table bookstore dan diurutkan secara ASC berdasarkan id

	SELECT * FROM books order by id ASC;

-- SELECT seluruh column dan berikan LIMIT untuk 2 row saja

	SELECT * FROM books LIMIT 2;

-- Pilih 1 row untuk dilakukan UPDATE pada column author1 dan price.

	UPDATE books SET author1 = 'ardani', price = '55000' WHERE id = 1;

-- Pilih 1 row untuk dilakukan DELETE

	DELETE FROM books WHERE author3 = 'rio';