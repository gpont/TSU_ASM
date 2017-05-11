#include <stdio.h>

int change_int(int);

int main()
{
	int x;
	// printf("Enter coords: ");
	scanf("%d", &x);
	printf("%d\n", change_int(x));

	return 0;
}