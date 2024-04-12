
SRC = src/strcmp.asm		\
	  src/strncmp.asm		\
	  src/strlen.asm		\
	  src/strchr.asm		\
	  src/strrchr.asm		\
	  src/strcspn.asm		\
	  src/strstr.asm		\
	  src/strpbrk.asm		\
	  src/strcasecmp.asm	\
	  src/memset.asm		\
	  src/memcpy.asm		\
	  src/memmove.asm		\

NAME = libasm.so

OBJ = $(SRC:.asm=.o)

%.o: %.asm
	nasm -f elf64 $< -o $@

all: $(OBJ)
	ld -fPIC -shared -o $(NAME) $(OBJ)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all
