#include "stdio.h"
#define N 3
#define M 4
void process(int n, int m, int matrix [M][N], int *str, int *st, int znach)
{
    for (int i = 0; i < m; ++i) 
	{
        for (int j = 0; j < n; ++j) 
		{
			if (matrix[i][j] == znach)
			{
				*str = i;
				*st = j;
				return;
			}
        }
    }
	return;
}

int main(int argc, char** argv)
{
    int matrix[M][N];
    int stroka, stolbets;

    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    process(N, M, matrix, &stroka, &stolbets, 7);

	printf("%d %d \n", stroka, stolbets);

    return 0;
}