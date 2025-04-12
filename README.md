# DB-Groupwork
# Bookstore Database Project

## Overview

This project involves designing and implementing a MySQL relational database for a bookstore. The database handles information about books, authors, customers, orders, shipping methods, and more. It provides a structured system for storing, retrieving, and analyzing data efficiently.

## Technologies Used

- **MySQL** – for database creation and management
- **Draw.io** – for visualizing the database schema (ER diagram)

## Project Objective

Build a robust and normalized database system that:
- Stores key data about the bookstore's operations
- Supports data integrity and efficient queries
- Allows secure user access and role management

---

## Database Features

- Fully normalized schema
- Proper use of primary and foreign keys
- Many-to-many, one-to-many, and one-to-one relationships handled
- Security and user roles considered

---

## Tables and Relationships

### Main Tables:
1. `book` – All books in the store  
2. `author` – List of authors  
3. `book_author` – Maps books to authors (many-to-many)  
4. `book_language` – Language options for books  
5. `publisher` – Publishers of books  
6. `customer` – Bookstore customers  
7. `customer_address` – Maps customers to addresses  
8. `address` – All addresses in the system  
9. `address_status` – Current or old address info  
10. `country` – Country list  
11. `cust_order` – Customer orders  
12. `order_line` – Books in each order  
13. `shipping_method` – Shipping methods for orders  
14. `order_status` – Order status values  
15. `order_history` – Tracks order status changes over time  

---

## ER Diagram

An Entity-Relationship Diagram (`ERD`) was created using **Draw.io** to visualize table relationships.  
> [Insert image or link to ERD here]

---

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/sandy56-hash/DB-Groupwork.git
   cd DB-Groupwork
   
