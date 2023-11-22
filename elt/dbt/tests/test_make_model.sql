-- fails if there is more than 1 make per model
with distinct_make_per_model as (
	select
		model,
		count(distinct make) count_distinct_make_per_model
	from analytics.car c
	group by 1)

select * from distinct_make_per_model where count_distinct_make_per_model > 1
