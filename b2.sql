--What was the average time in minutes it took for each runner to arrive at Pizza Runner HQ to pick up the order?

SELECT 
  runner_id,
  AVG(EXTRACT(EPOCH FROM (pickup_time::TIMESTAMP - order_time::TIMESTAMP)) / 60) AS avg_pickup_time_minutes
FROM pizza_runner.runner_orders ro
JOIN pizza_runner.customer_orders co ON ro.order_id = co.order_id
WHERE pickup_time != 'null'
GROUP BY runner_id;

