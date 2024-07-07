-- To change the queries results to Month, Quarter or Weekly filters
-- please apply it in WHERE clause. 

-- Here's some examples use can use:

SELECT pizza_category, SUM(total_price) AS Total_sales,
SUM(total_price) * 100 / (SELECT SUM(total_price) 
FROM pizza_sales 
WHERE MONTH(order_date) = 1
) AS Percentage_Total_Sale
   FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category;
    

-- Here:
MONTH(order_date) = 1 --indicates that the output is for the month of January--
MONTH(order_date) = 4 --is output is for the month of April--


SELECT pizza_category, SUM(total_price) AS Total_sales,
SUM(total_price) * 100 / (SELECT SUM(total_price) 
FROM pizza_sales 
WHERE QUARTER (order_date) = 1
) AS Percentage_Total_Sales
  FROM pizza_sales
WHERE QUARTER (order_date) = 1
GROUP BY pizza_category;
    
--Here:
QUARTER (order_date) = 1 --indicates that the output is for the Quarter 1--
QUARTER (order_date) = 4 --is output for the Quarter 4--

