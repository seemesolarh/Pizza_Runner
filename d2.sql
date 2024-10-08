--What if there was an additional $1 charge for any pizza extras? Add cheese is $1 extra

SELECT 
  SUM(
    CASE 
      WHEN pn.pizza_name = 'Meatlovers' THEN 12
      WHEN pn.pizza_name = 'Vegetarian' THEN 10
      ELSE 0
    END +
    CASE 
      WHEN co.extras IS NOT NULL AND co.extras != '' 
      THEN CARDINALITY(string_to_array(co.extras, ', '))
      ELSE 0
    END
  ) AS total_revenue
FROM pizza_runner.customer_orders co
JOIN pizza_runner.pizza_names pn ON co.pizza_id = pn.pizza_id
JOIN pizza_runner.runner_orders ro ON co.order_id = ro.order_id
WHERE ro.cancellation IS NULL OR ro.cancellation = '';