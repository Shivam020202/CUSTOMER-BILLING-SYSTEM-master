

--table for Customer details
CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50),
  phone VARCHAR(15),
  address VARCHAR(100)
);
--table for products
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(255)
);
--table for orders
CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

--table for order details
CREATE TABLE Order_Details (
  order_detail_id INT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- table for payments
CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date DATETIME NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

-- table for bills
CREATE TABLE bills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    bill_date DATETIME NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    tax_amount DECIMAL(10,2) NOT NULL,
    delivery_cost DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);






-- Queries to add food and drinks in products table . These are just examples .
-- Comment/delete them before running this code

-- Insert a food product
INSERT INTO products (name, description, price, category)
VALUES ('Pizza', 'Malai Paneer pizza', 10.99, 'food');

-- Insert a drink product
INSERT INTO products (name, description, price, category)
VALUES ('Beverage', 'Red Bull', 1.99, 'drink');