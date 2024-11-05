include ./srcs/.env

all : up

up :
	mkdir -p /home/$(USER)/data/mariadb
	mkdir -p /home/$(USER)/data/wordpress
	docker-compose  -f ./srcs/docker-compose.yml up --build

down : 
	docker-compose -f ./srcs/docker-compose.yml down

stop : 
	docker-compose -f ./srcs/docker-compose.yml stop

start : 
	docker-compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps
