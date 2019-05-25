-- 1. Write a SQL statement to show sku and Description for all products having a SKU description that includes the word ‘foot’.
SELECT SKU, SKU_Description
FROM SKU_DATA 
WHERE SKU_Description LIKE '%foot%';

--  2. Write a SQL statement to display the warehouse and a count of QuantityOnHand grouped by warehouse.
SELECT Warehouse, SUM(QuantityOnHand)
FROM INVENTORY
GROUP BY Warehouse;

-- 3. Write a SQL statement to show the SKU and SKU_Description for all items stored in a warehouse managed by each manager.
SELECT Manager, SKU_DATA.SKU, SKU_Description
FROM WAREHOUSE, INVENTORY, SKU_DATA
GROUP BY Manager, SKU_DATA.SKU;

-- 4. Find out the total revenue collected by each store.
SELECT StoreNumber, SUM(OrderTotal) as TotalRevenue
FROM RETAIL_ORDER
GROUP BY StoreNumber;

-- 5. Which department is associated with the highest revenue?
SELECT Department
FROM RETAIL_ORDER, SKU_DATA
GROUP BY Department
HAVING SUM(OrderTotal) = ( 
    SELECT MIN(TotalRev) FROM ( 
        SELECT Department, SUM(OrderTotal) as TotalRev 
        FROM RETAIL_ORDER, SKU_DATA
        GROUP BY Department
    ) A
);

-- 6. Which department is associated with the lowest revenue?
SELECT Department
FROM
(
	SELECT Department, SUM(OrderTotal) as TotalRevenue
	FROM ORDER_ITEM, RETAIL_ORDER, SKU_DATA
	GROUP BY Department
	ORDER BY TotalRevenue ASC LIMIT 1
) A;

-- checking above answers
SELECT Department, SUM(OrderTotal)
FROM ORDER_ITEM, SKU_DATA, RETAIL_ORDER
GROUP BY Department;

-- 7. Find out the storenumber and zipcode of the store that sold the maximum number of products.
SELECT StoreNumber, StoreZip
FROM
(
	SELECT StoreNumber, StoreZip, SUM(Quantity) as TotalQuantity
	FROM ORDER_ITEM, RETAIL_ORDER
	GROUP BY StoreNumber, StoreZip
	ORDER BY TotalQuantity DESC LIMIT 1
) A;

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
)

-- 12. Get a list of buyers and their departments for any products out of stock (at any warehouse, not all warehouses). Use a join. 
SELECT Buyer, Department
FROM INVENTORY
INNER JOIN SKU_DATA ON SKU_DATA.SKU = INVENTORY.SKU
WHERE QuantityOnHand = 0

-- 13. Get a list of departments and the total items on order for each department, sorted from largest to smallest quantity. Use a join. 
SELECT Department, SUM(QuantityOnOrder) as OnOrder
FROM INVENTORY
INNER JOIN SKU_DATA ON SKU_DATA.SKU = INVENTORY.SKU
GROUP BY Department
ORDER BY OnOrder DESC





select * from INVENTORY order by Warehouse


SELECT * FROM ORDER_ITEM, SKU_DATA, RETAIL_ORDER;

SELECT Department
FROM
(
	SELECT Department, SUM(OrderTotal) as TotalRevenue
	FROM ORDER_ITEM, RETAIL_ORDER, SKU_DATA
	GROUP BY Department
) a GROUP BY Department
having TotalRevenue = MAX(TotalRevenue);

SELECT Department
FROM ORDER_ITEM, RETAIL_ORDER, SKU_DATA
WHERE OrderTotal IN
(
		SELECT OrderTotal
		FROM RETAIL_ORDER
		GROUP BY StoreNumber
);



