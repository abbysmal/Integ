VALAC = valac
RM = rm -f

NAME = integ

SRC = integ.gs \

VALAFLAGS = --Xcc=-lm

all: $(NAME)

$(NAME): $(SRC)
	$(VALAC) $^ $(VALAFLAGS) -o $@

clean:

fclean: clean
	$(RM) $(NAME)

re: fclean all
