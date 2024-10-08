--How many runners signed up for each 1-week period (starting from 2021-01-01)?

SELECT DATE_TRUNC('week', registration_date) AS week, 
       COUNT(runner_id) AS runners_signed_up
FROM
	pizza_runner.runners
WHERE 
	 registration_date >= '2021-01-01'
GROUP BY 
		week
ORDER BY 
		week;
