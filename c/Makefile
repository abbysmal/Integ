RM = rm -f

NAME = integ

SRC = integ.c \


CFLAGS += -Wextra -Wall -ansi -pedantic -lm
LDFLAGS +=

all: $(NAME)

$(NAME):
	$(CC) $(CFLAGS) $(SRC) -o $(NAME)


clean:
	$(RM) $(NAME)

fclean: clean
	$(RM) $(NAME)

re: fclean all
