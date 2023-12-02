## Compile

```
mkdir build
cd build
cmake ..
make
```

## Test

Inclusion policy test
```
./InclusionPolicyTest ../cache-trace/inclusive.trace NON-INCLUSIVE
./InclusionPolicyTest ../cache-trace/inclusive.trace INCLUSIVE
./InclusionPolicyTest ../cache-trace/exclusive.trace NON-INCLUSIVE
./InclusionPolicyTest ../cache-trace/exclusive.trace EXCLUSIVE
```

Replacement policy test
```
./ReplacementPolicyTest ../cache-trace/optimal.trace LRU
./ReplacementPolicyTest ../cache-trace/optimal.trace RRIP
./ReplacementPolicyTest ../cache-trace/optimal.trace OPTIMAL
```

Victim cache test
```
./VictimCacheTest ../cache-trace/victim.trace
./VictimCacheTest ../cache-trace/victim.trace V
./VictimCacheTest ../cache-trace/conflict.trace
./VictimCacheTest ../cache-trace/conflict.trace V
```

Cross test
```
./CrossTest ../riscv-elf/quicksort.riscv
./CrossTest -v ../riscv-elf/quicksort.riscv
```




