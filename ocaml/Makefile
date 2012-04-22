OCAMLC = ocamlopt
RM = rm -f

NAME = integ

SRC = calcul.ml \
      main.ml
INTERFACES = calcul.mli
OBJ = $(SRC:.ml=.cmx)
OBJ_INTERFACES = $(INTERFACES:.mli=.cmi)
OBJ_TMP = $(SRC:.ml=.o)

all: $(OBJ_INTERFACES) $(NAME)

$(NAME): $(OBJ)
	$(OCAMLC) $^ -o $@

%.cmx: %.ml
	$(OCAMLC) -c $<

%.cmi: %.mli
	$(OCAMLC) -c $<

clean:
	$(RM) $(OBJ) *.cmi $(OBJ_TMP)

fclean: clean
	$(RM) $(NAME)

re: fclean all
