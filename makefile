start:
	docker compose -f docker-compose.yml up -d postgres
stop:
	docker compose -f docker-compose.yml down postgres
restart:
	docker compose -f docker-compose.yml down postgres
	docker compose -f docker-compose.yml up -d postgres
connect_db:
	docker exec -it local_warehouse psql -U dbt_user_local ${db_name}
execute_order_66:
	make restart
	python elt/extract/extract.py
	dbt run --profiles-dir ${dbt_profile_dir} --project-dir  ${dbt_profile_dir}

