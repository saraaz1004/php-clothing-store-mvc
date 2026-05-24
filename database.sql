CREATE DATABASE IF NOT EXISTS online_prodavnica_odece CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE online_prodavnica_odece;

CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS brands (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    category_id INT NOT NULL,
    brand_id INT NOT NULL,
    size VARCHAR(20),
    color VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    FOREIGN KEY (brand_id) REFERENCES brands(id)
);

CREATE TABLE IF NOT EXISTS customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    address VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE IF NOT EXISTS admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

INSERT INTO categories (name) VALUES
('Haljine'), ('Majice'), ('Pantalone'), ('Jakne'), ('Suknje');

INSERT INTO brands (name, country) VALUES
('Zara', 'Spain'), ('H&M', 'Sweden'), ('Mango', 'Spain'), ('Bershka', 'Spain'), ('Nike', 'USA');

INSERT INTO products (name, category_id, brand_id, size, color, price, quantity) VALUES
('Crna haljina', 1, 1, 'M', 'Crna', 4500.00, 10),
('Bela majica', 2, 2, 'S', 'Bela', 1800.00, 20),
('Plave pantalone', 3, 3, 'L', 'Plava', 3200.00, 15),
('Kožna jakna', 4, 4, 'M', 'Crna', 7800.00, 5),
('Sportska suknja', 5, 5, 'S', 'Siva', 2500.00, 12);

INSERT INTO customers (full_name, email, address) VALUES
('Sara Zivkovic', 'sara@example.com', 'Beograd'),
('Ana Petrovic', 'ana@example.com', 'Novi Sad'),
('Milica Jovanovic', 'milica@example.com', 'Nis'),
('Jovana Markovic', 'jovana@example.com', 'Kragujevac');

INSERT INTO orders (customer_id, product_id, order_date, quantity, total_price) VALUES
(1, 1, '2025-03-20', 1, 4500.00),
(2, 2, '2025-03-21', 2, 3600.00),
(3, 4, '2025-03-22', 1, 7800.00),
(4, 3, '2025-03-22', 1, 3200.00),
(1, 5, '2025-03-23', 2, 5000.00);

INSERT INTO admins (username, password) VALUES ('admin', 'admin123');
