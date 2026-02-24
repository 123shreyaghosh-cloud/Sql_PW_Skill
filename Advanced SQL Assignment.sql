Create database  Advance;
Use Advance;

## Q1. What is a Common Table Expression (CTE), and how does it improve SQL query readability?
## 1. A CTE is a temporary result set defined within the execution scope of a single SQL statement using the WITH clause.
# - Improves readability: Breaks complex queries into smaller, logical parts.
# - Reusability: Can reference the CTE multiple times in the same query.
# - Example:
WITH ProductRevenue AS (
    SELECT ProductID, Price * Quantity AS Revenue
    FROM Sales s
    JOIN Products p ON s.ProductID = p.ProductID
)
SELECT * FROM ProductRevenue WHERE Revenue > 3000;

## Q2. Why are some views updatable while others are read-only? Explain with an example.
## 2. - Updatable views: Based on a single table without aggregates, joins, or groupings.
#- Read-only views: Contain joins, aggregates, or computed columns.
# - Example:
-- Updatable view
CREATE VIEW vw_Product AS
SELECT ProductID, ProductName, Price
FROM Products;

-- Read-only view
CREATE VIEW vw_Summary AS
SELECT Category, AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category;

## Q3. What advantages do stored procedures offer compared to writing raw SQL queries repeatedly?
## 3. - Code reusability: Encapsulates logic once, reused many times.
# - Performance: Precompiled and cached execution plans.
# - Security: Controls access and prevents SQL injection.
# - Maintainability: Easier to update logic in one place.
 
## Q4. What is the purpose of triggers in a database? Mention one use case where a trigger is essential.
## 4. Triggers are special procedures that automatically execute in response to specific events (INSERT, UPDATE, DELETE).
# - Use case: Auditing deletions. For example, archiving deleted rows into a history table.

## Q5. Explain the need for data modelling and normalization when designing a database.
## 5. - Data modelling: Structures data logically to represent real-world entities.
# - Normalization: Eliminates redundancy and ensures data integrity.
# - Example: Splitting customer details into separate tables (Customers, Orders) avoids duplication.

create table products (ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2));

## Insert sample data
INSERT INTO Products VALUES
(1, 'Keyboard', 'Electronics', 1200),
(2, 'Mouse', 'Electronics', 800),
(3, 'Chair', 'Furniture', 2500),
(4, 'Desk', 'Furniture', 5500);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID));

## Insert sample sales data
INSERT INTO Sales VALUES
(1, 1, 4, '2024-01-05'),
(2, 2, 10, '2024-01-06'),
(3, 3, 2, '2024-01-10'),
(4, 4, 1, '2024-01-11');

## Q6. Write a CTE to calculate the total revenue for each product  (Revenues = Price × Quantity), and return only products where  revenue > 3000.

WITH RevenueCTE AS (
    SELECT p.ProductID, p.ProductName, SUM(p.Price * s.Quantity) AS TotalRevenue
    FROM Products p
    JOIN Sales s ON p.ProductID = s.ProductID
    GROUP BY p.ProductID, p.ProductName
)
SELECT * FROM RevenueCTE WHERE TotalRevenue > 3000;

## Q7. Create a view named that shows:  Category, TotalProducts, AveragePrice.

CREATE VIEW vw_CategorySummary AS
SELECT Category,
       COUNT(*) AS TotalProducts,
       AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;

## Q8. Create an updatable view containing ProductID, ProductName, and Price. Then update the price of ProductID = 1 using the view.
 
CREATE VIEW vw_ProductPrice AS
SELECT ProductID, ProductName, Price
FROM Products;

## Update price using the view
UPDATE vw_ProductPrice
SET Price = 1300
WHERE ProductID = 1;

## Q9. Create a stored procedure that accepts a category name and returns all products belonging to that category.

Delimiter //

CREATE PROCEDURE GetProductsByCategory (CategoryName VARCHAR(50))
BEGIN
    SELECT ProductID, ProductName, Price
    FROM Products
    WHERE Category = CategoryName;
END//

Delimiter ;
call GetProductsByCategory("4");

## Q10. Create an AFTER DELETE trigger on the 'Product' table that archives deleted product rows into a new
#table 'ProductArchive' . The archive should store ProductID, ProductName, Category, Price, and DeletedAt
#timestamp.


CREATE TABLE ProductArchive (
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    DeletedAt DATETIME);

Delimiter //

CREATE TRIGGER AfterDeleteProducts AFTER DELETE on Products For each row
BEGIN
    INSERT INTO ProductArchive (ProductID, ProductName, Category, Price, DeletedAt)
    SELECT ProductID, ProductName, Category, Price, GETDATE()
    FROM deleted;
END// 

Delimiter ;
 
 Call AfterDeleteProducts("");