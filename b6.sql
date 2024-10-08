--What was the average speed for each runner for each delivery and do you notice any trend for these values?

SELECT 
  runner_id,
  order_id,
  ROUND(
    (CAST(REGEXP_REPLACE(distance, '[^0-9.]', '', 'g') AS NUMERIC) / 
     (CAST(REGEXP_REPLACE(duration, '[^0-9]', '', 'g') AS NUMERIC) / 60))::NUMERIC, 
    2
  ) AS avg_speed_km_per_hour
FROM pizza_runner.runner_orders
WHERE distance != 'null' AND duration != 'null'
ORDER BY runner_id, order_id;