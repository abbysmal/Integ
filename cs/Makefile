GMCS = gmcs
RM = rm -f

NAME = integ.exe

SRC = main.cs \
      calcul.cs

all: $(NAME)

$(NAME): $(SRC)
	$(GMCS) $^ -out:$@

clean:

fclean: clean
	$(RM) $(NAME)

re: fclean all
