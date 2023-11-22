-- consumer_cata has model duplicate for each make, the truth-base for [make & model] is taken from the car_data
select
    c.car_id,
    bc.country,
    bc.review_score,
    bc.sales_volume
from {{ ref('car') }} c
left join {{ ref('base_consumer') }} bc on  c.year  = bc.year
                                        and c.make  = bc.make
                                        and c.model = bc.model
