--How many pizzas were ordered?

SELECT 
     COUNT(order_id) AS total_pizzas_ordered
FROM 
     pizza_runner.customer_orders;
