--What are the standard ingredients for each pizza?

SELECT 
  pn.pizza_name,
  STRING_AGG(pt.topping_name, ', ' ORDER BY pt.topping_name) AS standard_ingredients
FROM pizza_runner.pizza_names pn
JOIN pizza_runner.pizza_recipes pr ON pn.pizza_id = pr.pizza_id
CROSS JOIN LATERAL unnest(string_to_array(pr.toppings, ', ')) AS t(topping_id)
JOIN pizza_runner.pizza_toppings pt ON CAST(t.topping_id AS INTEGER) = pt.topping_id
GROUP BY pn.pizza_name;