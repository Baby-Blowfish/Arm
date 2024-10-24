#include <stdio.h>

extern int Sum(long a[], long b);

int main()
{

	long a[10] = {1,2,3,4,5,6,7,8,9,10};

	printf("%d\n",Sum(a,5));
	return 0;
}
