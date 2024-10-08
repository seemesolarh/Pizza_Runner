--Is there any relationship between the number of pizzas and how long the order takes to prepare?

WITH order_prep_time AS (
  SELECT 
    ro.order_id,
    COUNT(co.pizza_id) AS pizza_count,
    MAX(ro.pickup_time::TIMESTAMP) - MIN(co.order_time::TIMESTAMP) AS prep_time_interval
  FROM pizza_runner.runner_orders ro
  JOIN pizza_runner.customer_orders co ON ro.order_id = co.order_id
  WHERE ro.pickup_time != 'null'
  GROUP BY ro.order_id
)
SELECT 
  pizza_count,
  AVG(EXTRACT(EPOCH FROM prep_time_interval) / 60) AS avg_prep_time_minutes
FROM order_prep_time
GROUP BY pizza_count
ORDER BY pizza_count;
