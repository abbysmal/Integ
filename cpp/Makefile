CXX = $(if $(filter $(DEBUG), yes), clang++, g++)
RM = rm -f

NAME = integ

SRC = main.cpp \
      calcul.cpp
OBJ = $(SRC:.cpp=.o)

CXXFLAGS := $(if $(filter $(DEBUG), yes), -ggdb3, -O2)
CXXFLAGS += -Wextra -Wall -ansi -pedantic
LDFLAGS +=

all: $(NAME)

$(NAME): $(OBJ)
	$(CXX) $^ $(LDFLAGS) -o $@

%.o: %.cpp
	$(CXX) -c $< $(CXXFLAGS) -o $@

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all
