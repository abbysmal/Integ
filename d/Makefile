DC = ldc2
RM = rm -f
MV = mv

NAME = integ

SRC = integ.d
OBJ = $(SRC:.d=.o)

all: $(NAME)

$(NAME): $(SRC)
	$(DC) $^

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all
