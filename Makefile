NAME = inception

DOMAIN = "127.0.0.1       kiyoon.42.fr"

all : $(NAME)

$(NAME) :	
	@sudo echo $(DOMAIN) > /etc/hosts
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d --build

up:
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@sudo docker-compose -f ./srcs/docker-compose.yml down 

clean:
	@sudo docker-compose -f ./srcs/docker-compose.yml down -v

re: clean all

.PHONY	: all down clean re

