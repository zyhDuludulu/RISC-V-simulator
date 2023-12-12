#include "lib.h"
int main() {
    int a = 10, b = 20, c = 30, d = 12345, e = 1, f = 2;
    int x = a + b;
    print_d(x);
    print_c('\n');
    int y = a - b;
    print_d(y);
    print_c('\n');
    print_s("trap begins here\n");
    syscall();
    print_s("trap ends here\n");
    x = d / c;
    print_d(x);
    print_c('\n');
    y = d << f;
    print_d(y); 
    print_c('\n');
    z = d >> 4;
    print_d(z);
    print_c('\n');
    exit_proc();
}