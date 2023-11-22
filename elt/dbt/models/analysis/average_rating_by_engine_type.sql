-- Q5: The average ratings of electric cars vs thermal cars
select
	engine_type,
	min(review_score) as min_rating,
	max(review_score) as max_rating,
	round(avg(m.review_score),2) average_rating
from {{ ref ('market') }} m
left join {{ ref ('car_specs') }} cs on m.car_id = cs.car_id
group by 1
