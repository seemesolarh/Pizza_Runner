--Using your newly generated table - can you join all of the information together to form a table which has the following information for successful deliveries?

SELECT 
  co.customer_id,
  co.order_id,
  ro.runner_id,
  rr.rating,
  co.order_time,
  ro.pickup_time,
  EXTRACT(EPOCH FROM (ro.pickup_time::TIMESTAMP - co.order_time::TIMESTAMP)) / 60 AS minutes_between_order_pickup,
  CAST(REGEXP_REPLACE(ro.duration, '[^0-9]', '', 'g') AS INTEGER) AS delivery_duration_minutes,
  ROUND(
    (CAST(REGEXP_REPLACE(ro.distance, '[^0-9.]', '', 'g') AS NUMERIC) / 
     (CAST(REGEXP_REPLACE(ro.duration, '[^0-9]', '', 'g') AS NUMERIC) / 60))::NUMERIC, 
    2
  ) AS avg_speed_km_per_hour,
  COUNT(co.pizza_id) AS total_pizzas
FROM pizza_runner.customer_orders co
JOIN  pizza_runner.runner_orders ro ON co.order_id = ro.order_id
LEFT JOIN  pizza_runner.runner_ratings rr ON co.order_id = rr.order_id
WHERE ro.cancellation IS NULL OR ro.cancellation = ''
GROUP BY 
  co.customer_id, co.order_id, ro.runner_id, rr.rating, 
  co.order_time, ro.pickup_time, ro.duration, ro.distance
ORDER BY co.order_id;