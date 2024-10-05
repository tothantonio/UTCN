#include <iostream>
#include "Profiler.h"

Profiler profiler;

using namespace std;

void myFunc(int n) {
    for (int i = 0; i < n; i++) {
        Operation o = profiler.createOperation("O(N)", n);
        o.count();
        int a = 2 + 2;
    }
}

void myFunc2(int n) {
    Operation o = profiler.createOperation("100 * O(logN)", n);
    for (int i = 1; i < n; i *= 2) {
        for (int j = 0; j < 100; j++) {
            o.count();
            int a = 2 + 2;
        }
    }
}

void myFunc3(int n) {
    Operation o = profiler.createOperation("10 * O(N)", n);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j += 10) {
            o.count();
            int a = 2 + 2;
        }
    }
}

void myFunc4(int n) {
    Operation o = profiler.createOperation("O(NlogN)", n);
    for (int i = 0; i < n; i++) {
        for (int j = 1; j < n; j *= 2) {
            o.count();
            int a = 2 + 2;
        }
    }
}

void myFunc5(int n) {
    Operation o = profiler.createOperation("0.1 * O(N^2)", n);
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            o.count();
            int a = 2 + 2;
            j += 10;
        }
    }
}

void myFunc6(int n) {
    Operation o = profiler.createOperation("0.01 * O(N^3)", n);
    for (int i = 0; i < n; i += 10) {
        for (int j = 0; j < n; j += 10) {
            for (int k = 0; k < n; k += 10) {
                o.count();
                int a = 2 + 2;
            }
        }
    }
}

int main() {
    for (int n = 100; n <= 1000; n += 100) {
        myFunc(n);
        myFunc2(n);
        myFunc3(n);
        myFunc4(n);
        myFunc5(n);
        myFunc6(n);
    }

    profiler.createGroup("O(N)", "O(N)");
    profiler.createGroup("O(NlogN)", "O(NlogN)");
    profiler.createGroup("10 * O(N)", "10 * O(N)");
    profiler.createGroup("100 * O(logN)", "100 * O(logN)");
    profiler.createGroup("0.1 * O(N^2)", "0.1 * O(N^2)");
    profiler.createGroup("0.01 * O(N^3)", "0.01 * O(N^3)");

    profiler.createGroup("COMPLEXITY", "O(N)", "O(NlogN)",
                         "10 * O(N)", "100 * O(logN)",
                         "0.1 * O(N^2)", "0.01 * O(N^3)");

    profiler.showReport();

    return 0;
}
