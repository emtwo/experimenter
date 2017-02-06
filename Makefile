build:
	./scripts/build.sh

compose_build: build
	docker-compose build

up: compose_build
	docker-compose up

test: compose_build
	docker-compose run app sh -c "coverage run manage.py test;coverage report -m --fail-under=100"

lint: compose_build
	docker-compose run app flake8 .

check: compose_build lint test
	echo "Success"

migrate: compose_build
	docker-compose run app python manage.py migrate

shell: compose_build
	docker-compose run app python manage.py shell

sh: compose_build
	docker-compose run app sh
