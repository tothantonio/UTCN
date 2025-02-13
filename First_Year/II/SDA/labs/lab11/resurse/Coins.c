#include <stdio.h>
#define MAX 1000
#define INF 1000000
int s, n, monede[MAX], combinatii[MAX + 1], min[MAX];
void read();
void DP2();
void DP();
void write();
int main()
{
    read();
    DP2();
    write();
    return 0;
}
void read()
{
    int i;
    scanf("%d", &n);
    scanf("%d", &s);
    for (i = 0; i < n; i++)
        scanf("%d", &monede[i]);
}
void DP()
{
    // TO DO
    // Your code goes here
    combinatii[0] = 1;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < s; j++)
        {
            if (j >= monede[i])
                combinatii[j] += combinatii[j - monede[i]];
        }
    }
}

void DP2()
{
    for (int i = 0; i <= s; i++)
    {
        min[i] = INF;
    }
    min[0] = 0;
    for (int i = 1; i <= s; i++)
    {
        for (int j = 0; j < n; j++)
        {
            int vj = monede[j];
            if (vj <= i && min[i - vj] + 1 < min[i])
            {
                min[i] = min[i - vj] + 1;
            }
        }
    }
}
void write()
{
    printf("%d \n", combinatii[s]);
    for (int i = 0; i <= s; i++)
        printf("%d ", combinatii[i]);
}
