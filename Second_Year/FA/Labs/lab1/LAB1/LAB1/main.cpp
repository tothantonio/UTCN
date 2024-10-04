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
	Operation o = profiler.createOperation("100 * O(logN)", n); // n = axa OX
	for (int i = 1; i < n; i *= 2) {
		for (int j = 0; j < 100; j++) {
			o.count();
			int a = 2 + 2;
		}
	}
}

void myFunc3(int n) {
	Operation o = profiler.createOperation("0.1 * O(N^2)", n); // n = axa OX
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			o.count();
			int a = 2 + 2;
			j += 10;
		}
	}
}
// fa si restul si pune pe toate la final intr un grafic 
// extra fa le sa arate bine
int main() {

	for (int n = 100; n <= 10000; n += 100) {
		myFunc(n);
		myFunc2(n);
		myFunc3(n);
	}
	profiler.showReport();
	return 0;
}