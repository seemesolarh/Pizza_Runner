--What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?

WITH ingredients AS (
  SELECT 
    co.order_id,
    pr.topping AS topping_id,
    CASE 
      WHEN pr.topping = ANY(string_to_array(COALESCE(co.extras, ''), ', ')) THEN 2
      ELSE 1
    END AS quantity
  FROM pizza_runner.customer_orders co
  JOIN pizza_runner.pizza_recipes_new pr ON co.pizza_id = pr.pizza_id
  JOIN pizza_runner.runner_orders ro ON co.order_id = ro.order_id
  WHERE ro.cancellation IS NULL OR ro.cancellation = ''
)
SELECT 
  pt.topping_name,
  SUM(i.quantity) AS total_quantity
FROM ingredients i
JOIN pizza_runner.pizza_toppings pt ON CAST(i.topping_id AS INTEGER) = pt.topping_id
GROUP BY pt.topping_name
ORDER BY total_quantity DESC;