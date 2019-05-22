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
FROM
(
	SELECT Department, SUM(OrderTotal) as TotalRevenue
	FROM ORDER_ITEM, RETAIL_ORDER, SKU_DATA
	GROUP BY Department
	ORDER BY TotalRevenue DESC LIMIT 1
) A;

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
SELECT Warehouse, AVGQOH
FROM 
(
	SELECT INVENTORY.Warehouse, AVG(QuantityOnHand) as AVGQOH
	FROM INVENTORY, WAREHOUSE
	WHERE Warehouse != "Atlanta" AND AVGQOH > 
	(
		SELECT AVGQOH
		FROM A
		WHERE Warehouse = "Atlanta"
	)
	GROUP BY INVENTORY.Warehouse
) as A
;

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



