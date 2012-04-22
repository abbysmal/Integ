HC = ghc
RM = rm -f

NAME = integ

SRC = main.hs \
      Calcul.hs
OBJ = $(SRC:.hs=.o)
OBJ_TMP = $(SRC:.hs=.hi)

HFLAGS += -W -Wall

all: $(NAME)

$(NAME): $(SRC)
	$(HC) $(HFLAGS) $^ -o $@

clean:
	$(RM) $(OBJ) $(OBJ_TMP)

fclean: clean
	$(RM) $(NAME)

re: fclean all
