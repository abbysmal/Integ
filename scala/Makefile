SCALAC = scalac
RM = rm -f

SRC = main.scala \
      calcul.scala
OBJ_TMP = *.class

all: $(SRC)
	$(SCALAC) $^

clean:
	$(RM) $(OBJ_TMP)

fclean: clean

re: fclean all
