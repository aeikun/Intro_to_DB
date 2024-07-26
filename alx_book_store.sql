-- Drop the database if it exists
DROP DATABASE IF EXISTS alx_book_store;

-- Create the database with the correct collation
CREATE DATABASE IF NOT EXISTS alx_book_store
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

-- Select the database to use
USE alx_book_store;

-- Create tables
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Optional: Insert sample data
INSERT INTO Authors (author_name) VALUES ('George Orwell'), ('J.K. Rowling');
INSERT INTO Books (title, author_id, price, publication_date) VALUES 
('1984', 1, 9.99, '1949-06-08'),
('Harry Potter and the Philosopher\'s Stone', 2, 19.99, '1997-06-26');
INSERT INTO Customers (customer_name, email, address) VALUES 
('Alice Johnson', 'alice@example.com', '123 Elm Street'),
('Bob Smith', 'bob@example.com', '456 Oak Avenue');
INSERT INTO Orders (customer_id, order_date) VALUES 
(1, '2024-07-26'),
(2, '2024-07-26');
INSERT INTO Order_Details (order_id, book_id, quantity) VALUES 
(1, 1, 1),
(2, 2, 2);
