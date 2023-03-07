NAME = inception

DOMAIN = "127.0.0.1       kiyoon.42.fr"

all : $(NAME)

$(NAME) :	
	@sudo echo $(DOMAIN) > /etc/hosts
	@docker-compose up -f ./src/docker-compose.yml -d --build

up:
	@docker-compose up -f ./src/docker-compose.yml -d --build

down:
	@docker-compose down -f ./src/docker-compose.yml 

clean:
	@docker-compose down -v -f ./src/docker-compose.yml

re: clean all

.PHONY	: all down clean re

