-- generate random id for the each car object [year, make, model]
-- Postgres doc : The PostgreSQL MD5() function calculates the MD5 hash of a string and returns the result in hexadecimal.
select distinct
    left(md5(random()::text),8) car_id,
    year,
    make,
    model
from {{ ref ('base_car') }}

