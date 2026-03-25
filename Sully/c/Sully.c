#include <stdio.h>
#include <stdlib.h>

#define CONTENT "#include <stdio.h>%2$c#include <stdlib.h>%2$c%2$c#define CONTENT %4$c%1$s%4$c%2$c%2$cint main() {%2$c%3$cint i = %6$d;%2$c%3$cif (i <= 0) {%2$c%3$c%3$creturn 0;%2$c%3$c}%2$c%3$cchar filename[100];%2$c%3$csprintf(filename, %4$cSully_%5$cd.c%4$c, i - 1);%2$c%3$cFILE *fd = fopen(filename, %4$cw%4$c);%2$c%3$cfprintf(fd, CONTENT, CONTENT, 10, 9, 34, 37, i - 1);%2$c%3$cfclose(fd);%2$c%3$cchar cmd[400];%2$c%3$csprintf(cmd, %4$cclang -Wall -Wextra -Werror %5$cs -o Sully_%5$cd%4$c, filename, i - 1);%2$c%3$csystem(cmd);%2$c%3$cchar cmd2[100];%2$c%3$csprintf(cmd2, %4$c./Sully_%5$cd%4$c, i - 1);%2$c%3$csystem(cmd2);%2$c}"

int main() {
    int i = 5;
    if (i <= 0) {
        return 0;
    }
    char filename[100];
    sprintf(filename, "Sully_%d.c", i - 1);
    FILE *fd = fopen(filename, "w");
    fprintf(fd, CONTENT, CONTENT, 10, 9, 34, 37, i - 1);
    fclose(fd);
    char cmd[100];
	sprintf(cmd, "clang -Wall -Wextra -Werror %s -o Sully_%d", filename, i - 1);
	system(cmd);
    char cmd2[100];
    sprintf(cmd2, "./Sully_%d", i - 1);
    system(cmd2);
}