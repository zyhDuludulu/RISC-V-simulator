## Compile

```
mkdir build
cd build
cmake ..
make
```

## test

To test all the case:
```
./Simulator ../riscv-elf/test_all.riscv
```
The standard output of test_all.riscv should be:
```
5.794590
0.488590
370.349976
41.149998
5.012285
1145140000
3.141590
95.000000
1565
30.237497
15.117498
Program exit from an exit() system call
------------ STATISTICS -----------
Number of Instructions: 580
Number of Cycles: 1074
Avg Cycles per Instrcution: 1.8517
Branch Perdiction Accuacy: 0.5000 (Strategy: Always Not Taken)
Number of Control Hazards: 80
Number of Data Hazards: 369
Number of Memory Hazards: 8
-----------------------------------
```
Or you can test them respectively:
```
./Simulator ../riscv-elf/test_float.riscv
./Simulator ../riscv-elf/sqrt.riscv
./Simulator ../riscv-elf/fcvtsw.riscv
./Simulator ../riscv-elf/fcvtws.riscv
./Simulator ../riscv-elf/fmvwx.riscv
./Simulator ../riscv-elf/fmvxw.riscv
./Simulator ../riscv-elf/fmadd.riscv
./Simulator ../riscv-elf/fmsub.riscv
```
