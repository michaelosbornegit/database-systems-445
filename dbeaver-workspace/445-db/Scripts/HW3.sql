-- 1. Write a SQL statement to show sku and Description for all products having a SKU description that includes the word ‘foot’.
SELECT SKU, SKU_Description
FROM SKU_DATA 
WHERE SKU_Description LIKE '%foot%';

--  2. Write a SQL statement to display the warehouse and a count of QuantityOnHand grouped by warehouse.
SELECT Warehouse, SUM(QuantityOnHand)
FROM INVENTORY
GROUP BY Warehouse;

-- 3. Write a SQL statement to show the SKU and SKU_Description for all items stored in a warehouse managed by each manager.
SELECT SKU_DATA.SKU, SKU_Description, WAREHOUSE.Warehouse, Manager
FROM WAREHOUSE, INVENTORY, SKU_DATA
GROUP BY Manager, SKU_DATA.SKU, Warehouse;

-- 4. Find out the total revenue collected by each store.
SELECT StoreNumber, SUM(OrderTotal) as TotalRevenue
FROM RETAIL_ORDER
GROUP BY StoreNumber;

-- 5. Which department is associated with the highest revenue?
SELECT Department
FROM RETAIL_ORDER, SKU_DATA
GROUP BY Department
HAVING SUM(OrderTotal) = ( 
    SELECT MAX(TotalRevenue) FROM ( 
        SELECT Department, SUM(OrderTotal) as TotalRevenue 
        FROM RETAIL_ORDER, SKU_DATA
        GROUP BY Department
    ) A
);

-- 6. Which department is associated with the lowest revenue?
SELECT Department
FROM RETAIL_ORDER, SKU_DATA
GROUP BY Department
HAVING SUM(OrderTotal) = ( 
    SELECT MIN(TotalRevenue) FROM ( 
        SELECT Department, SUM(OrderTotal) as TotalRevenue
        FROM RETAIL_ORDER, SKU_DATA
        GROUP BY Department
    ) A
);

-- checking above answers
-- SELECT Department, SUM(OrderTotal)
-- FROM ORDER_ITEM, SKU_DATA, RETAIL_ORDER
-- GROUP BY Department;

-- 7. Find out the storenumber and zipcode of the store that sold the maximum number of products.
SELECT StoreNumber, StoreZip
FROM ORDER_ITEM, RETAIL_ORDER
WHERE ORDER_ITEM.OrderNumber = RETAIL_ORDER.OrderNumber
GROUP BY StoreNumber, StoreZip
HAVING SUM(Quantity) = (
	SELECT MAX(ProductsSold) FROM (
		SELECT SUM(Quantity) as ProductsSold
		FROM ORDER_ITEM, RETAIL_ORDER
		WHERE ORDER_ITEM.OrderNumber = RETAIL_ORDER.OrderNumber
		GROUP BY StoreNumber, StoreZip
	) A
);

-- 8. Find out other warehouses whose average quantity on hand is not smaller than That of Atlanta warehouse.
SELECT INVENTORY.Warehouse
FROM WAREHOUSE, INVENTORY
GROUP BY INVENTORY.Warehouse
HAVING AVG(QuantityOnHand) >= (
	SELECT AVG(QuantityOnHand)
	FROM WAREHOUSE, INVENTORY
	WHERE INVENTORY.Warehouse = "Atlanta"
) AND INVENTORY.Warehouse != "Atlanta";

-- 9. List sku’s and descriptions for all products whose sku starts with a "2". Use the BETWEEN operator. You may assume all sku's have 6 digits.
SELECT SKU, SKU_Description
FROM SKU_DATA
WHERE SKU BETWEEN 200000 AND 299999;

-- 10. List the warehouses that currently have on average less than 225 items in stock of the products they carry. Use the HAVING operator.
SELECT WAREHOUSE
FROM INVENTORY
GROUP BY WAREHOUSE
HAVING AVG(QuantityOnHand) < 225;

-- 11. List all order items for products currently out of stock in Atlanta. Use a subquery.
SELECT OrderNumber, SKU, Quantity, Price, ExtendedPrice
FROM ORDER_ITEM
WHERE SKU IN (
	SELECT SKU
	FROM INVENTORY
	WHERE QuantityOnHand = 0 AND Warehouse = "Atlanta"
);

-- 12. Get a list of buyers and their departments for any products out of stock (at any warehouse, not all warehouses). Use a join. 
SELECT DISTINCT Buyer, Department
FROM INVENTORY
INNER JOIN SKU_DATA ON SKU_DATA.SKU = INVENTORY.SKU
WHERE QuantityOnHand = 0;

-- 13. Get a list of departments and the total items on order for each department, sorted from largest to smallest quantity. Use a join. 
SELECT Department, SUM(QuantityOnOrder) as OnOrder
FROM INVENTORY
INNER JOIN SKU_DATA ON SKU_DATA.SKU = INVENTORY.SKU
GROUP BY Department
ORDER BY OnOrder DESC;



-- SWITCHING TO PC MANUF DATABASE
USE pc_manufacturer;

-- 1. Find the model number and price of all products (of any type) made by maker B.
-- Relational Algebra: 
-- (pi Product.model, PC.price 
-- (sigma Product.maker = "B" 
-- (Product natural join
-- (pi model, price (PC) ∪ pi model, price (Laptop) ∪ pi model, price (Printer))
-- )))
SELECT Model, Price
FROM (
	SELECT Product.Model, Price, Maker
	FROM Product
	INNER JOIN PC ON PC.Model = Product.Model
	UNION
	SELECT Product.Model, Price, Maker
	FROM Product
	INNER JOIN Printer ON Printer.Model = Product.Model
	UNION
	SELECT Product.Model, Price, Maker
	FROM Product
	INNER JOIN Laptop ON Laptop.Model = Product.Model
) A
WHERE Maker = "B";

-- 2. Find those makers that sell laptops, not PCs.
-- (pi Product.maker 
-- sigma Product.type='laptop' (Product)) 
-- -
-- (pi Product.maker 
-- sigma Product.type='pc' (Product))
SELECT Maker
FROM Product
WHERE Maker IN (
	SELECT Maker
	FROM Product
	WHERE `Type` = "laptop"
	GROUP BY Maker
) AND Maker NOT IN (
	SELECT Maker
	FROM Product
	WHERE `Type` = "pc"
	GROUP BY Maker
)
GROUP BY Maker;

-- 3. Find those makers of at least two different computers.
-- pi maker (sigma count >= 2 (γ Product.maker; count(*)->count (sigma Product.type='laptop' or Product.type='pc' (Product))))
SELECT Maker
FROM (
	SELECT Maker, COUNT(*) as CNT
	FROM Product
	WHERE `Type` = "Laptop" OR `Type` = "pc"
	GROUP BY Maker
) A 
WHERE CNT >= 2;





