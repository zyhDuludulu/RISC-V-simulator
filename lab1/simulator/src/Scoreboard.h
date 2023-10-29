#ifndef SCOREBOARD_H
#define SCOREBOARD_H
#define NO false
#define YES true

enum fuType {
    blank,
    intAdd,
    mul1,
    mul2,
    num_of_comp
};

enum instStatus {
    BLANK,
    ISSUE,
    OPERANDS,
    COMPLETE_EXE,
    WRITE_BACK
};

struct FU {
    bool busy = NO, Rj = YES, Rk = YES;
    uint32_t op = fuType::blank, Fi = 33, Fj = 33, Fk = 33, Qj = fuType::blank, Qk = fuType::blank;
    uint32_t instruction_status = instStatus::BLANK;
    uint32_t time;
} fu;

class Scoreboard {
public:
    uint32_t resultDepUnit[32] = { fuType::blank };         // store where each uncompleted data come from
    FU fuList[fuType::num_of_comp];                         // FU list
    uint32_t fuStatus[fuType::num_of_comp] = { instStatus::BLANK };     // store which stage the FU is in (only useful when the FU is busy)
    Scoreboard() {
        for (uint32_t i = 0; i < num_of_comp; i++) { fuList[i].op = i; }
    }
    ~Scoreboard() {}
};

#endif