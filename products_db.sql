DROP DATABASE IF EXISTS dbproducts;
CREATE DATABASE dbproducts;

USE dbproducts;


DROP USER IF EXISTS 'prodadmin'@'localhost';
CREATE USER IF NOT EXISTS 'prodadmin'@'localhost' IDENTIFIED BY '78910';
GRANT ALL PRIVILEGES ON dbproducts.* TO 'prodadmin'@'localhost' IDENTIFIED BY '78910';


CREATE TABLE products
(
	id INT(3) auto_increment NOT NULL, 
    barcode VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(50) NOT NULL,
    price FLOAT(7,2) DEFAULT 0 NOT NULL,
    tax FLOAT(7,2) DEFAULT 24 NOT NULL,
    description VARCHAR(200) NOT NULL,
	PRIMARY KEY (id)
);
    
    
INSERT INTO products(barcode, name, price, tax, description) 
VALUES("A343", "Kingston 32 GB", 34.75, 19.5, "NEW USB flash disk 32 GB");

INSERT INTO products(barcode, name, tax, description) 
VALUES("B435", "TurboX Mouse", 16.64, "Slightly used TurboX wireless mouse");

INSERT INTO products(barcode, name, price, description) 
VALUES("C870", "Philips PC Display Screen", 21, "Philips display screen from stock");

INSERT INTO products(barcode, name, description) 
VALUES("A398", "Sony 16 GB", "Used USB of 16 GB");

INSERT INTO products(barcode, name, price, description) 
VALUES("1111", "TurboX Keyboard", 19.99, "Slightly used TurboX wireless keyboard");


SELECT *
FROM products;