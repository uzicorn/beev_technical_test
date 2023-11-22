-- Bonus question: The Amount of electric vs thermal cars sold per year.
-- "amount" was understood as sales_volume
-- work in progress

select
    c.year,
    cs.engine_type,

    sum(m.sales_volume) as sales_volume_per_year_per_engine_type
from {{ ref ('market') }} m
left join {{ ref ('car_specs') }} cs on m.car_id = cs.car_id
join {{ ref ('car') }} c  on m.car_id = c.car_id
group by 1, 2

