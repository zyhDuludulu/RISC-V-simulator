## Compile

```
mkdir build
cd build
cmake ..
make
```


## Test
```
./Simulator ../riscv-elf/test_trap.riscv ../riscv-elf/kernel.riscv
```

## Usage

```
./Simulator riscv-elf-file-name [-v] [-s] [-d] [-b strategy]
```
Parameters:

1. `-v` for verbose output, can redirect output to file for further analysis
2. `-s` for single step execution, often used in combination with `-v`.
3. `-d` for creating memory and register history dump in `dump.txt`
4. `-b` for branch perdiction strategy (default `BTFNT`), accepted parameters are `AT`, `NT`, `BTFNT` and `BPB`.
   * AT: Always Taken
   * NT: Always Not Taken
   * BTFNT: Back Taken Forward Not Taken
   * BPB: Branch Prediction Buffer (2 bit history information)

There are a number of reference RISC-V ELFs and its corresponding assembly code in the `riscv-elf/` folder.