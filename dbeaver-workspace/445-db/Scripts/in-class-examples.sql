-- 1. Get all data for products whose description contains ‘Tent’.
select * from SKU_DATA where SKU_Description LIKE '%Tent%';

-- 2. Get all data for products purchased by someone whose name starts with “Pete”.
select * from SKU_DATA where Buyer LIKE 'Pete%';

-- 3. Get all data for products whose sku has a "2" in the third last position.
select * from SKU_DATA where sku LIKE '%2__';

-- 4.Get all data for order items whose extended price is between $100 and $200.
select * from ORDER_ITEM where extendedprice between 100 and 200;
-- or
select * from ORDER_ITEM where extendedprice >= 100 and extendedprice <= 200;

-- 5. Get all data for products purchased by someone other than Nancy Meyers, Cindy Lo, or Jerry Martin.
-- Write in two different ways.
select * from SKU_DATA
where buyer != 'Nancy Meyers' AND Buyer != 'Cindy Lo' AND Buyer != 'Jerry Martin';

select * from SKU_DATA
where buyer <> 'Nancy Meyers' AND Buyer <> 'Cindy Lo' AND Buyer <> 'Jerry Martin';

-- 6.Get all data for order items and display them by descending price.  Order items with the same price should be sorted by ascending order number.
select *
from ORDER_ITEM
ORDER BY Price DESC, OrderNumber;

-- 7. Select sum, minimum, maximum, and average extended price from order_item. Rename column extended price to "Output".
select SUM(ExtendedPrice) AS Sum, AVG(ExtendedPrice) AS Average
FROM ORDER_ITEM

-- 8. How many departments are there in SKU_DATA?
select count(DISTINCT Department)
FROM SKU_DATA

-- 9. List each buyer and the number of products they are responsible for purchasing
select count(SKU) AS NumOfItems, Buyer
from SKU_DATA
group by BUYER

-- 10.List each buyer, their department, and the number of products they are responsible for purchasing.
select count(SKU) AS NumOfItems, Buyer, department
from SKU_DATA
group by BUYER, department;

-- 11 List each department and the number of products, except for the SKU number '302000'.
select Department, COUNT(SKU)
from SKU_DATA
where SKU <> 302000
GROUP BY Department;

-- 12.List each department and the number of products, except for the SKU number '302000', as well as, omit the department which sells only one product.
select Department, count(sku)
from SKU_DATA
where SKU<>302000
group by Department
having count(sku) > 1;

