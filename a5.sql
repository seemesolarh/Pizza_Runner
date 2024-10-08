-- How many Vegetarian and Meatlovers were ordered by each customer?

SELECT c.customer_id,
       SUM(CASE WHEN p.pizza_name = 'Vegetarian' THEN 1 ELSE 0 END) AS vegetarian_count,
       SUM(CASE WHEN p.pizza_name = 'Meatlovers' THEN 1 ELSE 0 END) AS meatlovers_count
FROM 
     pizza_runner.customer_orders c
JOIN 
	pizza_runner.pizza_names p
	ON  
		c.pizza_id = p.pizza_id
GROUP BY 
		c.customer_id;
