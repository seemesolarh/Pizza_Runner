--data cleaning

UPDATE pizza_runner.runner_orders
SET pickup_time = NULL WHERE pickup_time = 'null';


CREATE TABLE pizza_runner.pizza_recipes_new AS
SELECT pizza_id, UNNEST(string_to_array(toppings, ',')) AS topping
FROM pizza_runner.pizza_recipes;
