start:
	docker compose -f docker-compose.yml up -d postgres

stop:
	docker compose -f docker-compose.yml down postgres

restart:
	docker compose -f docker-compose.yml down postgres
	docker compose -f docker-compose.yml up -d postgres

connect_db:
	docker exec -it local_warehouse psql -U dbt_user_local ${db_name}

extract:
	python elt/extract/extract.py

transform:
	dbt run --profiles-dir ${dbt_profile_dir} --project-dir  ${dbt_profile_dir}

test:
	dbt test --profiles-dir ${dbt_profile_dir} --project-dir  ${dbt_profile_dir}

execute_order_66:
	make restart
	make extract
	make transform
	make test

