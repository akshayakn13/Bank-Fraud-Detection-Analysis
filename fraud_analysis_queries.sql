-- Reset the table if needed
DROP TABLE IF EXISTS RAW_TRANSACTIONS;
CREATE TABLE RAW_TRANSACTIONS (
    tx_id INT,
    tx_date TEXT,
    customer_name TEXT,
    amount TEXT, 
    location TEXT,
    is_flagged INT
);

-- Inserting 25 records with intentional "noise"
INSERT INTO RAW_TRANSACTIONS VALUES 
(1001, '2026-04-01', '  ANSHU KANT', '$500.00', 'MUMBAI', 0),
(1002, '2026-04-01', 'anshu kant ', ' $15.50', 'MUMBAI', 0),
(1003, '2026-04-01', 'Surendra Singh', 'NULL', 'DELHI', 0),
(1004, '2026-04-02', 'ANSHU KANT', '$12000.00', 'DUBAI', 0),
(1005, '2026-04-02', 'Anshu Kant', '$10.00', 'MUMBAI', 0),
(1006, '2026-04-03', 'Rahul Verma', '$45.00', 'PUNE', 0),
(1007, '2026-04-03', 'rahul verma', '$50.00', 'PUNE', 0),
(1008, '2026-04-03', 'Rahul verma ', '$20000.00', 'LONDON', 0),
(1009, '2026-04-04', 'Sanya Iyer', '$120.00', 'CHENNAI', 0),
(1010, '2026-04-04', 'SANYA IYER', 'NULL', 'CHENNAI', 0),
(1011, '2026-04-05', 'Amit Shah', '$300.00', 'AHMEDABAD', 0),
(1012, '2026-04-05', ' Amit Shah', '$300.00', 'AHMEDABAD', 0),
(1013, '2026-04-05', 'Amit Shah', '$300.00', 'AHMEDABAD', 0),
(1014, '2026-04-06', 'Surendra Singh', '$50.00', 'DELHI', 0),
(1015, '2026-04-06', 'SURENDRA SINGH', '$55.00', 'DELHI', 0),
(1016, '2026-04-06', 'Surendra Singh ', '$60.00', 'DELHI', 0),
(1017, '2026-04-07', 'Vikram Seth', '$9000.00', 'MUMBAI', 0),
(1018, '2026-04-07', 'vikram seth', '$8500.00', 'MUMBAI', 0),
(1019, '2026-04-08', 'Anshu Kant', '$1.00', 'MUMBAI', 0),
(1020, '2026-04-08', 'Anshu Kant', '$1.00', 'MUMBAI', 0),
(1021, '2026-04-08', 'Anshu Kant', '$1.00', 'MUMBAI', 0),
(1022, '2026-04-09', 'Sanya Iyer', '$4500.00', 'CHENNAI', 0),
(1023, '2026-04-09', 'Rahul Verma', '$15.00', 'PUNE', 0),
(1024, '2026-04-10', 'Amit Shah', '$50000.00', 'UNKNOWN', 0),
(1025, '2026-04-10', 'Surendra Singh', '$2.50', 'DELHI', 0);
DROP VIEW IF EXISTS RW_TRANSACTIONS;
-- creating a virtual cleaned transactions table and cleaning it
CREATE VIEW RW_TRANSACTIONS AS
SELECT 
    rowid AS internal_sequence, -- This "pulls" the hidden ID into your view
    tx_id,
    tx_date,
 -- removing any white spaces and making all the names similar case
    TRIM(UPPER(customer_name)) AS clean_name,
 -- replacing any $ symbol, nullRAW_TRANSACTIONS
    CAST(REPLACE(REPLACE(amount, '$', ''), 'NULL', '0') AS DECIMAL(10,2)) AS clean_amount,
    location
FROM RAW_TRANSACTIONS;
-- flagging any transaction which is suspicious by looking at the count of transactions
SELECT clean_name , 
	SUM(clean_amount) as total_spent, 
    tx_date,
	COUNT(*) as transaction_count
from RW_TRANSACTIONS
GROUP BY clean_name , tx_date
having transaction_count > 2
order by transaction_count DESC ;
-- we identified potential fraud and now we are finding their location
SELECT 
	tx_date,
    clean_name,
    location,
    SUM(clean_amount) AS total_amount
FROM RW_TRANSACTIONS
where clean_name in ('ANSHU KANT', 'AMIT SHAH')
GROUP BY clean_name , location
order by location;
