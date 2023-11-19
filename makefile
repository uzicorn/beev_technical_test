start:
	docker compose -f docker-compose.yml up -d postgres
stop:
	docker compose -f docker-compose.yml down postgres
restart:
	docker compose -f docker-compose.yml down postgres
	docker compose -f docker-compose.yml up -d postgres
connect-to_database:
	docker exec -it local_warehouse psql -U dbt_user_local test_db
execute_order_66:
	make restart
	python elt/extract/extract.py

