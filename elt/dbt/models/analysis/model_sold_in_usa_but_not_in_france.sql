-- Q3: Models sold in the USA but not in france
select model from {{ ref('sales_volume_by_model_by_country') }}
where country = 'USA'
except
select model from {{ ref('sales_volume_by_model_by_country') }}
where country = 'France'
