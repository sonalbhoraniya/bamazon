DROP DATABASE IF EXISTS bamazon_db;

CREATE DATABASE bamazon_db;

USE bamazon_db;

CREATE TABLE products (
	item_id INT NOT NULL AUTO_INCREMENT,
	product_name VARCHAR(75) NULL,
	department_name VARCHAR(75) NULL,
	price INT(6) DEFAULT 0,
	stock_quantity INT (6) NOT NULL,
  
  PRIMARY KEY (item_id)
);

select * from products;


INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Skechers GOrun Razor 3 Hyper", "Shoes", 134.95, 5000);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Nike ZoomX Vaporfly Next%", "Shoes", 250.00, 5000);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Hoka One One Rincon", "Shoes", 114.95, 6000);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Muji Gel Ink Ballpoint Pen", "Office Supplies", 1.50, 15000);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Muji Gel Ink Ballpoint Pen Set 6 Color", "Office Supplies", 7.99, 5000);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Recycled Paper Binder A4 2 Rings Pipe Type Dark Gray", "Office Supplies", 9.00, 4000);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Just Mercy", "Books", 25.00, 2000);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Pride and Prejudice", "Books", 25.00, 1500);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Lulu Lemon Cross Chill Jackey", "Clothing", 139.00, 2500);
INSERT INTO products (product_name, department_name, price, stock_quantity) values ("Lulu Lemon Fleece Flurry Jacket", "Clothing", 119.00, 2500);

SELECT * FROM products;