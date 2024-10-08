--What was the average distance travelled for each customer?

SELECT 
  co.customer_id,
  AVG(CAST(REGEXP_REPLACE(ro.distance, '[^0-9.]', '', 'g') AS NUMERIC)) AS avg_distance
FROM pizza_runner.customer_orders co
JOIN pizza_runner.runner_orders ro ON co.order_id = ro.order_id
WHERE ro.distance !=  'null'
GROUP BY co.customer_id;