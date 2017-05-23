#include <stdlib.h>
#include <stdio.h>

int is_progression(int*, int);

int main()
{
	int N, *arr;
	
	scanf("%d", &N);
	arr = (int*)malloc(sizeof(int)*N);
	for (int i = 0; i < N; ++i)
		scanf("%d", (arr+i));

	printf("%d\n", is_progression(arr, N));

	return 0;
}