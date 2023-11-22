-- fails if there is more than two engine_type per car_id
with count_EngineType_per_CarId as (
	select
		car_id,
		engine_type,
		count (engine_type) as count_EngineType_per_CarId
	from analytics.car_specs
	group by 1,2
)
select * from count_EngineType_per_CarId where count_EngineType_per_CarId > 2
