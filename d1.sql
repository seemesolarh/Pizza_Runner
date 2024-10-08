--If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes - how much money has Pizza Runner made so far if there are no delivery fees?

SELECT 
  SUM(CASE 
    WHEN pn.pizza_name = 'Meatlovers' THEN 12
    WHEN pn.pizza_name = 'Vegetarian' THEN 10
    ELSE 0
  END) AS total_revenue
FROM pizza_runner.customer_orders co
JOIN pizza_runner.pizza_names pn ON co.pizza_id = pn.pizza_id
JOIN pizza_runner.runner_orders ro ON co.order_id = ro.order_id
WHERE ro.cancellation IS NULL OR ro.cancellation = '';