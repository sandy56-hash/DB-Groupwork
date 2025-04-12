CREATE DATABASE bookstore;

CREATE TABLE book (
    book_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    subtitle VARCHAR(255),
    publication_date DATE,
    price DECIMAL(10, 2),
    PRIMARY KEY (book_id)
);

CREATE TABLE author (
    author_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    PRIMARY KEY (author_id)
);

CREATE TABLE book_author (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

CREATE TABLE book_language (
    book_language_id INT AUTO_INCREMENT,
    language VARCHAR(50) NOT NULL,
    PRIMARY KEY (book_language_id)
);

CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    PRIMARY KEY (publisher_id)
);

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (customer_id)
);

CREATE TABLE customer_address (
    customer_address_id INT AUTO_INCREMENT,
    customer_id INT NOT NULL,
    address_id INT NOT NULL,
    address_status VARCHAR(50) NOT NULL,
    PRIMARY KEY (customer_address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

CREATE TABLE address (
    address_id INT AUTO_INCREMENT,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip_code VARCHAR(20) NOT NULL,
    PRIMARY KEY (address_id)
);

CREATE TABLE country (
    country_id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (country_id)
);

CREATE TABLE address_country (
    address_id INT NOT NULL,
    country_id INT NOT NULL,
    PRIMARY KEY (address_id, country_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE order_line (
    order_line_id INT AUTO_INCREMENT,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_line_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (shipping_method_id)
);

CREATE TABLE order_shipping (
    order_id INT NOT NULL,
    shipping_method_id INT NOT NULL,
    PRIMARY KEY (order_id, shipping_method_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id)
);

CREATE TABLE order_status (
    order_status_id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (order_status_id)
);

CREATE TABLE order_history (
    order_history_id INT AUTO_INCREMENT,
    order_id INT NOT NULL,
    order_status_id INT NOT NULL,
    date DATE NOT NULL,
    PRIMARY KEY (order_history_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);


-- Create users and roles
CREATE USER 'readonly_user'@'localhost' IDENTIFIED BY 'readonlypass';
GRANT SELECT ON bookstore.*TO 'readonly_user'@'localhost';

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'adminpass';
GRANT ALL PRIVILEGES ON  bookstore.* TO 'admin_user'@'localhost';

-- List all books with authors and publishers
SELECT b.title, a.first_name, a.last_name, p.name AS publisher
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
JOIN publisher p ON b.publisher_id = p.publisher_id;
