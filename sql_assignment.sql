-- Q1 Create a database named class_one_assignment
CREATE DATABASE class_one_assignment;

USE class_one_assignment;

-- Q2 create a table named customers. 
CREATE TABLE customers(
id INT AUTO_INCREMENT,
First_Name VARCHAR(15) NOT NULL,
Last_Name VARCHAR(15) NOT NULL,
Date_of_Birth DATE,
Phone VARCHAR(12),
Address VARCHAR(30),
City VARCHAR(15),
State VARCHAR(5),
Points INT,
PRIMARY KEY(id)	
);

SELECT * FROM customers;

TRUNCATE TABLE customers;

-- Q3 Inserting data to customers table
INSERT INTO customers(First_Name,Last_Name,Date_of_Birth,Phone,Address,City,
			State,Points) VALUES
						
('Babara','MacCaffrey','1986-03-28','781-932-9754','0 Sage Terrace','Waltham','MA',2273),
('Ines','Brushfield','1986-04-13','804-427-9456','14187 Commercial Trail','Hampton','VA',947),
('Freddi','Boagey','1985-02-07','719-724-7869','251 Springs Junction','Colorado Springs','CO',2967),
('Ambur','Roseburgh','1974-04-14','407-231-8017','30 Arapahoe Terrace','Orlando','FL',457),
('Clemmie','Betchley','1973-11-07','','5 Spohn Circle','Arlington','TX',3675);
		
-- Q4 Show only 2 members whose points are more than 1000
SELECT * FROM customers
WHERE Points > 1000
LIMIT 2;

-- Q5 Find the customers whose age is in 1980 to 1990 or points less than 1000.
SELECT * FROM customers 
WHERE (Date_of_Birth BETWEEN '1980-01-01' AND '1990-12-31') OR Points < 1000;

-- Q6 Order the customers by points in ascending and descending order.
SELECT * FROM customers ORDER BY Points ASC;
SELECT * FROM customers ORDER BY Points DESC;

-- Q7 Find the customer whose name contains 'burgh' using like and regexp.
SELECT CONCAT(First_Name,' ',Last_Name) AS Full_Name FROM customers 
WHERE (Last_Name LIKE '%burgh%') OR (First_Name LIKE '%burgh%');

-- Q8 Find the customer who does not have phone number.
SELECT * FROM customers 
WHERE Phone = '';

-- Q9 Change the 'Date of Birth' column name into 'dob'
ALTER TABLE customers
CHANGE COLUMN Date_of_Birth dob DATE;

-- Q10 Find the max point holder customer
SELECT CONCAT(First_Name,' ',Last_Name) AS Full_Name,MAX(Points) FROM customers;

-- Q11 If customers have points less than 1000, they are bronze member.
-- If customers have points more than 1000 and less than 2000, they are silver member.
-- If customers have points more than 2000 and less than 3000, they are gold member.
-- If customers have points more than 3000, they are platinum member.
SELECT CONCAT(First_Name,' ',Last_Name) AS Full_Name , Points,
CASE 
	WHEN Points >= 3000 THEN 'Platinum Member'
	WHEN Points >= 2000 THEN 'Gold Member'
	WHEN Points >= 1000  THEN 'Silver Member'
	ELSE 'Bronze Member'
	END AS Customer_Status FROM customers;
