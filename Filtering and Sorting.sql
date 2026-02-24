create database Filtering;

use Filtering;

CREATE TABLE employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    City VARCHAR(50),
    Salary INT,
    HireDate DATE);

INSERT INTO employees VALUES
(101, 'Rahul Mehta', 'Sales', 'Delhi', 55000, '2020-04-12'),
(102, 'Priya Sharma', 'HR', 'Mumbai', 62000, '2019-09-25'),
(103, 'Aman Singh', 'IT', 'Bengaluru', 72000, '2021-03-10'),
(104, 'Neha Patel', 'Sales', 'Delhi', 48000, '2022-01-14'),
(105, 'Karan Joshi', 'Marketing', 'Pune', 45000, '2018-07-22'),
(106, 'Divya Nair', 'IT', 'Chennai', 81000, '2019-12-11'),
(107, 'Raj Kumar', 'HR', 'Delhi', 60000, '2020-05-28'),
(108, 'Simran Kaur', 'Finance', 'Mumbai', 58000, '2021-08-03'),
(109, 'Arjun Reddy', 'IT', 'Hyderabad', 70000, '2022-02-18'),
(110, 'Anjali Das', 'Sales', 'Kolkata', 51000, '2023-01-15');



select * from employees;


SELECT * FROM employees
WHERE Department IN ('IT', 'HR');


SELECT * FROM employees
WHERE Department IN ('Sales', 'IT', 'Finance');


SELECT * FROM employees
WHERE Salary BETWEEN 50000 AND 70000;


SELECT * FROM employees
WHERE EmpName LIKE 'A%';

SELECT * FROM employees
Where EmpName LIKE '%an%';

SELECT * FROM Employees
WHERE City IN ('Delhi', 'Mumbai')
AND Salary > 55000;

SELECT * FROM Employees
WHERE Department <> 'HR';

SELECT * FROM Employees
WHERE YEAR(HireDate) BETWEEN 2019 AND 2022
ORDER BY HireDate ASC;







