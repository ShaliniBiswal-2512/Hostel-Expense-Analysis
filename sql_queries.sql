USE hostel_db;
SHOW TABLES;
SELECT * FROM Expenses;
SELECT COUNT(*) AS total_entries
FROM expenses;

CREATE DATABASE hostel_expense_db;
USE hostel_expense_db;

CREATE TABLE expenses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    category VARCHAR(50),
    amount INT,
    payment_mode VARCHAR(20),
    description VARCHAR(100)
);

SELECT * FROM hostel_db.expenses;
SELECT date, COUNT(*)
FROM expenses
GROUP BY date
ORDER BY date;

SELECT SUM(amount) AS total_expense
FROM expenses;

SELECT
expense_type,
SUM(amount) AS total_spent
FROM expenses
GROUP BY expense_type
ORDER BY total_spent DESC;

SELECT
payment_mode,
COUNT(*) AS transactiions,
SUM(amount) AS total_amount
FROM expenses
GROUP BY payment_mode;