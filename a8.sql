--How many pizzas were delivered that had both exclusions and extras?

SELECT 
	COUNT(order_id) AS pizzas_with_both
FROM 
	pizza_runner.customer_orders
WHERE 
	exclusions IS NOT NULL AND extras IS NOT NULL;
