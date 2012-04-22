JAVAC = javac
RM = rm -f

SRC = MainClass.java \
      Calcul.java
OBJ = $(SRC:.java=.class)
OBJ_TMP = *.class

all: $(SRC)
	$(JAVAC) $^

clean:
	$(RM) $(OBJ) $(OBJ_TMP)

fclean: clean

re: fclean all
