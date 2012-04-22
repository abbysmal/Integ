ERLC = erlc

MODULES = calcul.erl
OBJ = $(MODULES:.erl=.beam)

all: $(MODULES)
	$(ERLC) $<

clean:
	$(RM) $(OBJ)

fclean: clean

re: fclean all
