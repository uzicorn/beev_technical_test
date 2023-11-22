-- Q1: Total number of cars by model by country
-- i assumed the question was about the sales volume as the actual 'number' of cars by country is the same for all three countries
select
	c.model,
	m.country,

	sum(m.sales_volume) sales_volume_by_model_by_country

from {{ ref ('market') }} m
left join {{ ref ('car') }} c on m.car_id = c.car_id
group by 1, 2
order by model, sales_volume_by_model_by_country desc
