#include <iostream>
#include <fstream>
#include "Profiler.h"
using namespace std;

Profiler profiler("Hash Table");
#define N 10007
#define mElem 3000
#define NR_TESTS 5

#define c1 1
#define c2 1

long long int efortMediuGasite, efortMaxGasite, efortMediuNegasite, efortMaxNegasite;
long long int nrOP, nrElemGasite, nrElemNegasite;

struct Entry {
    int id;
    char name[30];
};

struct HashTable {
    Entry *T[N] = {NULL};
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

        if(T.T[index2] == NULL || T.T[index2] == T.del) {
            T.T[index2] = create(k);
            return index2;
        } else {
            index1++;
        }
    } while(index1 != T.m);
    return -1;
}

int hashSearch(HashTable T, Entry k) {
    int index1 = 0, index2 = 0;
    do {
        nrOP++;
        index2 = h(T, k.id, index1);
        if(T.T[index2] != NULL && T.T[index2] != T.del && T.T[index2]->id == k.id) {
            return index2;
        }
        index1++;
    }while(T.T[index2] != NULL && index1 != T.m);
    return -1;
}

void hashDelete(HashTable &T, int index) {
    if(index != -1 && T.T[index] != nullptr) {
        delete T.T[index];
        T.T[index] = T.del;
    }
}

void insertVector(HashTable &T, int elements[], int n) {
    for(int i = 0; i < n; i++) {
        Entry k;
        k.id = elements[i];
        strcpy(k.name, "HT");
        hashInsert(T, k);
    }
}

void printHashTable(HashTable T) {
    for(int i = 0; i < T.m; i++) {
        if(T.T[i] != NULL) {
            cout << T.T[i]->id << " " << T.T[i]->name << " | ";
        } else if (T.T[i] == T.del) {
            cout << "DEL" << " | ";
        } else {
            cout << "NULL" << " | ";
        }
    }
    cout << endl;
}

void demo() {
    HashTable T;
    T.m = 5;
    hashInsert(T, Entry(1, "Ionel"));
    hashInsert(T, Entry(2, "Cosma"));
    hashInsert(T, Entry(2, "Leo"));
    hashInsert(T, Entry(9, "Cristi"));
    hashInsert(T, Entry(17, "Seb"));
    printHashTable(T);

    cout << hashSearch(T, Entry(2, "Cosma")) << "\n";
    cout << "Delete id 17:\n";
    hashDelete(T, hashSearch(T, Entry(17, "Seb")) );
    printHashTable(T);
}

void reset() {
    efortMediuGasite = 0;
    efortMaxGasite = 0;
    efortMediuNegasite = 0;
    efortMaxNegasite = 0;
    nrOP = 0;
    nrElemGasite = 0;
    nrElemNegasite = 0;
}

void perf() {
    ofstream fout("tabel.csv");

    double factorUmplere = 0.95;
    double vFactorUmplere[] = {0.8, 0.85, 0.9, 0.95, 0.99};
    int size = sizeof(vFactorUmplere) / sizeof(vFactorUmplere[0]);
    double factorUmplereBeforeDelete = 0.99;
    double factorUmplereAfterDelete = 0.8;

    int elements[N];
    int mElementeDeCautat[mElem];

    fout << "\nEvaluarea operatiei de cautare pentru un singur factor de umplere de 95%\n";
    fout << "\nFactor de umplere, Efort mediu gasite, Efort maxim gasite, Efort mediu negasite, Efort maxim negasite\n";

    reset();

    for(int test = 0; test < NR_TESTS; test++) {
        int n = (double)N * factorUmplere;
        HashTable T = {NULL};
        T.m = N;

        int a[40000] = {0};

        for(int i = 0; i < n; i++) {
            int nrDeAdaugat = rand() % 40000;

            while(a[nrDeAdaugat] != 0) {
                nrDeAdaugat = rand() % 40000;
            }
            a[nrDeAdaugat] = 1;

            int rHashTable = hashInsert(T, Entry(nrDeAdaugat, ""));

            if(rHashTable != -1) {
                elements[i] = nrDeAdaugat;
                i++;
            }
        }
        FillRandomArray(mElementeDeCautat, mElem, 40000, 50000, false);

        for(int i = 0; i < mElem / 2; i ++) {
            mElementeDeCautat[i] = elements[i];
        }

        for(int i = 0; i < mElem; i++) {
            nrOP = 0;
            int rHashSearch = hashSearch(T, Entry(mElementeDeCautat[i], "HT"));

            if(rHashSearch == -1) {
                nrElemNegasite++;
                efortMediuNegasite += nrOP;
                if(efortMaxNegasite < nrOP) {
                    efortMaxNegasite = nrOP;
                }
            } else {
                nrElemGasite++;
                efortMediuGasite += nrOP;
                if(efortMaxGasite < nrOP) {
                    efortMaxGasite = nrOP;
                }
            }
        }
    }
    if(nrElemGasite > 0) {
        efortMediuGasite = efortMediuGasite / nrElemGasite;
    }
    if(nrElemNegasite > 0) {
        efortMediuNegasite = efortMediuNegasite / nrElemNegasite;
    }

    fout << factorUmplere << ", " << efortMediuGasite << ", " << efortMaxGasite <<  ", " << efortMediuNegasite << ", " << efortMaxNegasite << '\n';

    fout << "\nCompletarea evaluarii pentru toti factorii de umplere\n";
    fout << "\nFactor de umplere, Efort mediu gasite, Efort maxim gasite, Efort mediu negasite, Efort maxim negasite\n";

    for(int iFactor = 0; iFactor < size; iFactor++) {
        reset();
        for(int test = 0; test < NR_TESTS; test++) {
            int n = (double) N * vFactorUmplere[iFactor];
            HashTable T = {NULL};
            T.m = N;

            int a[40000] = {0};

            for(int i = 0; i < n; i++) {
                int nrDeAdaugat = rand() % 40000;

                while(a[nrDeAdaugat] != 0) {
                    nrDeAdaugat = rand() % 40000;
                }
                a[nrDeAdaugat] = 1;

                int rHashTable = hashInsert(T, Entry(nrDeAdaugat, ""));

                if(rHashTable != -1) {
                    elements[i] = nrDeAdaugat;
                    i++;
                }
            }
            FillRandomArray(mElementeDeCautat, mElem, 40000, 50000, false);

            for(int i = 0; i < mElem / 2; i ++) {
                mElementeDeCautat[i] = elements[(n / mElem) * i];
            }

            for(int i = 0; i < mElem; i++) {
                nrOP = 0;

                int rHashSearch = hashSearch(T, Entry(mElementeDeCautat[i], "HT"));

                if(rHashSearch == -1) {
                    nrElemNegasite++;
                    efortMediuNegasite += nrOP;
                    if(efortMaxNegasite < nrOP) {
                        efortMaxNegasite = nrOP;
                    }
                } else {
                    nrElemGasite++;
                    efortMediuGasite += nrOP;
                    if(efortMaxGasite < nrOP) {
                        efortMaxGasite = nrOP;
                    }
                }
            }
        }
        if(nrElemGasite > 0) {
            efortMediuGasite = efortMediuGasite / nrElemGasite;
        }

        if(nrElemNegasite > 0) {
            efortMediuNegasite = efortMediuNegasite / nrElemNegasite;
        }

        fout << vFactorUmplere[iFactor] << ", " << efortMediuGasite << ", " << efortMaxGasite << ", " << efortMediuNegasite << ", " << efortMaxNegasite << "\n";
    }

    fout << "\nEvaluarea operatiei de cautare dupa stergerea unor elemente\n";
    fout << "\nFactor de umplere, Efort mediu gasite, Efort maxim gasite, Efort mediu negasite, Efort maxim negasite \n";

    reset();

    for(int test = 0; test < NR_TESTS; test++) {
        int n = (double) N * factorUmplereBeforeDelete;
        int nF = (double) N * factorUmplereAfterDelete;

        HashTable T = {NULL};
        T.m = N;

        int a[40000] = {0};
        for(int i = 0; i < n; i++) {
            int nrDeAdaugat = rand() % 40000;

            while(a[nrDeAdaugat] != 0) {
                nrDeAdaugat = rand() % 40000;
            }
            a[nrDeAdaugat] = 1;

            int rHashTable = hashInsert(T, Entry(nrDeAdaugat, ""));

            if(rHashTable != -1) {
                elements[i] = nrDeAdaugat;
                i++;
            }
        }
        FillRandomArray(mElementeDeCautat, mElem, 40000, 50000, false);

        for(int i = n - 1; i >= nF; i--) {
            int elemDeSters = rand() % i;

            hashDelete(T, hashSearch(T, Entry(elements[elemDeSters], "")));
            elements[elemDeSters] = -1;
            swap(elements[elemDeSters], elements[i]);
        }

        for(int i = 0; i < mElem; i += 2) {
            mElementeDeCautat[i] = elements[(nF / mElem) * i];
        }

        for(int i = 0; i < mElem; i++) {
            nrOP = 0;
            int rHashSearch = hashSearch(T, Entry(mElementeDeCautat[i], "HT"));

            if(rHashSearch == -1) {
                nrElemNegasite++;
                efortMediuNegasite += nrOP;
                if(efortMaxNegasite < nrOP) {
                    efortMaxNegasite = nrOP;
                }
            } else {
                nrElemGasite++;
                efortMediuGasite += nrOP;
                if(efortMaxGasite < nrOP) {
                    efortMaxGasite = nrOP;
                }
            }
        }
    }
    if(nrElemNegasite > 0) {
        efortMediuGasite = efortMediuNegasite / nrElemNegasite;
    }

    if(nrElemNegasite > 0) {
        efortMediuNegasite = efortMediuNegasite / nrElemNegasite;
    }

    fout << factorUmplereAfterDelete << ", " << efortMediuGasite << ", " << efortMaxGasite << ", " << efortMediuNegasite << ", " << efortMaxNegasite << "\n";
}

int main() {
    //perf();
    demo();
}