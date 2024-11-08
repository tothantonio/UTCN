#include <iostream>
#include <fstream>
#include "Profiler.h"
using namespace std;

Profiler profiler;
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
    T.m = 10;
    hashInsert(T, Entry(1, "Ionel"));
    hashInsert(T, Entry(2, "Cosma"));
    hashInsert(T, Entry(3, "Leo"));
    hashInsert(T, Entry(9, "Cristi"));
    hashInsert(T, Entry(17, "Seb"));
    printHashTable(T);

    cout << "Persoana cu id 2: " << hashSearch(T, Entry(2, "Cosma")) << "\n";
    cout << "Delete id 17:\n";
    hashDelete(T, hashSearch(T, Entry(17, "Seb")) );
    printHashTable(T);
}

void perf() {
    double fillingFactor[] = {0.8, 0.85, 0.9, 0.95, 0.99};
    int nFF = sizeof(fillingFactor) / sizeof(fillingFactor[0]);
    for(int factor = 0; factor < nFF; factor++) {
        for(int test = 0; test < NR_TESTS; test++) {
            int n = (double) N * fillingFactor[factor];
            HashTable T;
            T.m = N;
            int a[40000] = {0};
            for(int i = 0; i < n; i++) {
                int num = rand() % 40000;

                while(a[num] != 0) {
                    num = rand() % 40000;
                }
                a[num] = 1;
                int rHashInsert = hashInsert(T, Entry(num, ""));
            }
        }
    }
}

int main() {
    demo();
}