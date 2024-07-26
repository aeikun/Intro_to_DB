USE alx_book_store;

-- Drop tables if they already exist
DROP TABLE IF EXISTS Order_Details;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Authors;

-- Create tables
CREATE TABLE Authors (
    author_id INT(11) NOT NULL AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (author_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Books (
    book_id INT(11) NOT NULL AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT(11) DEFAULT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE DEFAULT NULL,
    PRIMARY KEY (book_id),
    KEY author_id (author_id),
    CONSTRAINT Books_ibfk_1 FOREIGN KEY (author_id) REFERENCES Authors (author_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Customers (
    customer_id INT(11) NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Orders (
    order_id INT(11) NOT NULL AUTO_INCREMENT,
    customer_id INT(11),
    order_date DATE NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES Customers (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Order_Details (
    order_detail_id INT(11) NOT NULL AUTO_INCREMENT,
    order_id INT(11),
    book_id INT(11),
    quantity INT(11) NOT NULL,
    PRIMARY KEY (order_detail_id),
    FOREIGN KEY (order_id) REFERENCES Orders (order_id),
    FOREIGN KEY (book_id) REFERENCES Books (book_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
