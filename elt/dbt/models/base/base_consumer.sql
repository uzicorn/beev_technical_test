with
source as(

    select * from {{ source('Gdrive','consumer_data') }}

),

renamed as (

    select
        "Year"          as year,
        "Country"       as make,
        "Model"         as model,
        "index"         as country,
        "Review Score"::integer  as review_score,
        "Sales Volume"  as sales_volume
    from source

)

select * from renamed
