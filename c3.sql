--What was the most common exclusion?

WITH exclusions_expanded AS (
  SELECT 
    UNNEST(string_to_array(COALESCE(exclusions, ''), ', ')) AS exclusion_id
  FROM pizza_runner.customer_orders
  WHERE exclusions IS NOT NULL AND exclusions != '' AND exclusions != 'null'
)
SELECT 
  pt.topping_name,
  COUNT(*) AS exclusion_count
FROM exclusions_expanded ee
JOIN pizza_runner.pizza_toppings pt ON CAST(ee.exclusion_id AS INTEGER) = pt.topping_id
GROUP BY pt.topping_name
ORDER BY exclusion_count DESC
LIMIT 1;