-- Bottom 5 Pizzas By Revenue:
SELECT  pizza_name,
		SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue       
LIMIT 5;

-- Bottom 5 Pizzas By Quantity:
SELECT  pizza_name,
		SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity      
LIMIT 5;

-- Bottom 5 Pizzas By Order:
SELECT  pizza_name,
		COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order 
LIMIT 5;
