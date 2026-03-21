#include <stdio.h>

// Hello ;)

char *getContent() {
	return "#include <stdio.h>%1$c%1$c// Hello ;)%1$c%1$cchar *getContent() {%1$c%2$creturn %3$c%4$s%3$c;%1$c}%1$c%1$cint main() {%1$c%2$c// Hi there :)%1$c%1$c    char *content = getContent();%1$c%2$cprintf(content, 10, 9, 34, content);%1$c}%1$c";
}

int main() {
	// Hi there :)

    char *content = getContent();
	printf(content, 10, 9, 34, content);
}
