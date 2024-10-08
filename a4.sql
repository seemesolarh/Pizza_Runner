--How many of each type of pizza was delivered?

SELECT 
      pizza_id, COUNT(order_id) AS pizzas_delivered
FROM 
       pizza_runner.customer_orders
GROUP BY 
       pizza_id;
