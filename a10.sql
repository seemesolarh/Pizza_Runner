--What was the volume of orders for each day of the week?

SELECT 
  	EXTRACT(DOW FROM order_time) AS day_of_week, COUNT(order_id) AS orders_per_day
FROM 
	pizza_runner.customer_orders
GROUP BY 
		EXTRACT(DOW FROM order_time)
ORDER BY 
		day_of_week;
