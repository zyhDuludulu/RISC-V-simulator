/**
 * Simple implementation of common library functions
 */

#include "lib.h"

void print_d(int num)
{
    asm("li a7, 2;"
        "scall");
}

void print_s(const char *str)
{
    asm("li a7, 0;"
        "scall");
}

void print_c(char ch)
{
    asm("li a7, 1;"
        "scall");
}

void exit_proc() {
    asm("li a7, 3;"
        "scall");
}

char read_char()
{
    char result;
    asm("li a7, 4;"
        "scall");
    asm("addi %0, a0, 0" : "=r" (result));
    return result;
}

long long read_num()
{
    long long result;
    asm("li a7, 5;"
        "scall");
    asm("addi %0, a0, 0" : "=r" (result));
    return result;
}

void print_f(float num)
{
    asm("li a7, 6;"
        "scall");
}

// MY CODE HERE


void fsqrt(float num) {
    float fp_rslt;
    asm(
        "fsqrt.s %0, %1;"
        : "=f" (fp_rslt)
        : "f" (num)
    );
    print_f(fp_rslt);
    print_c('\n');
}

void fmvxw(float num) {
    int result;
    asm(
        "fmv.x.w %0, %1;"
        : "=r" (result)
        : "f" (num)
    );
    print_d(result);
    print_c('\n');
}

void fmvwx(int num) {
    float result;
    asm(
        "fmv.w.x %0, %1;"
        : "=f" (result)
        : "r" (num)
    );
    print_f(result);
    print_c('\n');
}

void fcvtws(float num) {
    int result;
    asm(
        "fcvt.w.s %0, %1"
        : "=r" (result)
        : "f" (num)
    );
    print_d(result);
    print_c('\n');
}

void fcvtsw(int num) {
    float fp_rslt;
    asm(
        "fcvt.s.w %0, %1;"
        : "=f" (fp_rslt)
        : "r" (num)
    );
    print_f(fp_rslt);
    print_c('\n');
}

void fmadds(float num1, float num2, float num3) {
    float fp_rslt;
    asm(
        "fmadd.s %0, %1, %2, %3;"
        : "=f" (fp_rslt)
        : "f" (num1), "f" (num2), "f" (num3)
    );
    print_f(fp_rslt);
    print_c('\n');
}

void fmsubs(float num1, float num2, float num3) {
    float fp_rslt;
    asm(
        "fmsub.s %0, %1, %2, %3;"
        : "=f" (fp_rslt)
        : "f" (num1), "f" (num2), "f" (num3)
    );
    print_f(fp_rslt);
    print_c('\n');
}