CREATE DATABASE Coffee_chain

SELECT *
FROM Coffee_chain.dbo.Coffee_products

-----------------------------------------------------------------------------------------------------------------

-- Standardise date formatt

UPDATE Coffee_chain.dbo.Coffee_products
SET Date = CONVERT(date, Date)

ALTER table Coffee_chain.dbo.Coffee_products
ADD saledate Date;

UPDATE Coffee_chain.dbo.Coffee_products
SET saledate = CONVERT(date, Date)

SELECT saledate, product
from Coffee_chain.dbo.Coffee_products

-- Looking at state wise product sale

SELECT state, sum(sales) AS total_sales
FROM Coffee_chain.dbo.Coffee_products
Group by state
order by total_sales desc
-- state wise sales of tea only
SELECT state, sum(sales) AS total_sales
FROM Coffee_chain.dbo.Coffee_products
WHERE product like '%tea%'
Group by state
order by total_sales desc


-- Total Inventory product type wise

SELECT [Product type], product, SUM(Inventory) AS total_inventory
FROM Coffee_chain.dbo.Coffee_products
GROUP BY [Product Type], product
ORDER BY total_inventory desc


-- Getting products that have inventory over 250000
SELECT [Product type], product, SUM(Inventory) AS total_inventory
FROM Coffee_chain.dbo.Coffee_products
GROUP BY [Product Type], product
HAVING SUM(Inventory) > 250000
ORDER BY total_inventory desc

-- Looking at territory wise profit

SELECT territory, product, SUM(PROFIT) AS total_profit
FROM Coffee_chain.dbo.Coffee_products
GROUP BY Territory, Product
ORDER BY total_profit desc

-- finding out which products made less than $3000 profit

SELECT territory, product, [product type], SUM(PROFIT) AS total_profit
FROM Coffee_chain.dbo.Coffee_products
GROUP BY Territory, Product, [Product Type]
HAVING SUM(PROFIT) < 3000
ORDER BY total_profit

-- We found out that 2 of the coffee products, 1 Espresso, 1 Herbal Tea and 1 Tea Made loss
-- in the East and West territory respectively

SELECT [Product Line], product, [product type], Profit
FROM Coffee_chain.dbo.Coffee_products
WHERE profit > 500
ORDER BY Profit DESC

-- this data shows that mostly coffee products are the ones that made profit more than $500 individually











