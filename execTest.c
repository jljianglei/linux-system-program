#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<unistd.h>
int main() {
    char * const args[] = {"vi","./IOTest.c",NULL};
    int ret;
    ret = execvp("vi",args);
    if(ret == -1) {
       perror("execvp faild");
       return -1;
    }
    return 0;
}
