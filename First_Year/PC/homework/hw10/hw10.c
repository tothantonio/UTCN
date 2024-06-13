#include <stdio.h>

long long cmmdc(long long a, long long b)
{
    return (b == 0) ? a : cmmdc(b, a % b);
}

//in numarare e posibil sa numaram de mai multe ori anumite numere
//astfel caut cmmmmc a fiecarei submultime, ca sa nu numar de mai multe ori aceleasi numere
long long cmmmc(long long a, long long b)
{
    return (a * b) / cmmdc(a, b);
}

//practic trebuie sa aflam cate numere sunt divizibile cu cel putin
//un numar din sirul dat
long long count(long long N, int arr[], int k)
{
    long long ans = 0;
    //generez submultimile, in format binar, fiecare bit
    //reprezinta prezenta sau absenta unui element din sir
    for(int i = 1; i < (1 << k); i ++)
    {
        long long lcm = 1;
        //cmmmc din fiecare submultime
        int cnt_bits = 0;
        //numar elementele din submultime(bitii setati)
        for(int j = 0; j < k; j ++)
        {
            if(i & (1 << j)) // bitul j al nr-lui i este setat sau nu
                //verific daca  arr[j] apartine submultimii crt
            {
                cnt_bits++;
                lcm = cmmmc(lcm, arr[j]);
                if(lcm > N) break;
                //lcm tot creste si la un moment dat este inutil, fiind mai mare ca N, asa ca ne oprim
            }
        }
        if(cnt_bits % 2)
//in functie de paritatea nr de elemente din submultime, adaugam sau scadem nr de elemente div. cu lcm
        {
            ans += N / lcm;
            //adaugam fiecare set individual de nr div. cu a[i]
        }
        else ans -= N / lcm;
        //scadem nr de elemente ce apar in intersectiile seturilor
    }
    return ans;
}

/*
Aplicarea Principiului Includerii și Excluderii: În funcție de numărul de elemente din submultime (numărul de biți setați),
codul adaugă sau scade acest număr la/de la răspuns. Dacă numărul de elemente din submultime este impar,
se adaugă numărul de elemente divizibile (deoarece sunt incluse în uniune);
dacă este par, se scade (deoarece sunt excluse pentru a corecta supranumărarea).
*/
int main()
{
    int T;
    scanf("%d", &T);

    while (T--)
    {
        int k;
        long long N;
        scanf("%lld %d", &N, &k);

        int a[k];
        for (int i = 0; i < k; i++)
        {
            scanf("%d", &a[i]);
        }
        printf("%lld\n", count(N, a, k));
    }

    return 0;
}
