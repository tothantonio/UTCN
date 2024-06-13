#include <stdio.h>

int main()
{

    int oraR1, minR1, secR1, oraR2, minR2, secR2;
    int oraA1, minA1, secA1, oraA2, minA2, secA2;

    scanf("%d:%d:%d-%d:%d:%d", &oraR1, &minR1, &secR1, &oraR2, &minR2, &secR2);
    scanf("%d:%d:%d-%d:%d:%d", &oraA1, &minA1, &secA1, &oraA2, &minA2, &secA2);


    int startR = oraR1 * 3600 + minR1 * 60 + secR1; //conversie in aceeasi unitate (s)
    int endR = oraR2 * 3600 + minR2 * 60 + secR2;

    int startA = oraA1 * 3600 + minA1 * 60 + secA1;
    int endA = oraA2 * 3600 + minA2 * 60 + secA2;

    int max_start, min_end;

    max_start = (startR > startA) ? startR : startA; //momentul maxim de start
    min_end = (endR < endA) ? endR : endA; //momentul minim de incheiere

    int durata = (max_start < min_end) ? min_end - max_start : 0;

    int ore_max = durata/ 3600;
    int minute_max = (durata % 3600) / 60;
    int secunde_max = durata % 60;

    printf("%02d:%02d:%02d\n", ore_max, minute_max, secunde_max);

    return 0;
}
