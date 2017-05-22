#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

int invert(int, int);

char* stobin(int x, int N)
{
	char *b = malloc(N);
	b[0] = '\0';

	for (int z = (1 << (N-1)); z > 0; z >>= 1)
		strcat(b, ((x & z) == z) ? "1" : "0");

	return b;
}

int main()
{
	int k;
	char *buffer = (char*)malloc(256), *end;
	
	scanf("%s %d", buffer, &k);
	int N = strlen(buffer);

	buffer = stobin(invert(strtol(buffer, &end, 2), k), N);
	printf("%s\n", buffer);

	return 0;
}