CC		= clang
CFLAGS	= -Wall -Wextra -Werror

NAMES	= Collen Grace Sully

all: $(NAMES)

Collen: Collen.c
	$(CC) $(CFLAGS) $< -o $@

Grace: Grace.c
	$(CC) $(CFLAGS) $< -o $@

Sully: Sully.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	$(RM) Grace_kid.c Sully_*.c

fclean: clean
	$(RM) $(NAMES)

re: fclean all

.PHONY: all clean fclean re
