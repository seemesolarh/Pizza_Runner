--What was the total volume of pizzas ordered for each hour of the day?

SELECT
	EXTRACT(HOUR FROM order_time) AS hour, COUNT(order_id) AS pizzas_per_hour
FROM 
	pizza_runner.customer_orders
GROUP BY 
		EXTRACT(HOUR FROM order_time)
ORDER BY 
		hour;
