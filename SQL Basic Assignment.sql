Create database company_db;

Use company_db;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE);
    
INSERT INTO employees VALUES
(101, 'Amit', 'Sharma', 'HR', 50000, '2020-01-15'),
(102, 'Riya', 'Kapoor', 'Sales', 75000, '2019-03-22'),
(103, 'Raj', 'Mehta', 'IT', 90000, '2018-07-11'),
(104, 'Neha', 'Verma', 'IT', 85000, '2021-09-01'),
(105, 'Arjun', 'Singh', 'Finance', 60000, '2022-02-10');

SELECT * FROM employees;

SELECT * FROM employees
ORDER BY salary ASC;

SELECT * FROM employees
ORDER BY department ASC, salary DESC;


SELECT * FROM employees
WHERE department = 'IT'
ORDER BY hire_date DESC;

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount INT,
    sale_date DATE);

INSERT INTO sales VALUES
(1, 'Aditi', 1500, '2024-08-01'),
(2, 'Rohan', 2200, '2024-08-03'),
(3, 'Aditi', 3500, '2024-09-05'),
(4, 'Meena', 2700, '2024-09-15'),
(5, 'Rohan', 4500, '2024-09-25');


select * from sales;

SELECT * FROM sales
ORDER BY amount DESC;


SELECT * FROM sales
WHERE customer_name = 'Aditi';


9. Difference Between Primary Key and Foreign Key
- Primary Key: Uniquely identifies each record in a table. Cannot be NULL.
- Foreign Key: Links one table to another by referencing the primary key of another table. Ensures referential integrity.
10. What Are Constraints in SQL?
- Constraints are rules applied to columns to enforce data integrity.
- Examples: PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE, CHECK, DEFAULT.
- They prevent invalid data entry and maintain consistency.








