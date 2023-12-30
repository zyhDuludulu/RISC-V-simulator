#ifndef RISCV_SIMULATOR_LIB_H
#define RISCV_SIMULATOR_LIB_H

void print_d(int num);
void print_s(const char *str);
void print_c(char ch);

void exit_proc();

char read_char();
long long read_num();

void print_f(float num);

// MY CODE HERE
void fsqrt(float num);

void fmvxw(float num);

void fmvwx(int num);

void fcvtws(float num);

void fcvtsw(int num);

void fmadds(float num1, float num2, float num3);

void fmsubs(float num1, float num2, float num3);

#endif
