-- Insert data into State table
INSERT INTO `mydb`.`state` (`state_id`, `State_name`) VALUES
(1, 'California'),
(2, 'Texas'),
(3, 'New York'),
(4, 'Florida'),
(5, 'Illinois');

-- Insert data into Spouse table
INSERT INTO `mydb`.`spouse` (`spouse_id`, `spouse_name`) VALUES
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Carol Williams'),
(4, 'David Brown'),
(5, 'Eve Davis');

-- Insert data into agents table
INSERT INTO `mydb`.`agents` (`agents_id`, `first_name`, `last_name`) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Michael', 'Johnson'),
(4, 'Patricia', 'Brown'),
(5, 'Linda', 'Davis');

-- Insert data into transactions table
INSERT INTO `mydb`.`transactions` (`transactions_id`, `agents_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Insert data into Lender_info table
INSERT INTO `mydb`.`lender_info` (`Lender_info_id`, `lender_name`, `transactions_id`) VALUES
(1, 'Lender A', 1),
(2, 'Lender B', 2),
(3, 'Lender C', 3),
(4, 'Lender D', 4),
(5, 'Lender E', 5);

-- Insert data into employment table
INSERT INTO `mydb`.`employment` (`employment_id`, `job`, `salary`) VALUES
(1, 'Engineer', '100000'),
(2, 'Doctor', '150000'),
(3, 'Teacher', '50000'),
(4, 'Lawyer', '120000'),
(5, 'Nurse', '80000');

-- Insert data into customer_info table
INSERT INTO `mydb`.`customer_info` (`customer_info_id`, `first_name`, `last_name`, `phone`, `email`, `price-range`, `customer_infocol`, `spouse_id`, `lender_info_id`, `agents_id`, `employment_id`, `state_id`) VALUES
(1, 'Emily', 'Clark', '1234567890', 'emily.clark@example.com', 300000, 'Info1', 1, 1, 1, 1, 1),
(2, 'Daniel', 'Miller', '0987654321', 'daniel.miller@example.com', 400000, 'Info2', 2, 2, 2, 2, 2),
(3, 'Sophia', 'Wilson', '1112223333', 'sophia.wilson@example.com', 500000, 'Info3', 3, 3, 3, 3, 3),
(4, 'James', 'Moore', '4445556666', 'james.moore@example.com', 600000, 'Info4', 4, 4, 4, 4, 4),
(5, 'Olivia', 'Taylor', '7778889999', 'olivia.taylor@example.com', 700000, 'Info5', 5, 5, 5, 5, 5);

-- Insert data into Property_interested table
INSERT INTO `mydb`.`property_interested` (`property_id`, `property_address`, `property_price`) VALUES
(1, '123 Main St', 300000),
(2, '456 Elm St', 400000),
(3, '789 Oak St', 500000),
(4, '101 Pine St', 600000),
(5, '202 Maple St', 700000);

-- Insert data into current_address table
INSERT INTO `mydb`.`current_address` (`current_address_id`, `address`, `owned`, `customer_info_id`) VALUES
(1, '321 Walnut St', 1, 1),
(2, '654 Cedar St', 1, 2),
(3, '987 Birch St', 1, 3),
(4, '109 Spruce St', 0, 4),
(5, '203 Fir St', 0, 5);

-- Insert data into Children table
INSERT INTO `mydb`.`children` (`children_id`, `name`, `customer_info_id`) VALUES
(1, 'Sam Clark', 1),
(2, 'Amy Miller', 2),
(3, 'Lily Wilson', 3),
(4, 'Tom Moore', 4),
(5, 'Ella Taylor', 5);

-- Insert data into customer_info_has_transactions table
INSERT INTO `mydb`.`customer_info_has_transactions` (`customer_info_id`, `employment_id`, `state_id`, `transactions_id`, `agents_id`) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2),
(3, 3, 3, 3, 3),
(4, 4, 4, 4, 4),
(5, 5, 5, 5, 5);

-- Insert data into customer_info_has_Property_interested table
INSERT INTO `mydb`.`customer_info_has_property_interested` (`customer_info_id`, `employment_id`, `state_id`, `Property_id`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5);


SELECT a.agents_id, a.first_name, a.last_name, COUNT(t.transactions_id) AS total_transactions
FROM mydb.agents a
JOIN mydb.transactions t ON a.agents_id = t.agents_id
GROUP BY a.agents_id, a.first_name, a.last_name;




