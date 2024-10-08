--What was the difference between the longest and shortest delivery times for all orders?

SELECT 
  MAX(CAST(REGEXP_REPLACE(duration, '[^0-9]', '', 'g') AS INTEGER)) -
  MIN(CAST(REGEXP_REPLACE(duration, '[^0-9]', '', 'g') AS INTEGER)) AS delivery_time_difference
FROM pizza_runner.runner_orders
WHERE duration != 'null';