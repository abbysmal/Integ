VALAC = valac
RM = rm -f

NAME = integ

SRC = main.vala \
      calcul.vala

VALAFLAGS = --Xcc=-lm

all: $(NAME)

$(NAME): $(SRC)
	$(VALAC) $^ $(VALAFLAGS) -o $@

clean:

fclean: clean
	$(RM) $(NAME)

re: fclean all
