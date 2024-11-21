CREATE DATABASE car_dealership;

CREATE TABLE dealerships (
dealership_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50),
address VARCHAR(50),
phone VARCHAR(12), 
PRIMARY KEY (dealership_id)
);

DROP TABLE IF EXISTS dealerships;

INSERT INTO dealerships (name, address, phone) VALUES
('Auto Galaxy', '123 Main St, Springfield', '555-123-4567'),
('Luxury Wheels', '456 Elm Rd, Shelbyville', '555-987-6543'),
('Budget Motors', '789 Pine Ave, Capital City', '555-567-8901'),
('Premium Autos', '321 Oak Blvd, Ogdenville', '555-345-6789'),
('Reliable Rides', '654 Maple St, North Haverbrook', '555-234-5678');

CREATE TABLE vehicles (
vin INT NOT NULL,
vehicle_year INT,
make VARCHAR(20),
model VARCHAR(45),
vehicle_type VARCHAR(20),
vehicle_color VARCHAR(10),
vehicle_miles MEDIUMINT UNSIGNED,
vehicle_price DOUBLE,
sold BOOL, 
PRIMARY KEY (vin)
);

INSERT INTO vehicles (vin, vehicle_year, make, model, vehicle_type, vehicle_color, vehicle_miles, vehicle_price, sold) VALUES
(10001, 2022, 'Toyota', 'Camry', 'Sedan', 'White', 20000, 25000.00, TRUE),
(10002, 2021, 'Honda', 'CR-V', 'SUV', 'Black', 15000, 28000.00, FALSE),
(10003, 2023, 'Ford', 'F-150', 'Truck', 'Blue', 1000, 45000.00, FALSE),
(10004, 2020, 'Chevrolet', 'Malibu', 'Sedan', 'Red', 30000, 20000.00, TRUE),
(10005, 2022, 'Tesla', 'Model 3', 'Sedan', 'White', 5000, 55000.00, FALSE);

DROP TABLE IF EXISTS vehicles;

CREATE TABLE inventory (
id INT NOT NULL AUTO_INCREMENT,
dealership_id INT,
vin INT,
PRIMARY KEY(id),
FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

INSERT INTO inventory (dealership_id, vin) VALUES
(1, 10001),
(1, 10002),
(2, 10003),
(3, 10004),
(3, 10005);

DROP TABLE IF EXISTS inventory;

CREATE TABLE sales_contracts (
id INT NOT NULL AUTO_INCREMENT,
vin INT,
sale_date DATE,
customer_name VARCHAR(50),
customer_email VARCHAR(50),
sales_tax DOUBLE (10, 2),
recording_fee DOUBLE (10, 2),
processing_fee DOUBLE (10, 2),
down_payment DOUBLE (10, 2),
monthly_payment DOUBLE (10, 2),
financed bool,
PRIMARY KEY (id),
FOREIGN KEY(vin) REFERENCES vehicles(vin)
);

INSERT INTO sales_contracts (vin, sale_date, customer_name, customer_email, sales_tax, recording_fee, processing_fee, down_payment, monthly_payment, financed) VALUES
(10001, '2024-10-01', 'John Doe', 'johndoe@example.com', 1500.00, 50.00, 100.00, 5000.00, 450.00, TRUE),
(10004, '2024-09-15', 'Jane Smith', 'janesmith@example.com', 1200.00, 50.00, 100.00, 2000.00, 400.00, TRUE);

DROP TABLE IF EXISTS sales_contracts;

CREATE TABLE lease_contracts (
id INT NOT NULL AUTO_INCREMENT,
vin INT,
lease_date DATE,
customer_name VARCHAR(50),
customer_email VARCHAR(50),
expected_end_value DOUBLE (10, 2),
lease_fee DOUBLE (10, 2),
down_payment DOUBLE (10, 2),
monthly_payment DOUBLE (10, 2),
PRIMARY KEY (id),
FOREIGN KEY(vin) REFERENCES vehicles(vin)
);

INSERT INTO lease_contracts (vin, lease_date, customer_name, customer_email, expected_end_value, lease_fee, down_payment, monthly_payment) VALUES
(10005, '2024-08-20', 'Alex Johnson', 'alexjohnson@example.com', 20000.00, 25.00, 3000.00, 700.00),
(10002, '2024-09-10', 'Emily Brown', 'emilybrown@example.com', 18000.00, 20.00, 2500.00, 550.00);


DROP TABLE IF EXISTS lease_contracts;