#include "lib.h"

int main() {
    float a = 9.65, b = 2.35, c = 7.56;
    fmsubs(a, b, c);

    a = 2.00;
    b = 5.00;
    c = 7.00;
    fmsubs(a, b, c);

    exit_proc();
}