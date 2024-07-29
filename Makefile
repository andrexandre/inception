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

# outdated
help:
	@curl -s https://pastebin.com/raw/efMyMp23

all:
	@docker compose -f srcs/docker-compose.yml $(CMD)

upd:
	@docker compose -f srcs/docker-compose.yml up -d

downv:
	@docker compose -f srcs/docker-compose.yml down -v

exec:
	@echo 1 - nginx, 2 - wordpress, 3 - mariadb
	@read -p "Choose a container to enter into: " choice && \
	case $$choice in \
		1) docker exec -it nginx bash; ;; \
		2) docker exec -it wordpress bash; ;; \
		3) docker exec -it mariadb bash; ;; \
	esac

re: clean downv upd

clean:
	docker container prune -f
	@echo "\n$(BLUE)containers $(GREEN)cleaned$(END) 🗑️\n"

fclean: clean
	-docker rmi -f $$(docker images -q)
	@echo "\n$(BLUE)images $(GREEN)cleaned$(END) 🗑️\n"

eval:
	docker stop $(docker ps -qa); \
	docker rm $(docker ps -qa); \
	docker rmi -f $(docker images -qa); \
	docker volume rm $(docker volume ls -q); \
	docker network rm $(docker network ls -q) 2>/dev/null
# this command will:
# stop and remove all the containers;
# remove all images, volumes and networks;
# silence any error message by sending it do /dev/null

# .PHONY: all clean fclean re e

# Syntax notes:
# mariadb -u root -p
# <mariadb root password>
# show databases;
# use <database>
# show tables;
# select * from <table>;
# i need to test 'docker compose watch'