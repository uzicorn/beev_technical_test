-- generate random id for the each car object [year, make, model]
select distinct
    left(md5(random()::text),8) car_id,
    year,
    make,
    model
from {{ ref ('base_car') }}

