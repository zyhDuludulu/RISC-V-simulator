#include "lib.h"

int main() {
    int a = 25;
    fcvtsw(a);

    a = 123;
    fcvtsw(a);

    a = 59;
    fcvtsw(a);

    exit_proc();
}