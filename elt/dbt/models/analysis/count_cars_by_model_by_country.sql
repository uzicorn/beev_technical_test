select
	c.model,
	m.country,

	count(m.car_id) count_cars_by_model_by_country

from analytics.market m
left join analytics.car c on m.car_id = c.car_id
group by 1, 2
