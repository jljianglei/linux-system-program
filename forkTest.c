#include<unistd.h>
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int main() {
    pid_t pid;
    pid = fork();
    if(pid > 0) {
       printf("this is parent process\n");
       return 0;
    }
    else if(pid == 0) {
       printf("this is child prodcess\n");
       char * const args[] = {"cat","./IOTest.c",NULL};
       int ret;
       ret = execvp("cat",args);
       if(ret == -1) {
          perror("execvp faild");
       }
       return 0;
    }
}
