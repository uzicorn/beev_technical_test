-- Q4: how much the average car costs in every country by engine type.
-- The price is linked to the car, so each car in our data model has the same price per country.
select
	engine_type,
	count(car_id) as sample_car_count,
	concat(round(sum(price)), ' €') as sum_total_price,
	concat(round(avg(price)),' €') average_price
from {{ ref ('car_specs') }} cs
group by 1
