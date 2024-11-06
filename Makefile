include ./srcs/.env

all : up

up:
	mkdir -p /home/$(USER)/data/$(NETWORK)/mariadb
	mkdir -p /home/$(USER)/data/$(NETWORK)/wordpress
	docker-compose  -f ./srcs/docker-compose.yml up

down :
	docker-compose -f ./srcs/docker-compose.yml down --rmi all -v
	sudo rm -rf /home/$(USER)/data/$(NETWORK)/$(USER).42.fr

recreate : down up

stop : 
	docker-compose -f ./srcs/docker-compose.yml stop

start : 
	docker-compose -f ./srcs/docker-compose.yml start

status : 
	docker ps
