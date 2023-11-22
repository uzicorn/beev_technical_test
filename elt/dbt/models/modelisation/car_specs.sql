select
    car_id,
    engine_type,
    price
from {{ ref('car') }}
left join {{ ref('base_car') }} on  car.year  = base_car.year
                                and car.make  = base_car.make
                                and car.model = base_car.model
