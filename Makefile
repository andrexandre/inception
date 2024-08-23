NAME = inception

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

re: stop build upd

rep: prune rmfolders build up

# list all containers, images, volumes and networks
status:
	docker ps -a
	@echo
	docker image ls
	@echo
	docker volume ls
	@echo
	docker network ls --filter "name=$(NAME)"

# stop and remove all the containers;
# remove all images, volumes and networks;
# silence errors by sending them to /dev/null
prune:
	-docker stop $$(docker ps -qa)
	-docker rm $$(docker ps -qa)
	-docker rmi -f $$(docker images -qa)
	-docker volume rm $$(docker volume ls -q)
	-docker network rm $$(docker network ls --filter "name=$(NAME)" -q)

.PHONY: help all build-up upd folders rmfolders lsfolders exec re rep status prune eval
