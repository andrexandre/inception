END			:= \033[0m
RED			:= \033[1;31m
GREEN		:= \033[1;32m
YELLOW		:= \033[1;33m
BLUE		:= \033[1;34m
MAGENTA		:= \033[1;35m
CYAN		:= \033[1;36m
WHITE		:= \033[1;37m

OBJSDIR		:= objs
NAME		:= inception

all:
	@docker run --name=$(NAME) -d -p 8080:80 $(NAME)
	@echo "\n$(BLUE)$(NAME)$(END) $(GREEN)built$(END) 💻\n"

clean:
	@docker container prune -f
	@echo "\n$(BLUE)$(NAME)$(END) $(GREEN)removed$(END) 🗑️\n"

fclean: clean

re: fclean all

build:
	@docker build -t $(NAME) .

v: re
	@valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./$(NAME) $(VARS)

e: fclean

.PHONY: all clean fclean re run e
