-- how would i design an additional table called runner_ratings for this new dataset
-- Create the table
CREATE TABLE pizza_runner.runner_ratings (
  order_id INTEGER PRIMARY KEY,
  rating INTEGER CHECK (rating BETWEEN 1 AND 5),
  rating_time TIMESTAMP,
  comments TEXT
);

INSERT INTO pizza_runner.runner_ratings (order_id, rating, rating_time, comments)
VALUES 
  (1, 5, '2021-01-01 19:35:34', 'Excellent service!'),
  (2, 4, '2021-01-01 20:03:04', 'Food was great, delivery a bit slow'),
  (3, 5, '2021-01-03 01:23:14', 'Perfect!'),
  (4, 3, '2021-01-04 14:35:48', 'Pizza was cold'),
  (5, 4, '2021-01-08 22:15:34', 'Good service'),
  (7, 5, '2021-01-08 22:55:11', 'Delicious and quick delivery'),
  (8, 4, '2021-01-10 00:45:23', 'Tasty pizza, friendly runner')
ON CONFLICT (order_id) DO NOTHING;







