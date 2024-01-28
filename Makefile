FILE=./srcs/docker-compose.yml

up:
	mkdir -p /home/aainhaja/data/wordpress && \
    mkdir -p /home/aainhaja/data/mariadb && \
    docker compose -f $(FILE) up -d --build

build:
	docker compose -f $(FILE) build

down:
	docker compose -f $(FILE) down

logs:
	docker compose -f $(FILE) logs

clean:
	docker compose -f $(FILE) down -v --rmi all && \
    docker system prune -f

fclean: clean
	rm -rf /home/aainhaja/data/wordpress/* && \
	rm -rf /home/aainhaja/data/mariadb/* 
wp-bash:
	docker compose -f $(FILE) exec wordpress /bin/bash

nginx-bash:
	docker compose -f $(FILE) exec nginx /bin/bash

mariadb-bash:
	docker compose -f $(FILE) exec mariadb /bin/bash