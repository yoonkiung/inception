NAME = inception

DOMAIN = "127.0.0.1       kiyoon.42.fr"

all : $(NAME)

$(NAME) :	
	@docker-compose -f srcs/docker-compose.yml up -d --build

up:
	@docker-compose -f ./srcs/docker-compose.yml  up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down 

clean:
	@docker-compose -f ./srcs/docker-compose.yml down -v

re: clean all

.PHONY	: all down clean re

