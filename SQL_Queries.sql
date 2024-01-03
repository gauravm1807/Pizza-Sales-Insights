create database PizzaData;
use PizzaData;

select * from pizza_sales;

select ROUND(SUM(total_price),2) AS Total_Revenue FROM pizza_sales;


SELECT ROUND(SUM(total_price)/COUNT(DISTINCT order_id),2) AS Avg_Order_Value FROM pizza_sales;

SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

SELECT ROUND(SUM(quantity)/COUNT(DISTINCT order_id),2) AS Avg_Pizzas_Per_Order FROM pizza_sales;


SET SQL_SAFE_UPDATES = 0;

UPDATE pizza_sales
SET order_date = CONCAT(SUBSTRING(order_date,7,4),'-',SUBSTRING(order_date,4,2),'-',SUBSTRING(order_date,1,2));

SELECT DAYNAME(order_date) AS Order_Day, COUNT(DISTINCT order_id) as Total_orders FROM pizza_sales GROUP BY DAYNAME(order_date);

SELECT MONTHNAME(order_date) AS Order_Month, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales GROUP BY MONTHNAME(order_date);

SELECT pizza_category,ROUND(SUM(total_price),2) , ROUND(SUM(total_price)*100/(select sum(total_price) FROM pizza_sales),2) AS PCT FROM pizza_sales GROUP BY pizza_category;

SELECT pizza_size, ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales),2) as PCT FROM pizza_sales GROUP BY pizza_size ORDER BY PCT DESC;

SELECT pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Revenue DESC LIMIT 5;

SELECT pizza_name, ROUND(SUM(total_price),2) AS Total_Revenue FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Revenue LIMIT 5;

SELECT pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Quantity DESC LIMIT 5;

SELECT pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Quantity LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Orders DESC LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales GROUP BY pizza_name ORDER BY Total_Orders LIMIT 5;