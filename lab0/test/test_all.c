#include "lib.h"

int main() {
    float a, b, c;
    float f;
    int i;
    // fadd 5.794590
    a = 3.14159;
    b = 2.653;
    f = a + b;
    print_f(f);
    print_c('\n');

    // fsub 0.488590
    f = a - b;
    print_f(f);
    print_c('\n');

    // fmul 370.349976
    a = 3.0;
    b = 123.45;
    f = a * b;
    print_f(f);
    print_c('\n');

    // fdiv 41.149998
    f = b / a;
    print_f(f);
    print_c('\n');

    // fsqrt 5.012285
    a = 25.123;
    fsqrt(a);

    // fmvxw 145140000
    a = 773.798828;
    fmvxw(a);

    // fmvwx 3.141590
    i = 1078530000;
    fmvwx(i);

    // fcvtsw 95.000000
    i = 95;
    fcvtsw(i);

    // fcvtws 1565
    a = 1565.56;
    fcvtws(a);

    // fmadd 30.237497
    a = 9.65;
    b = 2.35;
    c = 7.56;
    fmadds(a, b, c);

    // fmsub 15.117498
    a = 9.65;
    b = 2.35;
    c = 7.56;
    fmsubs(a, b, c);

    exit_proc();
}