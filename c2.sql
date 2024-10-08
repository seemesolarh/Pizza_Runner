--What was the most commonly added extra?

WITH extras_expanded AS (
  SELECT 
    UNNEST(string_to_array(REPLACE(COALESCE(extras, ''), 'null', ''), ', ')) AS extra_id
  FROM pizza_runner.customer_orders
  WHERE extras IS NOT NULL AND extras != '' AND extras != 'null'
)
SELECT 
  pt.topping_name,
  COUNT(*) AS extra_count
FROM extras_expanded ee
JOIN pizza_runner.pizza_toppings pt ON CAST(ee.extra_id AS INTEGER) = pt.topping_id
WHERE ee.extra_id != ''
GROUP BY pt.topping_name
ORDER BY extra_count DESC
LIMIT 1;