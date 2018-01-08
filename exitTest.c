#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#include<unistd.h>
void callback1(void) {
   printf("--------------%s---------------\n",__func__);
}
void callback2(void) {
   printf("--------------%s---------------\n",__func__);
}
void callback3(void) {
   printf("--------------%s---------------\n",__func__);
}
int main() {
    atexit(&callback1);
    atexit(&callback2);
    atexit(&callback3);
    return 0;
}
