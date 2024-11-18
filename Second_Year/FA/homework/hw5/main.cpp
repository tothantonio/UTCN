#include <iostream>
#include <fstream>
#include <cstring>
#include "Profiler.h"

using namespace std;

#define N 10007
#define mElem 3000
#define NR_TESTS 5

#define c1 1
#define c2 1

long long int efortMediuGasite, efortMaximGasite, efortMediuNegasite, efortMaximNegasite;
long long int nrOp, nrElemGasite, nrElemNegasite;

/*
 * @author Antonio-Roberto Toth
 * @group 30228
 * Assignment requirments : Search Operation in Hash Tables, Open Addressing with Quadratic Probing
 * I implemented the following operations : insert, search and delete
 * HashInsert : I try to put the element on the position from the table which is given by the hash function. If the position is not available
 *              I increase i and repeat the same thing until I find an empty position, or when I verify all the positions from the table
 *              Complexity : average case O(1), worst case O(n)
 * HashSearch : I check if the element is on the position given by the hash function, if it is I return the position, else I increase i
 *              and continue the searching until I find it, or until I find an empty position, in which case the element does not exist in
 *              the table
 *              Complexity : average case O(1), worst case O(n)
 * HashDelete : I send the position of the element as an argument to the function and I delete it
 *              Complexity : average case O(1), worst case O(n)
 *
 * From the performance table I see that when the filling factor in small, the number of Elemente Gasite si Elemente Negasite is also small
 * But the number of Elemente Negasite is bigger than Elemente Gasite
 *
 * And after the HashDelete, from a filling factor of 0.99 to 0.8, the effort for searching remains very big.
 * The values for 0.8 filling factor are similar to 0.99
 */

struct Entry {
    int id;
    char name[30];
};

struct HashTable {
    Entry *T[N];
    Entry *del = new Entry(-1, "DEL");
    int m;
};

int hp(HashTable T, int k) {
    return k % T.m;
}

int h(HashTable T, int k, int i) {
    return (hp(T, k) + c1 * i + c2 * i * i) % T.m;
}

Entry *create(Entry key) {
    Entry *p = new Entry;
    p->id = key.id;
    strcpy(p->name, key.name);

    return p;
}

int hashInsert(HashTable &T, Entry k) {
    int index1 = 0, index2 = 0;
    do {
        index2 = h(T, k.id, index1);
        if (T.T[index2] == NULL || T.T[index2] == T.del) {
            T.T[index2] = create(k);
            return index2;
        }
        index1++;
    } while (index1 != T.m);

    return -1;
}

int hashSearch(HashTable T, Entry k) {
    int index1 = 0, index2 = 0;
    do {
        nrOp++;
        index2 = h(T, k.id, index1);

        if (T.T[index2] != NULL && T.T[index2] != T.del && T.T[index2]->id == k.id) {
            return index2;
        }
        index1++;
    } while (T.T[index2] != NULL && index1 != T.m);

    return -1;
}

void hashDelete(HashTable &T, int index) {
    if (index != -1) {
        delete T.T[index];
        T.T[index] = T.del;
    }
}

void printHashTable(HashTable T) {
    for (int i = 0; i < T.m; i++) {
        if (T.T[i] != NULL)
            cout << T.T[i]->id << " " << T.T[i]->name << " / ";
        else
            cout << "NULL" << " / ";
    }
    cout << "\n";
}

void demo() {
    HashTable T = {NULL};
    T.m = 5;

    hashInsert(T, Entry(0, "Ionel"));
    hashInsert(T, Entry(2, "Gigel"));
    hashInsert(T, Entry(3, "Stefan"));
    hashInsert(T, Entry(9, "Ion"));
    hashInsert(T, Entry(6, "Gica"));

    printHashTable(T);

    cout << hashSearch(T, Entry(0, "Ionel")) << endl;

    hashDelete(T, 2);
    printHashTable(T);
}

void reset() {
    efortMediuGasite = 0;
    efortMaximGasite = 0;
    efortMediuNegasite = 0;
    efortMaximNegasite = 0;
    nrOp = 0;
    nrElemGasite = 0;
    nrElemNegasite = 0;
}

void perf() {
    ofstream fout("tabel.csv");

    double factorUmplere = 0.95;
    double vFactoriUmplere[] = {0.8, 0.85, 0.9, 0.95, 0.99};
    int size = sizeof(vFactoriUmplere) / sizeof(vFactoriUmplere[0]);
    double factorUmplereBeforeDelete = 0.99;
    double factorUmplereAfterDelete = 0.8;

    int vElemHashTable[N];
    int mElemDeCautat[mElem];
    fout << "\nEvaluarea operatiei de cautare pentru un singur factor de umplere 95%. \n";
    fout << "\nFactor de umplere, Efort mediu gasite, Efort maxim gasite, Efort mediu negasite, Efort maxim negasite \n";

    reset();
    for (int test = 0; test < NR_TESTS; test++) {

        int n = (double) N * factorUmplere;
        HashTable T = {NULL};
        T.m = N;

        int a[40000] = {0};

        //adaug in tabela elemente random
        for (int i = 0; i < n;) {
            int nrDeAdaugat = rand() % 40000;

            while (a[nrDeAdaugat] != 0)
                nrDeAdaugat = rand() % 40000;
            a[nrDeAdaugat] = 1;

            int rHashInsert = hashInsert(T, Entry(nrDeAdaugat, ""));

            if (rHashInsert != -1) {
                vElemHashTable[i] = nrDeAdaugat;
                i++;
            }
        }

        FillRandomArray(mElemDeCautat, mElem, 40000, 50000, FALSE, UNSORTED);

        //jumatate din elementele cautate, sunt din tabela, jumate nu sunt
        for (int i = 0; i < mElem / 2; i++) {
            mElemDeCautat[i] = vElemHashTable[i];
        }

        for (int i = 0; i < mElem; i++) {
            nrOp= 0;

            int rHashSearch = hashSearch(T, Entry(mElemDeCautat[i], "HT"));

            if (rHashSearch == -1) {
                nrElemNegasite++;
                efortMediuNegasite += nrOp;
                if (efortMaximNegasite < nrOp) {
                    efortMaximNegasite = nrOp;
                }
            } else {
                nrElemGasite++;
                efortMediuGasite += nrOp;
                if (efortMaximGasite < nrOp) {
                    efortMaximGasite = nrOp;
                }
            }
        }

        // verific umplere corecta
        int cnt = 0;
        for (int i = 0; i < T.m; i++)
            if (T.T[i] == NULL) cnt++;
        if (cnt != N - n) {
            cout << "Greseala";
            exit(0);
        }
    }
    if (nrElemGasite > 0)
        efortMediuGasite = efortMediuGasite / nrElemGasite;
    if (nrElemNegasite > 0)
        efortMediuNegasite = efortMediuNegasite / nrElemNegasite;

    if (nrElemGasite / NR_TESTS != mElem / 2 || nrElemNegasite / NR_TESTS != mElem / 2) {
        cout << "Greseala";
        exit(0);
    }
    fout << factorUmplere << "," << efortMediuGasite << "," << efortMaximGasite << ","
         << efortMediuNegasite << ","
         << efortMaximNegasite << "\n";

    fout << "\nCompletarea evaluarii pentru toti factorii de umplere. \n";
    fout << "\nFactor de umplere, Efort mediu gasite, Efort maxim gasite, Efort mediu negasite, Efort maxim negasite \n";

    for (int iFactor = 0; iFactor < size; iFactor++) {
        reset();
        for (int test = 0; test < NR_TESTS; test++) {

            int n = (double) N * vFactoriUmplere[iFactor];
            HashTable T = {NULL};
            T.m = N;

            int a[40000] = {0};

            for (int i = 0; i < n;) {
                int nrDeAdaugat = rand() % 40000;

                while (a[nrDeAdaugat] != 0)
                    nrDeAdaugat = rand() % 40000;
                a[nrDeAdaugat] = 1;

                int rHashInsert = hashInsert(T, Entry(nrDeAdaugat, ""));

                if (rHashInsert != -1) {
                    vElemHashTable[i] = nrDeAdaugat;
                    i++;
                }
            }

            FillRandomArray(mElemDeCautat, mElem, 40000, 50000, FALSE, UNSORTED);

            for (int i = 0; i < mElem; i += 2) {
                mElemDeCautat[i] = vElemHashTable[(n / mElem) * i];
            }

            for (int i = 0; i < mElem; i++) {
                nrOp = 0;

                int rHashSearch = hashSearch(T, Entry(mElemDeCautat[i], "HT"));

                if (rHashSearch == -1) {
                    nrElemNegasite++;
                    efortMediuNegasite += nrOp;
                    if (efortMaximNegasite < nrOp) {
                        efortMaximNegasite = nrOp;
                    }
                } else {
                    nrElemGasite++;
                    efortMediuGasite += nrOp;
                    if (efortMaximGasite < nrOp) {
                        efortMaximGasite = nrOp;
                    }
                }
            }

            int cnt = 0;
            for (int i = 0; i < T.m; i++)
                if (T.T[i] == NULL) cnt++;
            if (cnt != N - n) {
                cout << "Greseala";
                exit(0);
            }
        }
        if (nrElemGasite > 0)
            efortMediuGasite = efortMediuGasite / nrElemGasite;
        if (nrElemNegasite > 0)
            efortMediuNegasite = efortMediuNegasite / nrElemNegasite;

        if (nrElemGasite / NR_TESTS != mElem/ 2 || nrElemNegasite / NR_TESTS != mElem/ 2) {
            cout << "Greseala";
            exit(0);
        }

        fout << vFactoriUmplere[iFactor] << "," << efortMediuGasite << "," << efortMaximGasite << ","
             << efortMediuNegasite << ","
             << efortMaximNegasite << "\n";
    }

    fout << "\nEvaluare operatie cautare dupa stergerea unor elemente.\n";
    fout << "\nFactor de umplere, Efort mediu gasite, Efort maxim gasite, Efort mediu negasite, Efort maxim negasite \n";

    reset();
    for (int test = 0; test < NR_TESTS; test++) {

        int n = (double) N * factorUmplereBeforeDelete;
        int nf = (double) N * factorUmplereAfterDelete;
        HashTable T = {NULL};
        T.m = N;

        int a[40000] = {0};

        for (int i = 0; i < n;) {
            int nrDeAdaugat = rand() % 40000;

            while (a[nrDeAdaugat] != 0)
                nrDeAdaugat = rand() % 40000;
            a[nrDeAdaugat] = 1;

            int rHashInsert = hashInsert(T, Entry(nrDeAdaugat, ""));

            if (rHashInsert != -1) {
                vElemHashTable[i] = nrDeAdaugat;
                i++;
            }
        }

        FillRandomArray(mElemDeCautat, mElem, 40000, 50000, FALSE, UNSORTED);

        for (int i = n - 1; i >= nf; i--) {
            int elemDeSters = rand() % i;

            hashDelete(T, hashSearch(T, Entry(vElemHashTable[elemDeSters], "")));
            vElemHashTable[elemDeSters] = -1;
            swap(vElemHashTable[elemDeSters], vElemHashTable[i]);
        }

        for (int i = 0; i < mElem; i += 2) {
            mElemDeCautat[i] = vElemHashTable[(nf / mElem) * i];
        }

        for (int i = 0; i < mElem; i++) {
            nrOp = 0;

            int rHashSearch = hashSearch(T, Entry(mElemDeCautat[i], "HT"));

            if (rHashSearch == -1) {
                nrElemNegasite++;
                efortMediuNegasite += nrOp;
                if (efortMaximNegasite < nrOp) {
                    efortMaximNegasite = nrOp;
                }
            } else {
                nrElemGasite++;
                efortMediuGasite += nrOp;
                if (efortMaximGasite < nrOp) {
                    efortMaximGasite = nrOp;
                }
            }
        }

        int cnt = 0;
        for (int i = 0; i < T.m; i++)
            if (T.T[i] == NULL || T.T[i] == T.del) cnt++;
        if (cnt != N - nf) {
            cout << "Greseala" << cnt << " " << N - nf;
            exit(0);
        }
    }
    if (nrElemGasite > 0)
        efortMediuGasite = efortMediuGasite / nrElemGasite;
    if (nrElemNegasite > 0)
        efortMediuNegasite = efortMediuNegasite / nrElemNegasite;
    if(nrElemGasite / NR_TESTS != mElem / 2 || nrElemNegasite / NR_TESTS != mElem / 2) {
        cout << "Greseala";
        exit(0);
    }

    fout << factorUmplereAfterDelete << "," << efortMediuGasite << "," << efortMaximGasite << ","
         << efortMediuNegasite << ","
         << efortMaximNegasite << "\n";

}

int main() {
    demo();
    //perf();
}