--If a Meat Lovers pizza was $12 and Vegetarian $10 fixed prices with no cost for extras and each runner is paid $0.30 per kilometre traveled - how much money does Pizza Runner have left over after these deliveries?

WITH pizza_revenue AS (
  SELECT 
    SUM(CASE 
      WHEN pn.pizza_name = 'Meatlovers' THEN 12
      WHEN pn.pizza_name = 'Vegetarian' THEN 10
      ELSE 0
    END) AS total_revenue
  FROM pizza_runner.customer_orders co
  JOIN pizza_runner.pizza_names pn ON co.pizza_id = pn.pizza_id
  JOIN pizza_runner.runner_orders ro ON co.order_id = ro.order_id
  WHERE ro.cancellation IS NULL OR ro.cancellation = ''
),
runner_payments AS (
  SELECT 
    SUM(CAST(REGEXP_REPLACE(distance, '[^0-9.]', '', 'g') AS NUMERIC) * 0.30) AS total_runner_payment
  FROM pizza_runner.runner_orders
  WHERE cancellation IS NULL OR cancellation = ''
)
SELECT 
  total_revenue, 
  total_runner_payment,
  total_revenue - total_runner_payment AS profit
FROM pizza_revenue, runner_payments;