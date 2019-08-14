build:
	docker-compose build

shell:
	docker-compose run --rm app bash

clean:
	docker system prune -f
	docker-compose stop
	docker rmi knowledgerepo_app

run:
	docker-compose up