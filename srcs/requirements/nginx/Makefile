END			= \033[0m
RED			= \033[1;31m
GREEN		= \033[1;32m
YELLOW		= \033[1;33m
BLUE		= \033[1;34m
MAGENTA		= \033[1;35m
CYAN		= \033[1;36m
WHITE		= \033[1;37m

NAME		= inception

all: build
	docker run --name=$(NAME) -d -p 8080:80 $(NAME)
	@echo "\n$(BLUE)$(NAME)$(END) $(GREEN)running$(END) 💻\n"

clean:
	docker stop $(NAME)
	@echo "\n$(BLUE)$(NAME)$(END) $(GREEN)removed$(END) 🗑️\n"

fclean: clean
	docker container prune -f

re: fclean build all

build:
	docker build -t $(NAME) .
	@echo "\n$(BLUE)$(NAME)$(END) $(GREEN)built$(END) 🛠️\n"

exec:
	docker exec -it $(NAME) bash

e: fclean

.PHONY: all clean fclean re run e
