-- Get all dealerships
SELECT * FROM dealerships;

-- Finding all vehicles for a specific dealership
SELECT dealership_id, vin FROM inventory
WHERE dealership_id = 1;

-- Finding a vehicle by VIN
SELECT * FROM vehicles
WHERE vin = 10001;

-- Finding the dealership that contains a specific vehicle in inventory by VIN
SELECT * FROM dealerships
JOIN inventory ON inventory.dealership_id = dealerships.dealership_id
WHERE vin = 10003;

-- Finding all dealerships that have a certain car type
SELECT dealership_id, vehicle_type, vehicle_color, make FROM inventory
JOIN vehicles ON inventory.vin = vehicles.vin
WHERE vehicle_type = 'Sedan' AND vehicle_color = 'Red' AND make = 'Chevrolet';

-- Getting all sales information for a specific dealer for a specific date range
SELECT sale_date, customer_name, customer_email, sales_tax, recording_fee, processing_fee, down_payment, monthly_payment, financed, dealership_id FROM sales_contracts
JOIN inventory ON inventory.vin = sales_contracts.vin
WHERE sale_date = '2024-10-01';
