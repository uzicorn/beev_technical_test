-- Q2: Which country has the most of each model.
-- same assumption as the previous question.
with intermediate as(
		select
		    model,
		   	max(sales_volume_by_model_by_country) max_sales_volume_by_model
		from {{ ref('sales_volume_by_model_by_country') }}
		group by 1
	)

select
	sales_volume.model,
	sales_volume.country as best_seller_country,
	sales_volume.sales_volume_by_model_by_country as sales_volume
from {{ ref('sales_volume_by_model_by_country') }} sales_volume
join intermediate on  sales_volume.model = intermediate.model
				  and sales_volume.sales_volume_by_model_by_country = intermediate.max_sales_volume_by_model
