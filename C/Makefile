CC		= clang
CFLAGS	= -Wall -Wextra -Werror

NAMES	= Colleen Grace Sully

all: $(NAMES)

Colleen: Colleen.c
	$(CC) $(CFLAGS) $< -o $@

Grace: Grace.c
	$(CC) $(CFLAGS) $< -o $@

Sully: Sully.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -rf Grace_kid.c Sully_* $(NAMES)

refresh: clean all

.PHONY: all clean refresh
