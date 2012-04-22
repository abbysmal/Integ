DC = ldc2
RM = rm -f
MV = mv

NAME = integ

SRC = main.d
OBJ = $(SRC:.d=.o)

all: $(NAME)

$(NAME): $(SRC)
	$(DC) $^
	$(MV) toto $@

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all
