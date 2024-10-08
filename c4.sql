--Generate an order item for each record in the customers_orders table

SELECT 
  co.order_id,
  co.pizza_id,
  CONCAT(
    pn.pizza_name,
    CASE 
      WHEN co.exclusions IS NOT NULL AND co.exclusions != '' AND co.exclusions != 'null' THEN 
        CONCAT(' - Exclude ', 
               (SELECT STRING_AGG(pt.topping_name, ', ')
                FROM UNNEST(string_to_array(REPLACE(co.exclusions, 'null', ''), ', ')) AS e(topping_id)
                JOIN pizza_runner.pizza_toppings pt ON CAST(e.topping_id AS INTEGER) = pt.topping_id
                WHERE e.topping_id != ''))
      ELSE ''
    END,
    CASE 
      WHEN co.extras IS NOT NULL AND co.extras != '' AND co.extras != 'null' THEN 
        CONCAT(' - Extra ', 
               (SELECT STRING_AGG(pt.topping_name, ', ')
                FROM UNNEST(string_to_array(REPLACE(co.extras, 'null', ''), ', ')) AS e(topping_id)
                JOIN pizza_runner.pizza_toppings pt ON CAST(e.topping_id AS INTEGER) = pt.topping_id
                WHERE e.topping_id != ''))
      ELSE ''
    END
  ) AS order_item
FROM pizza_runner.customer_orders co
JOIN pizza_runner.pizza_names pn ON co.pizza_id = pn.pizza_id;