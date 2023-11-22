-- Bonus question: The Amount of electric vs thermal cars sold per year.
-- "amount" was understood as sales_volume
-- work in progress
with sales_volume_by_car as (
    select
        c.year,
        m.car_id,
        cs.engine_type,

        sum(m.sales_volume) as sales_volume
    from {{ ref ('market') }} m
    left join {{ ref ('car_specs') }} cs on m.car_id = cs.car_id
    join {{ ref ('car') }} c  on m.car_id = c.car_id
    group by 1, 2, 3)

select * from sales_volume_by_car
