-- fails if there is more than one price per car_id
with count_price_per_CarId as (
	select
		car_id,
		price,
		count (price) as count_price_per_CarId
	from analytics.car_specs
	group by 1,2
)
select * from count_price_per_CarId where count_price_per_CarId >1
