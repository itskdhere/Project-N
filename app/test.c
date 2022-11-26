#include <stdio.h>
#include <string.h>
#define max 10
void main()
{
    char n[max];
    printf("Enter a String: ");
    fgets(n, max , stdin);
    fflush(stdin);
    printf("\n%d\n%s", strlen(n) , n);
}