-- What was the maximum number of pizzas delivered in a single order?

SELECT
	MAX(pizza_count) AS max_pizzas
FROM (
    SELECT order_id, COUNT(pizza_id) AS pizza_count
    FROM pizza_runner.customer_orders
    GROUP BY order_id
) AS order_pizza_count;
