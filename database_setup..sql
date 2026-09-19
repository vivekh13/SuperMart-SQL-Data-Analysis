-- =========================================================
-- SQL TRAINING DATABASE : E-Commerce (SuperMart)
-- Compatible with MySQL / PostgreSQL / SQLite (minor tweaks may be needed for AUTOINCREMENT/SERIAL)
-- =========================================================

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id   INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city          VARCHAR(50),
    state         VARCHAR(50),
    signup_date   DATE
);

CREATE TABLE employees (
    employee_id   INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department    VARCHAR(50),
    hire_date     DATE,
    manager_id    INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

CREATE TABLE products (
    product_id    INT PRIMARY KEY,
    product_name  VARCHAR(100) NOT NULL,
    category      VARCHAR(50),
    price         DECIMAL(10,2),
    stock_qty     INT
);

CREATE TABLE orders (
    order_id      INT PRIMARY KEY,
    customer_id   INT,
    employee_id   INT,
    order_date    DATE,
    status        VARCHAR(20),
    region        VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id      INT,
    product_id    INT,
    quantity      INT,
    unit_price    DECIMAL(10,2),
    discount_pct  INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- CUSTOMERS
INSERT INTO customers VALUES (1, 'Divya Iyer', 'Kolkata', 'West Bengal', '2023-02-19');
INSERT INTO customers VALUES (2, 'Priya Bhatt', 'Ahmedabad', 'Gujarat', '2023-04-07');
INSERT INTO customers VALUES (3, 'Arjun Kapoor', 'Mumbai', 'Maharashtra', '2024-06-03');
INSERT INTO customers VALUES (4, 'Ananya Sharma', 'Pune', 'Maharashtra', '2024-03-20');
INSERT INTO customers VALUES (5, 'Vikram Verma', 'Bengaluru', 'Karnataka', '2023-04-03');
INSERT INTO customers VALUES (6, 'Suresh Gupta', 'Mumbai', 'Maharashtra', '2024-08-02');
INSERT INTO customers VALUES (7, 'Rohan Patel', 'Lucknow', 'Uttar Pradesh', '2023-03-05');
INSERT INTO customers VALUES (8, 'Kavya Kapoor', 'Kolkata', 'West Bengal', '2023-02-20');
INSERT INTO customers VALUES (9, 'Ishaan Sharma', 'Ahmedabad', 'Gujarat', '2023-05-17');
INSERT INTO customers VALUES (10, 'Rahul Gupta', 'Delhi', 'Delhi', '2024-07-07');
INSERT INTO customers VALUES (11, 'Rohan Kapoor', 'Chennai', 'Tamil Nadu', '2024-07-27');
INSERT INTO customers VALUES (12, 'Nikhil Iyer', 'Pune', 'Maharashtra', '2024-08-18');
INSERT INTO customers VALUES (13, 'Kavya Singh', 'Bengaluru', 'Karnataka', '2024-01-17');
INSERT INTO customers VALUES (14, 'Rohan Joshi', 'Pune', 'Maharashtra', '2024-07-31');
INSERT INTO customers VALUES (15, 'Vivek Kapoor', 'Bengaluru', 'Karnataka', '2024-05-23');
INSERT INTO customers VALUES (16, 'Nikhil Joshi', 'Kolkata', 'West Bengal', '2023-11-18');
INSERT INTO customers VALUES (17, 'Pooja Kapoor', 'Jaipur', 'Rajasthan', '2024-01-06');
INSERT INTO customers VALUES (18, 'Rahul Patel', 'Delhi', 'Delhi', '2023-09-07');
INSERT INTO customers VALUES (19, 'Priya Kapoor', 'Chennai', 'Tamil Nadu', '2024-06-21');
INSERT INTO customers VALUES (20, 'Amit Rao', 'Hyderabad', 'Telangana', '2024-04-04');
INSERT INTO customers VALUES (21, 'Rahul Kapoor', 'Pune', 'Maharashtra', '2023-05-01');
INSERT INTO customers VALUES (22, 'Riya Gupta', 'Delhi', 'Delhi', '2023-12-17');
INSERT INTO customers VALUES (23, 'Sneha Rao', 'Jaipur', 'Rajasthan', '2024-03-07');
INSERT INTO customers VALUES (24, 'Vivek Singh', 'Pune', 'Maharashtra', '2024-07-25');
INSERT INTO customers VALUES (25, 'Kavya Chopra', 'Hyderabad', 'Telangana', '2023-12-15');

-- EMPLOYEES
INSERT INTO employees VALUES (1, 'Rajesh Khanna', 'Sales', '2022-12-13', NULL);
INSERT INTO employees VALUES (2, 'Anita Desai', 'Support', '2021-12-25', NULL);
INSERT INTO employees VALUES (3, 'Suresh Menon', 'Marketing', '2022-09-01', 2);
INSERT INTO employees VALUES (4, 'Farah Khan', 'Sales', '2022-08-17', 2);
INSERT INTO employees VALUES (5, 'Deepak Chawla', 'Sales', '2021-03-12', 1);
INSERT INTO employees VALUES (6, 'Kiran Rao', 'Support', '2021-10-04', 2);
INSERT INTO employees VALUES (7, 'Alok Nath', 'Sales', '2022-12-15', 1);
INSERT INTO employees VALUES (8, 'Meenal Joshi', 'Support', '2021-03-04', 2);

-- PRODUCTS
INSERT INTO products VALUES (1, 'Wireless Mouse', 'Electronics', 699, 238);
INSERT INTO products VALUES (2, 'Bluetooth Speaker', 'Electronics', 1999, 155);
INSERT INTO products VALUES (3, 'USB-C Cable', 'Electronics', 299, 207);
INSERT INTO products VALUES (4, 'Laptop Stand', 'Electronics', 1299, 187);
INSERT INTO products VALUES (5, 'Webcam HD', 'Electronics', 1799, 21);
INSERT INTO products VALUES (6, 'Power Bank 10000mAh', 'Electronics', 1499, 246);
INSERT INTO products VALUES (7, 'Office Chair', 'Furniture', 6499, 191);
INSERT INTO products VALUES (8, 'Study Table', 'Furniture', 4999, 96);
INSERT INTO products VALUES (9, 'Bookshelf', 'Furniture', 3299, 69);
INSERT INTO products VALUES (10, 'Filing Cabinet', 'Furniture', 5499, 262);
INSERT INTO products VALUES (11, 'Bean Bag', 'Furniture', 1899, 40);
INSERT INTO products VALUES (12, 'Notebook Pack', 'Stationery', 199, 121);
INSERT INTO products VALUES (13, 'Gel Pen Set', 'Stationery', 149, 157);
INSERT INTO products VALUES (14, 'Sticky Notes', 'Stationery', 99, 76);
INSERT INTO products VALUES (15, 'Whiteboard Marker', 'Stationery', 129, 136);
INSERT INTO products VALUES (16, 'Desk Organizer', 'Stationery', 349, 213);
INSERT INTO products VALUES (17, 'Cotton T-Shirt', 'Clothing', 499, 210);
INSERT INTO products VALUES (18, 'Formal Shirt', 'Clothing', 1299, 264);
INSERT INTO products VALUES (19, 'Denim Jeans', 'Clothing', 1799, 51);
INSERT INTO products VALUES (20, 'Hoodie', 'Clothing', 1599, 95);
INSERT INTO products VALUES (21, 'Socks Pack', 'Clothing', 249, 239);
INSERT INTO products VALUES (22, 'Basmati Rice 5kg', 'Grocery', 649, 215);
INSERT INTO products VALUES (23, 'Sunflower Oil 1L', 'Grocery', 189, 291);
INSERT INTO products VALUES (24, 'Tea Powder 250g', 'Grocery', 249, 152);
INSERT INTO products VALUES (25, 'Atta 10kg', 'Grocery', 549, 80);
INSERT INTO products VALUES (26, 'Sugar 1kg', 'Grocery', 55, 230);

-- ORDERS
INSERT INTO orders VALUES (1, 18, 5, '2024-12-27', 'Shipped', 'East');
INSERT INTO orders VALUES (2, 9, 5, '2024-01-03', 'Delivered', 'West');
INSERT INTO orders VALUES (3, 24, 1, '2024-08-21', 'Returned', 'Central');
INSERT INTO orders VALUES (4, 11, 1, '2024-02-22', 'Delivered', 'Central');
INSERT INTO orders VALUES (5, 7, 7, '2024-03-17', 'Returned', 'East');
INSERT INTO orders VALUES (6, 10, 2, '2024-03-14', 'Delivered', 'East');
INSERT INTO orders VALUES (7, 23, 1, '2024-09-27', 'Delivered', 'North');
INSERT INTO orders VALUES (8, 21, 4, '2024-11-09', 'Delivered', 'South');
INSERT INTO orders VALUES (9, 9, 4, '2024-12-20', 'Cancelled', 'East');
INSERT INTO orders VALUES (10, 20, 1, '2024-09-02', 'Returned', 'East');
INSERT INTO orders VALUES (11, 23, 4, '2024-09-01', 'Delivered', 'West');
INSERT INTO orders VALUES (12, 6, 3, '2024-03-06', 'Delivered', 'South');
INSERT INTO orders VALUES (13, 1, 1, '2024-11-28', 'Delivered', 'Central');
INSERT INTO orders VALUES (14, 10, 4, '2024-10-27', 'Delivered', 'East');
INSERT INTO orders VALUES (15, 5, 1, '2024-08-13', 'Delivered', 'Central');
INSERT INTO orders VALUES (16, 5, 8, '2024-11-12', 'Returned', 'North');
INSERT INTO orders VALUES (17, 17, 8, '2024-02-24', 'Cancelled', 'North');
INSERT INTO orders VALUES (18, 18, 1, '2024-02-02', 'Shipped', 'East');
INSERT INTO orders VALUES (19, 17, 4, '2024-12-23', 'Cancelled', 'East');
INSERT INTO orders VALUES (20, 11, 2, '2024-12-09', 'Delivered', 'West');
INSERT INTO orders VALUES (21, 4, 3, '2024-11-25', 'Returned', 'East');
INSERT INTO orders VALUES (22, 13, 8, '2024-03-24', 'Returned', 'South');
INSERT INTO orders VALUES (23, 7, 6, '2024-06-12', 'Delivered', 'East');
INSERT INTO orders VALUES (24, 15, 1, '2024-07-15', 'Delivered', 'Central');
INSERT INTO orders VALUES (25, 25, 3, '2024-05-18', 'Delivered', 'West');
INSERT INTO orders VALUES (26, 9, 1, '2024-12-18', 'Delivered', 'West');
INSERT INTO orders VALUES (27, 3, 5, '2024-02-12', 'Cancelled', 'South');
INSERT INTO orders VALUES (28, 1, 6, '2024-10-10', 'Shipped', 'East');
INSERT INTO orders VALUES (29, 9, 1, '2024-04-02', 'Delivered', 'East');
INSERT INTO orders VALUES (30, 12, 1, '2024-05-08', 'Delivered', 'North');
INSERT INTO orders VALUES (31, 7, 8, '2024-05-05', 'Shipped', 'North');
INSERT INTO orders VALUES (32, 24, 3, '2024-07-26', 'Delivered', 'North');
INSERT INTO orders VALUES (33, 6, 1, '2024-02-13', 'Returned', 'West');
INSERT INTO orders VALUES (34, 15, 1, '2024-05-14', 'Delivered', 'East');
INSERT INTO orders VALUES (35, 3, 8, '2024-05-22', 'Cancelled', 'South');
INSERT INTO orders VALUES (36, 5, 7, '2024-10-27', 'Delivered', 'West');
INSERT INTO orders VALUES (37, 8, 2, '2024-10-26', 'Cancelled', 'South');
INSERT INTO orders VALUES (38, 17, 7, '2024-12-24', 'Cancelled', 'South');
INSERT INTO orders VALUES (39, 22, 4, '2024-02-13', 'Delivered', 'North');
INSERT INTO orders VALUES (40, 2, 1, '2024-11-16', 'Cancelled', 'South');
INSERT INTO orders VALUES (41, 24, 8, '2024-05-09', 'Delivered', 'East');
INSERT INTO orders VALUES (42, 15, 8, '2024-07-14', 'Delivered', 'West');
INSERT INTO orders VALUES (43, 11, 5, '2024-11-29', 'Returned', 'East');
INSERT INTO orders VALUES (44, 4, 4, '2024-12-11', 'Shipped', 'East');
INSERT INTO orders VALUES (45, 10, 8, '2024-02-09', 'Cancelled', 'West');
INSERT INTO orders VALUES (46, 12, 3, '2024-11-04', 'Returned', 'Central');
INSERT INTO orders VALUES (47, 1, 8, '2024-12-14', 'Shipped', 'West');
INSERT INTO orders VALUES (48, 11, 6, '2024-07-22', 'Delivered', 'South');
INSERT INTO orders VALUES (49, 12, 2, '2024-07-20', 'Shipped', 'Central');
INSERT INTO orders VALUES (50, 2, 5, '2024-02-22', 'Delivered', 'East');
INSERT INTO orders VALUES (51, 25, 6, '2024-08-07', 'Delivered', 'West');
INSERT INTO orders VALUES (52, 20, 3, '2024-11-25', 'Delivered', 'West');
INSERT INTO orders VALUES (53, 16, 7, '2024-06-24', 'Delivered', 'East');
INSERT INTO orders VALUES (54, 22, 7, '2024-03-02', 'Delivered', 'South');
INSERT INTO orders VALUES (55, 18, 4, '2024-08-19', 'Delivered', 'West');
INSERT INTO orders VALUES (56, 9, 4, '2024-01-11', 'Returned', 'West');
INSERT INTO orders VALUES (57, 5, 4, '2024-02-17', 'Delivered', 'South');
INSERT INTO orders VALUES (58, 16, 1, '2024-02-07', 'Shipped', 'Central');
INSERT INTO orders VALUES (59, 21, 8, '2024-02-13', 'Cancelled', 'North');
INSERT INTO orders VALUES (60, 19, 1, '2024-11-26', 'Returned', 'East');
INSERT INTO orders VALUES (61, 25, 2, '2024-02-20', 'Delivered', 'East');
INSERT INTO orders VALUES (62, 18, 5, '2024-08-23', 'Delivered', 'East');
INSERT INTO orders VALUES (63, 14, 5, '2024-01-29', 'Delivered', 'South');
INSERT INTO orders VALUES (64, 23, 6, '2024-08-03', 'Delivered', 'West');
INSERT INTO orders VALUES (65, 7, 8, '2024-04-12', 'Delivered', 'South');
INSERT INTO orders VALUES (66, 16, 3, '2024-04-24', 'Shipped', 'West');
INSERT INTO orders VALUES (67, 2, 4, '2024-01-13', 'Cancelled', 'South');
INSERT INTO orders VALUES (68, 7, 3, '2024-11-30', 'Cancelled', 'West');
INSERT INTO orders VALUES (69, 13, 6, '2024-06-18', 'Shipped', 'South');
INSERT INTO orders VALUES (70, 3, 6, '2024-08-03', 'Delivered', 'Central');

-- ORDER_ITEMS
INSERT INTO order_items VALUES (1, 1, 8, 2, 4999, 0);
INSERT INTO order_items VALUES (2, 1, 5, 6, 1799, 0);
INSERT INTO order_items VALUES (3, 1, 3, 1, 299, 5);
INSERT INTO order_items VALUES (4, 1, 6, 5, 1499, 0);
INSERT INTO order_items VALUES (5, 2, 20, 2, 1599, 15);
INSERT INTO order_items VALUES (6, 2, 19, 5, 1799, 10);
INSERT INTO order_items VALUES (7, 2, 11, 6, 1899, 15);
INSERT INTO order_items VALUES (8, 3, 13, 4, 149, 0);
INSERT INTO order_items VALUES (9, 3, 4, 2, 1299, 0);
INSERT INTO order_items VALUES (10, 3, 16, 2, 349, 5);
INSERT INTO order_items VALUES (11, 3, 21, 2, 249, 0);
INSERT INTO order_items VALUES (12, 4, 18, 3, 1299, 10);
INSERT INTO order_items VALUES (13, 4, 4, 1, 1299, 0);
INSERT INTO order_items VALUES (14, 5, 20, 1, 1599, 0);
INSERT INTO order_items VALUES (15, 5, 12, 4, 199, 5);
INSERT INTO order_items VALUES (16, 5, 16, 4, 349, 5);
INSERT INTO order_items VALUES (17, 6, 16, 5, 349, 0);
INSERT INTO order_items VALUES (18, 6, 23, 2, 189, 10);
INSERT INTO order_items VALUES (19, 6, 6, 3, 1499, 0);
INSERT INTO order_items VALUES (20, 7, 17, 3, 499, 0);
INSERT INTO order_items VALUES (21, 7, 12, 5, 199, 10);
INSERT INTO order_items VALUES (22, 7, 6, 5, 1499, 0);
INSERT INTO order_items VALUES (23, 8, 24, 5, 249, 5);
INSERT INTO order_items VALUES (24, 8, 26, 3, 55, 15);
INSERT INTO order_items VALUES (25, 8, 8, 1, 4999, 0);
INSERT INTO order_items VALUES (26, 8, 7, 3, 6499, 5);
INSERT INTO order_items VALUES (27, 9, 26, 2, 55, 0);
INSERT INTO order_items VALUES (28, 9, 24, 2, 249, 5);
INSERT INTO order_items VALUES (29, 9, 12, 2, 199, 0);
INSERT INTO order_items VALUES (30, 9, 3, 2, 299, 5);
INSERT INTO order_items VALUES (31, 10, 22, 1, 649, 5);
INSERT INTO order_items VALUES (32, 11, 3, 4, 299, 5);
INSERT INTO order_items VALUES (33, 11, 26, 4, 55, 15);
INSERT INTO order_items VALUES (34, 11, 24, 1, 249, 15);
INSERT INTO order_items VALUES (35, 12, 26, 5, 55, 5);
INSERT INTO order_items VALUES (36, 12, 21, 6, 249, 0);
INSERT INTO order_items VALUES (37, 12, 5, 2, 1799, 10);
INSERT INTO order_items VALUES (38, 12, 20, 5, 1599, 0);
INSERT INTO order_items VALUES (39, 13, 14, 2, 99, 0);
INSERT INTO order_items VALUES (40, 13, 7, 3, 6499, 0);
INSERT INTO order_items VALUES (41, 14, 5, 4, 1799, 15);
INSERT INTO order_items VALUES (42, 14, 2, 5, 1999, 10);
INSERT INTO order_items VALUES (43, 14, 24, 4, 249, 10);
INSERT INTO order_items VALUES (44, 14, 12, 2, 199, 10);
INSERT INTO order_items VALUES (45, 15, 25, 2, 549, 0);
INSERT INTO order_items VALUES (46, 16, 11, 6, 1899, 10);
INSERT INTO order_items VALUES (47, 17, 7, 1, 6499, 0);
INSERT INTO order_items VALUES (48, 17, 9, 5, 3299, 5);
INSERT INTO order_items VALUES (49, 18, 23, 4, 189, 10);
INSERT INTO order_items VALUES (50, 18, 9, 5, 3299, 5);
INSERT INTO order_items VALUES (51, 19, 15, 4, 129, 0);
INSERT INTO order_items VALUES (52, 19, 5, 4, 1799, 5);
INSERT INTO order_items VALUES (53, 20, 7, 6, 6499, 0);
INSERT INTO order_items VALUES (54, 21, 9, 4, 3299, 0);
INSERT INTO order_items VALUES (55, 21, 5, 6, 1799, 0);
INSERT INTO order_items VALUES (56, 22, 23, 5, 189, 5);
INSERT INTO order_items VALUES (57, 22, 14, 3, 99, 5);
INSERT INTO order_items VALUES (58, 23, 11, 5, 1899, 5);
INSERT INTO order_items VALUES (59, 24, 17, 2, 499, 0);
INSERT INTO order_items VALUES (60, 24, 3, 1, 299, 0);
INSERT INTO order_items VALUES (61, 24, 4, 3, 1299, 0);
INSERT INTO order_items VALUES (62, 25, 13, 5, 149, 10);
INSERT INTO order_items VALUES (63, 25, 5, 4, 1799, 15);
INSERT INTO order_items VALUES (64, 25, 18, 3, 1299, 0);
INSERT INTO order_items VALUES (65, 26, 9, 1, 3299, 15);
INSERT INTO order_items VALUES (66, 27, 9, 1, 3299, 5);
INSERT INTO order_items VALUES (67, 28, 2, 6, 1999, 0);
INSERT INTO order_items VALUES (68, 28, 17, 1, 499, 0);
INSERT INTO order_items VALUES (69, 29, 17, 3, 499, 5);
INSERT INTO order_items VALUES (70, 29, 25, 5, 549, 15);
INSERT INTO order_items VALUES (71, 29, 7, 2, 6499, 0);
INSERT INTO order_items VALUES (72, 30, 24, 5, 249, 10);
INSERT INTO order_items VALUES (73, 31, 22, 5, 649, 0);
INSERT INTO order_items VALUES (74, 31, 16, 6, 349, 0);
INSERT INTO order_items VALUES (75, 31, 18, 2, 1299, 0);
INSERT INTO order_items VALUES (76, 31, 13, 2, 149, 15);
INSERT INTO order_items VALUES (77, 32, 1, 6, 699, 15);
INSERT INTO order_items VALUES (78, 32, 3, 3, 299, 5);
INSERT INTO order_items VALUES (79, 33, 20, 3, 1599, 0);
INSERT INTO order_items VALUES (80, 33, 8, 4, 4999, 0);
INSERT INTO order_items VALUES (81, 33, 23, 2, 189, 0);
INSERT INTO order_items VALUES (82, 34, 8, 2, 4999, 0);
INSERT INTO order_items VALUES (83, 34, 2, 2, 1999, 0);
INSERT INTO order_items VALUES (84, 34, 10, 3, 5499, 5);
INSERT INTO order_items VALUES (85, 35, 17, 1, 499, 0);
INSERT INTO order_items VALUES (86, 35, 25, 3, 549, 0);
INSERT INTO order_items VALUES (87, 36, 10, 3, 5499, 15);
INSERT INTO order_items VALUES (88, 37, 25, 2, 549, 0);
INSERT INTO order_items VALUES (89, 37, 11, 6, 1899, 10);
INSERT INTO order_items VALUES (90, 37, 24, 6, 249, 0);
INSERT INTO order_items VALUES (91, 37, 16, 1, 349, 15);
INSERT INTO order_items VALUES (92, 38, 22, 5, 649, 15);
INSERT INTO order_items VALUES (93, 39, 21, 1, 249, 5);
INSERT INTO order_items VALUES (94, 39, 12, 4, 199, 10);
INSERT INTO order_items VALUES (95, 40, 9, 1, 3299, 15);
INSERT INTO order_items VALUES (96, 40, 1, 5, 699, 10);
INSERT INTO order_items VALUES (97, 40, 15, 1, 129, 15);
INSERT INTO order_items VALUES (98, 40, 26, 5, 55, 0);
INSERT INTO order_items VALUES (99, 41, 24, 2, 249, 0);
INSERT INTO order_items VALUES (100, 41, 25, 6, 549, 15);
INSERT INTO order_items VALUES (101, 42, 25, 6, 549, 15);
INSERT INTO order_items VALUES (102, 42, 2, 2, 1999, 0);
INSERT INTO order_items VALUES (103, 42, 20, 5, 1599, 0);
INSERT INTO order_items VALUES (104, 43, 1, 1, 699, 5);
INSERT INTO order_items VALUES (105, 43, 16, 3, 349, 15);
INSERT INTO order_items VALUES (106, 44, 15, 5, 129, 0);
INSERT INTO order_items VALUES (107, 44, 25, 3, 549, 0);
INSERT INTO order_items VALUES (108, 44, 4, 4, 1299, 0);
INSERT INTO order_items VALUES (109, 45, 13, 5, 149, 0);
INSERT INTO order_items VALUES (110, 45, 7, 2, 6499, 15);
INSERT INTO order_items VALUES (111, 45, 3, 5, 299, 0);
INSERT INTO order_items VALUES (112, 46, 4, 2, 1299, 5);
INSERT INTO order_items VALUES (113, 46, 23, 4, 189, 5);
INSERT INTO order_items VALUES (114, 46, 12, 1, 199, 0);
INSERT INTO order_items VALUES (115, 47, 24, 3, 249, 5);
INSERT INTO order_items VALUES (116, 47, 5, 3, 1799, 0);
INSERT INTO order_items VALUES (117, 47, 14, 3, 99, 0);
INSERT INTO order_items VALUES (118, 48, 24, 3, 249, 0);
INSERT INTO order_items VALUES (119, 49, 12, 4, 199, 0);
INSERT INTO order_items VALUES (120, 50, 8, 4, 4999, 10);
INSERT INTO order_items VALUES (121, 50, 9, 3, 3299, 0);
INSERT INTO order_items VALUES (122, 51, 24, 1, 249, 15);
INSERT INTO order_items VALUES (123, 51, 3, 4, 299, 5);
INSERT INTO order_items VALUES (124, 52, 18, 2, 1299, 0);
INSERT INTO order_items VALUES (125, 53, 24, 4, 249, 15);
INSERT INTO order_items VALUES (126, 53, 21, 2, 249, 0);
INSERT INTO order_items VALUES (127, 53, 9, 4, 3299, 10);
INSERT INTO order_items VALUES (128, 54, 7, 5, 6499, 5);
INSERT INTO order_items VALUES (129, 55, 5, 1, 1799, 0);
INSERT INTO order_items VALUES (130, 55, 18, 3, 1299, 10);
INSERT INTO order_items VALUES (131, 55, 7, 1, 6499, 0);
INSERT INTO order_items VALUES (132, 55, 8, 2, 4999, 0);
INSERT INTO order_items VALUES (133, 56, 14, 4, 99, 0);
INSERT INTO order_items VALUES (134, 56, 24, 3, 249, 0);
INSERT INTO order_items VALUES (135, 56, 17, 4, 499, 0);
INSERT INTO order_items VALUES (136, 56, 7, 5, 6499, 0);
INSERT INTO order_items VALUES (137, 57, 13, 3, 149, 0);
INSERT INTO order_items VALUES (138, 57, 21, 2, 249, 0);
INSERT INTO order_items VALUES (139, 57, 15, 4, 129, 15);
INSERT INTO order_items VALUES (140, 57, 14, 4, 99, 10);
INSERT INTO order_items VALUES (141, 58, 15, 2, 129, 0);
INSERT INTO order_items VALUES (142, 58, 8, 2, 4999, 10);
INSERT INTO order_items VALUES (143, 58, 26, 6, 55, 0);
INSERT INTO order_items VALUES (144, 58, 4, 6, 1299, 15);
INSERT INTO order_items VALUES (145, 59, 26, 2, 55, 0);
INSERT INTO order_items VALUES (146, 60, 21, 5, 249, 15);
INSERT INTO order_items VALUES (147, 60, 9, 4, 3299, 15);
INSERT INTO order_items VALUES (148, 61, 13, 2, 149, 10);
INSERT INTO order_items VALUES (149, 61, 9, 1, 3299, 0);
INSERT INTO order_items VALUES (150, 62, 16, 2, 349, 10);
INSERT INTO order_items VALUES (151, 62, 17, 2, 499, 0);
INSERT INTO order_items VALUES (152, 63, 22, 3, 649, 0);
INSERT INTO order_items VALUES (153, 63, 21, 6, 249, 5);
INSERT INTO order_items VALUES (154, 63, 14, 3, 99, 0);
INSERT INTO order_items VALUES (155, 63, 3, 4, 299, 0);
INSERT INTO order_items VALUES (156, 64, 1, 3, 699, 15);
INSERT INTO order_items VALUES (157, 64, 26, 5, 55, 0);
INSERT INTO order_items VALUES (158, 65, 15, 3, 129, 0);
INSERT INTO order_items VALUES (159, 65, 8, 1, 4999, 10);
INSERT INTO order_items VALUES (160, 66, 20, 2, 1599, 5);
INSERT INTO order_items VALUES (161, 67, 2, 4, 1999, 15);
INSERT INTO order_items VALUES (162, 67, 23, 3, 189, 15);
INSERT INTO order_items VALUES (163, 67, 6, 1, 1499, 0);
INSERT INTO order_items VALUES (164, 67, 13, 2, 149, 0);
INSERT INTO order_items VALUES (165, 68, 10, 6, 5499, 15);
INSERT INTO order_items VALUES (166, 69, 1, 1, 699, 0);
INSERT INTO order_items VALUES (167, 70, 13, 3, 149, 5);
INSERT INTO order_items VALUES (168, 70, 12, 1, 199, 0);
