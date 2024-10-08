-- For each customer, how many delivered pizzas had at least 1 change and how many had no changes?

SELECT customer_id,
       SUM(CASE WHEN exclusions IS NOT NULL OR extras IS NOT NULL THEN 1 ELSE 0 END) AS pizzas_with_changes,
       SUM(CASE WHEN exclusions IS NULL AND extras IS NULL THEN 1 ELSE 0 END) AS pizzas_no_changes
FROM pizza_runner.customer_orders
GROUP BY customer_id;
