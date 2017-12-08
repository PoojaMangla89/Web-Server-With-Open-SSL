/*************************************************************************
	> File Name: test.c
	> Author: Pooja Mangla
 ************************************************************************/

#include<stdio.h>

int main() {
    int i;
    char key[256];
    char value[256];
    char *buf = "User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:32.0) Gecko/20100101 Firefox/32.0i\r\n";
    i = sscanf(buf, "%[^':']: %[^'\n\r']", key, value);
    printf("i = %d, key:%s, value:%s", i, key, value);
    return 0;
}
