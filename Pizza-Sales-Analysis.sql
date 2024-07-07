# KPI

-- Total Revenue:
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales;

-- Average Order Value:
SELECT SUM(total_price) / COUNT(DISTINCT (order_id)) AS Average_Total_Value
FROM pizza_sales;

-- Total Pizza Sold:
SELECT SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales;

-- Total Orders:
SELECT COUNT(DISTINCT (order_id)) AS Total_Orders
FROM pizza_sales;

-- Average Pizza Per Order:
SELECT 
CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT(order_id)) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizza_Per_Order
FROM pizza_sales;

-- Daily Trends for Total Orders
--Convert order_date column’s data type to Datetime--
UPDATE pizza_sales
  SET order_date = STR_TO_DATE(order_date, "%d/%m/%Y");

SELECT DATE_FORMAT(order_date, "%W") AS Order_Day, 
    COUNT(DISTINCT order_id) AS Total_Orders
  FROM pizza_sales
GROUP BY DATE_FORMAT(order_date, "%W")
ORDER Total_Orders DESC;

-- Hourly Trend for Total Orders:
SELECT DATE_FORMAT (order_date, "%M") AS Month_Name, 
    COUNT(DISTINCT order_id) AS Total_Orders
  FROM pizza_sales
GROUP BY DATE_FORMAT (order_date, "%M")
ORDER BY Total_Orders DESC;

-- Percentage of Sales by Pizza Category:
SELECT  pizza_category,
		CAST(SUM(total_price) AS DECIMAL( 10,2) ) AS Total_sales,
		CAST(SUM(total_price) * 100 / (SELECT SUM(total_price)
					        FROM pizza_sales
     WHERE MONTH(order_date) = 1) AS DECIMAL (10,2)) AS Percentage_Total_Sales  
FROM pizza_sales
WHERE MONTH(order_date) = 1 
GROUP BY pizza_category;

-- Percentage of Sales by Pizza Size:
SELECT	pizza_size, 
		CAST(SUM(total_price) AS DECIMAL( 10,2) ) AS Total_sales,
		CAST(SUM(total_price) * 100 / (SELECT SUM(total_price)
						        FROM pizza_sales ) AS DECIMAL(10,2)) AS PTC

FROM pizza_sales
GROUP BY pizza_size
ORDER BY PTC DESC;

-- Total of Pizzas Sold by Category (per month):
SELECT	pizza_category, 
		CAST(SUM(quantity) AS DECIMAL(10,2)) AS Total_sales

FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category;

-- Top 5 Pizzas By Revenue:
SELECT  pizza_name,
		SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC       
LIMIT 5;

-- Bottom 5 Pizzas By Revenue:
SELECT  pizza_name,
		SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue       
LIMIT 5;

-- Top 5 Pizzas By Quantity:
SELECT  pizza_name,
		SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC       
LIMIT 5;

-- Bottom 5 Pizzas By Quantity:
SELECT  pizza_name,
		SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity      
LIMIT 5;

-- Top 5 Pizzas By Order:
SELECT  pizza_name,
		COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order DESC 
LIMIT 5;

-- Bottom 5 Pizzas By Order:
SELECT  pizza_name,
		COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order 
LIMIT 5;








