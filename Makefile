NAME = inception

all : $(NAME)

$(NAME) :
	sudo mkdir -p "/home/achraf/data/wordpress"
	sudo mkdir -p "/home/achraf/data/mariadb"
	sudo docker compose -f docker-compose.yml up --build -d

down :
	sudo docker compose -f docker-compose.yml down
	
restart :
	sudo docker compose -f docker-compose.yml restart


prune :
	sudo docker compose -f docker-compose.yml down --rmi all --volumes
	

re : fclean all
	

clean : down prune


fclean : clean
	sudo rm -rf /home/achraf/data/wordpress
	sudo rm -rf /home/achraf/data/mariadb