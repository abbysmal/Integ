RM = rm -f

NAME = integ

SRC = integ.go \


all: $(NAME)

$(NAME):
	gccgo $(CFLAGS) $(SRC) -o $(NAME)


clean:
	$(RM) $(NAME)

fclean: clean
	$(RM) $(NAME)

re: fclean all
