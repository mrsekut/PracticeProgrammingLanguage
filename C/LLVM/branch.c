#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int fib(int n)
{
    int val;

    if (n < 3)
    {
        val = 1;
    }
    else
    {
        val = fib(n - 1) + fib(n - 2);
    }
    return val;
}

void usage() { printf("usage: fib <正の整数>\n"); }

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        usage();
        return 0;
    }
    int n = atoi(argv[1]);
    printf("%d\n", fib(n));
    return 0;
}
