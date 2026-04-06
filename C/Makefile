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
	rm -rf Grace_kid.c Sully_*.c && rm -rf $(NAMES)

refresh: clean all

.PHONY: all clean refresh
