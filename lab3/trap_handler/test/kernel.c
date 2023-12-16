#include "lib.h"

int main() {
	int a[20];
	int c = 0;
	for (int i = 0; i < 20; ++i) {
		a[i] = 30;
	}
	a[0] = 0;
	a[4] = 40;
	a[6] = 60;
	a[10] = 100;
	a[11] = 110;
	a[13] = 130;
	a[15] = 150;
	a[18] = 180;
	print_s("elements in array: ");
	for (int i = 0; i < 20; ++i) {
		print_d(a[i]);
		print_c(' ');
		if (a[i] > c) {
			c = a[i];
		}
	}
	print_s("\nThe largest number is: ");
	print_d(c);
	print_c('\n');
}
