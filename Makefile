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
	@curl -s https://pastebin.com/raw/efMyMp23

all:
	@sudo docker compose -f srcs/docker-compose.yml $(CMD)

re: clean down up

clean:
	docker container prune -f
	@echo "\n$(BLUE)containers $(GREEN)cleaned$(END) 🗑️\n"

fclean: clean
	-docker rmi -f $$(docker images -q)
	@echo "\n$(BLUE)images $(GREEN)cleaned$(END) 🗑️\n"

ps:
	docker ps -a

e: down

# .PHONY: all clean fclean re e
