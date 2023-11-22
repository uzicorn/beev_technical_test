-- consumer_cata has model duplicate for each make, we chose the [make & model] relation from car_data as truth-base
select
    c.car_id,
    bc.country,
    bc.review_score,
    bc.sales_volume
from {{ ref('car') }} c
left join {{ ref('base_consumer') }} bc on  c.year  = bc.year
                                        and c.make  = bc.make
                                        and c.model = bc.model
