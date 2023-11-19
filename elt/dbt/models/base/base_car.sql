with
source as (

    select * from {{ source('Gdrive','car_data') }}

),

renamed as (

    select
        "Year"          as year,
        "Model"         as model,
        "Make"          as maker,
        "Engine Type"   as engine_type,
        "Price"         as price
    from source

)

select * from renamed

