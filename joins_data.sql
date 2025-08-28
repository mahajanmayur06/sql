use joins_db;
create database joins_db;
-- Drop old tables
DROP TABLE IF EXISTS OrderItems, Orders, Customers, Products, Vendors;

-- Vendors table
CREATE TABLE Vendors (
    vendor_id INT PRIMARY KEY,
    vendor_name VARCHAR(50)
);

-- Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    vendor_id INT,
    FOREIGN KEY (vendor_id) REFERENCES Vendors(vendor_id)
);

-- Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- OrderItems (many-to-many relation: Orders <-> Products)
CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert Vendors
INSERT INTO Vendors VALUES
(1, 'Samsung'),
(2, 'Apple'),
(3, 'Sony'),
(4, 'LG'); -- LG has no products (test RIGHT/FULL JOIN)

-- Insert Products
INSERT INTO Products VALUES
(105, 'iPhone 15', 1000, 2),
(101, 'iPhone 13', 699.99, 2),
(102, 'Galaxy S22', 649.99, 1),
(103, 'Bravia TV', 1200.00, 3),
(104, 'AirPods Pro', 249.00, 2);

-- Insert Customers
INSERT INTO Customers VALUES
(1, 'Alice', 'Mumbai'),
(2, 'Bob', 'Pune'),
(3, 'Charlie', 'Delhi'),
(4, 'David', 'Chennai'); -- David never ordered (test LEFT JOIN)

INSERT INTO Customers VALUES
(5, 'Abhijeet', 'Mumbai'),
(6, 'Bhushan', 'Pune'),
(7, 'Churan Singh', 'Delhi'),
(8, 'Dalit', 'Chennai');

-- Insert Orders
INSERT INTO Orders VALUES
(1001, 1, '2024-06-01'),
(1002, 1, '2024-06-10'),
(1003, 2, '2024-06-15'),
(1004, 3, '2024-06-20');

-- Insert OrderItems
INSERT INTO OrderItems VALUES
(7, 1003, 101, 3),
(1, 1001, 101, 1), -- iPhone
(2, 1001, 104, 2), -- AirPods
(3, 1002, 102, 1), -- Galaxy
(4, 1003, 103, 1),-- Bravia
(5, 1004, 103, 2); -- Invalid product_id (simulate join fail)
