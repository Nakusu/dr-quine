#include <stdio.h>

// Hello there :)

#define CONTENT "#include <stdio.h>%1$c%1$c// Hello there :)%1$c%1$c#define CONTENT %4$c%2$s%4$c%1$c#define OUTPUT %4$c%3$s%4$c%1$c#define MAIN int main() { FILE *fd = fopen(OUTPUT, %4$cw%4$c); fprintf(fd, CONTENT, 10, CONTENT, OUTPUT, 34); fclose(fd); }%1$c%1$cMAIN"
#define OUTPUT "Grace_kid.c"
#define MAIN int main() { FILE *fd = fopen(OUTPUT, "w"); fprintf(fd, CONTENT, 10, CONTENT, OUTPUT, 34); fclose(fd); }

MAIN