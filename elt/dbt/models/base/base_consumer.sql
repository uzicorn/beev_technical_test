with
source as(

    select * from {{ source('Gdrive','consumer_data') }}

),

renamed as (

    select
        "Year"          as year,
        "Model"         as model,
        "Country"       as country,
        "Review Score"  as review_score,
        "Sales Volume"  as sales_volume
    from source

)

select * from renamed
