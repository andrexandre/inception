END			= \033[0m
RED			= \033[1;31m
GREEN		= \033[1;32m
YELLOW		= \033[1;33m
BLUE		= \033[1;34m
MAGENTA		= \033[1;35m
CYAN		= \033[1;36m
WHITE		= \033[1;37m

NAME		= inception
HOST_URL	= analexan.42.fr

CMD = help

%:
	@$(MAKE) -s all CMD=$@

help:
	@curl -s https://pastebin.com/raw/XtwsedRc

all:
	@sudo docker compose -f srcs/docker-compose.yml $(CMD)

build-up:
	@sudo docker compose -f srcs/docker-compose.yml up --build

upd:
	@sudo docker compose -f srcs/docker-compose.yml up -d

downv:
	@sudo docker compose -f srcs/docker-compose.yml down -v

folders:
	@mkdir -p ~/data
	@mkdir -p ~/data/mariadb
	@mkdir -p ~/data/wordpress
	@echo Folders created

rmfolders:
	@sudo rm -rf ~/data/mariadb/**
	@sudo rm -rf ~/data/wordpress/**
	@echo Folders cleaned

lsfolders:
	@ls -la ~/data/**

exec:
	@echo 1 - mariadb , 2 - wordpress, 3 - nginx
	@read -p "Choose a container to enter into: " choice && \
	case $$choice in \
		1) docker exec -it mariadb bash; ;; \
		2) docker exec -it wordpress bash; ;; \
		3) docker exec -it nginx bash; ;; \
	esac

re: prune rmfolders build up
	@true

# list all containers, images, volumes and networks
status:
	docker ps -a
	@echo
	docker image ls
	@echo
	docker volume ls
	@echo
	docker network ls --filter "name=$(NAME)"

prune:
	-docker stop $$(docker ps -qa)
	-docker rm $$(docker ps -qa)
	-docker rmi -f $$(docker images -qa)
	-docker volume rm $$(docker volume ls -q)
	-docker network rm $$(docker network ls --filter "name=$(NAME)" -q)

# stop and remove all the containers;
# remove all images, volumes and networks;
# silence errors by sending them to /dev/null
eval:
	docker stop $$(docker ps -qa); \
	docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); \
	docker volume rm $$(docker volume ls -q); \
	docker network rm $$(docker network ls -q) 2>/dev/null

.PHONY: help all upd downv exec re status prune folders rmfolders
