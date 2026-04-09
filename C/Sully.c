#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define CONTENT "#include <stdio.h>%2$c#include <stdlib.h>%2$c#include <unistd.h>%2$c%2$c#define CONTENT %4$c%1$s%4$c%2$c%2$cint main() {%2$c%3$cint i = %6$d;%2$c%3$cif (i < 0) {%2$c%3$c%3$creturn 0;%2$c%3$c}%2$c%3$cchar cfilename[20];%2$c%3$csprintf(cfilename, %4$cSully_%5$cd.c%4$c, i);%2$c%3$cif (access(cfilename, F_OK) != -1) {%2$c%3$c%3$ci--;%2$c%3$c}%2$c%3$cif (i < 0) {%2$c%3$c%3$creturn 0;%2$c%3$c}%2$c%3$cchar filename[20];%2$c%3$csprintf(filename, %4$cSully_%5$cd.c%4$c, i);%2$c%3$cFILE *fd = fopen(filename, %4$cw%4$c);%2$c%3$cfprintf(fd, CONTENT, CONTENT, 10, 9, 34, 37, i);%2$c%3$cfclose(fd);%2$c%3$cchar cmd[150];%2$c%3$csprintf(cmd, %4$cclang -Wall -Wextra -Werror %5$c1$s -o Sully_%5$c2$d && ./Sully_%5$c2$d%4$c, filename, i);%2$c%3$csystem(cmd);%2$c}"

int main() {
	int i = 5;
	if (i < 0) {
		return 0;
	}
	char cfilename[20];
	sprintf(cfilename, "Sully_%d.c", i);
	if (access(cfilename, F_OK) != -1) {
		i--;
	}
	if (i < 0) {
		return 0;
	}
	char filename[20];
	sprintf(filename, "Sully_%d.c", i);
	FILE *fd = fopen(filename, "w");
	fprintf(fd, CONTENT, CONTENT, 10, 9, 34, 37, i);
	fclose(fd);
	char cmd[150];
	sprintf(cmd, "clang -Wall -Wextra -Werror %1$s -o Sully_%2$d && ./Sully_%2$d", filename, i);
	system(cmd);
}