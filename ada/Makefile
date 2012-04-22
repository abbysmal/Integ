ADAC = gnat make
RM = rm -f

NAME = integ

SRC = main.adb
OBJ = $(SRC:.adb=.o)
OBJ_TMP = $(SRC:.adb=.ali)

all: $(NAME)

$(NAME): $(SRC)
	$(ADAC) $^ -o $@

clean:
	$(RM) $(OBJ_TMP) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all
