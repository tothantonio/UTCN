#include <iostream>
#include <cstring>
using namespace std;

#define c1 1
#define c2 1
#define N 10000

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
            cout << T.T[i]->id << " " << T.T[i]->name << " | ";
        else
            cout << "NULL" << " | ";
    }
    cout << "\n";
}

int main()
{
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
    return 0;
}
