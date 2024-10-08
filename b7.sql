--What is the successful delivery percentage for each runner?

SELECT 
  runner_id,
  COUNT(*) AS total_orders,
  SUM(CASE WHEN cancellation IS NULL OR cancellation = '' THEN 1 ELSE 0 END) AS successful_orders,
  ROUND(100.0 * SUM(CASE WHEN cancellation IS NULL OR cancellation = '' THEN 1 ELSE 0 END) / COUNT(*), 2) AS success_percentage
FROM pizza_runner.runner_orders
GROUP BY runner_id
ORDER BY runner_id;