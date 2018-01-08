#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<unistd.h>
#include<poll.h>
/*在标准输入上阻塞5秒，如果没有输入则提示并退出*/
#define USE_SELECT
#define USE_POLL
int main() {
    printf("%d %d %d\n",STDIN_FILENO,STDOUT_FILENO,STDERR_FILENO);
#ifdef USE_SELECT
    fd_set readfds;
    FD_ZERO(&readfds);
    FD_SET(STDIN_FILENO,&readfds);
    struct timeval t1;
    t1.tv_sec = 5;
    t1.tv_usec = 0;
    int ret;
    ret = select(STDIN_FILENO + 1,&readfds,NULL,NULL,&t1);
    if(ret == -1) {
       perror("select faild");
       return -1;
    }
    else if(ret == 0) {
       perror("select timeout");
       return -1;
    }
    if(FD_ISSET(STDIN_FILENO,&readfds)) {
       int len = 1024;
       char buf[1024] = {0};
       ret = read(STDIN_FILENO,buf,len);
       buf[ret - 1] = '\0';
       printf("read ret = %d,%s\n",ret,buf);
    }
#endif/*USE_SELECT*/
#ifdef USE_POLL
    struct pollfd fds[2];
    fds[0].fd = STDIN_FILENO;
    fds[0].events = POLLIN;
    fds[1].fd = STDOUT_FILENO;
    fds[1].events = POLLOUT;
    ret = poll(fds,2,5 * 1000);
    if(ret == -1) {
       perror("poll faild");
       return -1;
    }
    else if(ret == 0) {
       perror("poll timeout");
       return -1;
    }
    if(fds[0].revents & POLLIN) {
       printf("stdin is ready\n");
    }
    if(fds[1].revents & POLLOUT) {
      printf("stdout ready\n");
    }
#endif/*USE_POLL*/
    return 0;
}
