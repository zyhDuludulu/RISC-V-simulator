/**
 * Entry point for the optimized cache
 *
 * Created by He, Hao at 2019/04/30
 */

#include <cstdint>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

#include "Cache.h"
#include "Debug.h"
#include "MemoryManager.h"

bool parseParameters(int argc, char** argv);
void printUsage();

const char* traceFilePath;
inclusionPolicy inclusionPolicyList[] = { INCLUSIVE, EXCLUSIVE, NONINCLUSIVE };
std::string inclusionPolicyString[] = { "INCLUSIVE", "EXCLUSIVE", "NON-INCLUSIVE" };
inclusionPolicy myIPolicy = NONINCLUSIVE;
std::string myIPolicyString;

int main(int argc, char** argv) {
    if (!parseParameters(argc, argv)) {
        printUsage();
        return -1;
    }
    if (myIPolicyString == "") {
        std::cout << "Wrong inclusion policy type!";
        return -1;
    }
    //inclusionPolicy testPolicy = EXCLUSIVE;
    std::cout << "inclusion Policy: " << myIPolicyString << std::endl;
    Cache::Policy l1policy, l2policy;
    // for inclusive cache valiation, we can let L2 cache has a smaller size than L1

    l1policy.cacheSize = 4;
    l1policy.blockSize = 2;
    l1policy.blockNum = 2;
    l1policy.associativity = 2;
    l1policy.hitLatency = 2;
    l1policy.missLatency = 8;
    l2policy.cacheSize = 16;
    l2policy.blockSize = 2;
    l2policy.blockNum = 8;
    l2policy.associativity = 2;
    l2policy.hitLatency = 8;
    l2policy.missLatency = 100;


    // Initialize memory and cache
    MemoryManager* memory = nullptr;
    Cache* l1cache = nullptr, * l2cache = nullptr;
    memory = new MemoryManager();
    l2cache = new Cache(memory, l2policy);
    l1cache = new Cache(memory, l1policy, l2cache);
    l2cache->setUpperCache(l1cache);
    l1cache->iPolicy = myIPolicy;
    l2cache->iPolicy = myIPolicy;
    memory->setCache(l1cache);

    // Read and execute trace in cache-trace/ folder
    std::ifstream trace(traceFilePath);
    if (!trace.is_open()) {
        printf("Unable to open file %s\n", traceFilePath);
        exit(-1);
    }

    char type; //'r' for read, 'w' for write
    uint32_t addr;
    while (trace >> type >> std::hex >> addr) {
        if (!memory->isPageExist(addr))
            memory->addPage(addr);
        switch (type) {
        case 'r':
            memory->getByte(addr);
            break;
        case 'w':
            memory->setByte(addr, 0);
            break;
        default:
            dbgprintf("Illegal type %c\n", type);
            exit(-1);
        }
    }

    // Output Simulation Results
    printf("L1 Cache:\n");
    l1cache->printStatistics();

    delete l1cache;
    delete l2cache;
    delete memory;
    return 0;
}

bool parseParameters(int argc, char** argv) {
    // Read Parameters
    if (argc > 1) {
        traceFilePath = argv[1];
        if (argc > 2) {
            std::string* index = std::find(inclusionPolicyString,
                inclusionPolicyString + sizeof(inclusionPolicyString) / sizeof(inclusionPolicyString[0]),
                argv[2]);
            myIPolicy = inclusionPolicyList[index - inclusionPolicyString];
            myIPolicyString = inclusionPolicyString[index - inclusionPolicyString];
        }
        return true;
    }
    else {
        return false;
    }
}

void printUsage() { printf("Usage: CacheSim trace-file\n"); }