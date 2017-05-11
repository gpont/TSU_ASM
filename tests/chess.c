#include <stdio.h>

int chess(int, int, int, int);

int main()
{
	int x1, y1, x2, y2;
	// printf("Enter coords: ");
	scanf("%d %d %d %d", &x1, &y1, &x2, &y2);

	printf("%d\n", chess(x1, y1, x2, y2));

	return 0;
}