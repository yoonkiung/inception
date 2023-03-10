NAME = inception

DOMAIN = "127.0.0.1       kiyoon.42.fr"

all : $(NAME)

$(NAME) :
	@if [ ! -d /home/kiyoon/data ]; then \
		mkdir -p /home/kiyoon/data/wordpress; \
		mkdir -p /home/kiyoon/data/mariadb; \
	fi	
	@sudo echo "${DOMAIN}" > /etc/hosts
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d --build

up:
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d

down:
	@sudo docker-compose -f ./srcs/docker-compose.yml down 

clean:
	@sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all -v

re: clean all

.PHONY	: all down clean re

