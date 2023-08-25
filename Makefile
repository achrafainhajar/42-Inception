NAME = inception

all : $(NAME)

$(NAME) :
	sudo mkdir -p "/home/aainhaja/data/wordpress"
	sudo mkdir -p "/home/aainhaja/data/mariadb"
	docker compose -f docker-compose.yml up --build -d

down :
	docker compose -f docker-compose.yml down
	
restart :
	docker compose -f docker-compose.yml restart


prune :
	docker compose -f docker-compose.yml down --rmi all --volumes

re : fclean all
	

clean : down prune


fclean : clean
	sudo rm -rf /home/aainhaja/data/wordpress
	sudo rm -rf /home/aainhaja/data/mariadb