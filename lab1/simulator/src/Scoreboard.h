#ifndef SCOREBOARD_H
#define SCOREBOARD_H

enum {
    blank,
    intAdd,
    mul1,
    mul2,
    num_of_comp
};

enum {
    ISSUE,
    OPERANDS,
    COMPLETE_EXE,
    WRITE_BACK
};

struct FU {
    bool busy, Rj, Rk;
    uint32_t op, Fi, Fj, Fk, Qj, Qk;
    uint32_t instruction_status;
} fu;

class Scoreboard {
    public:
    uint32_t[] resultDepUnit[32] = {blank};
    fu[] fuStatus[num_of_comp];
}



#endif