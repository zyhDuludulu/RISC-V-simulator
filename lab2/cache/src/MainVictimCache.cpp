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
bool with_victim = false;

int main(int argc, char** argv) {
    if (!parseParameters(argc, argv)) {
        printUsage();
        return -1;
    }
    //traceFilePath = "D:/Course/CS211/cs211-lab/lab2/cache/cache-trace/victim.trace";
    if (with_victim)
        std::cout << "with victim cache" << std::endl;
    else
        std::cout << "without victim cache" << std::endl;

    Cache::Policy l1policy, l2policy, victpolicy;
    l1policy.cacheSize = 2 * 1024;
    l1policy.blockSize = 64;
    l1policy.blockNum = 2 * 1024 / 64;
    l1policy.associativity = 8;
    l1policy.hitLatency = 2;
    l1policy.missLatency = 8;

    l2policy.cacheSize = 32 * 1024;
    l2policy.blockSize = 64;
    l2policy.blockNum = 32 * 1024 / 64;
    l2policy.associativity = 8;
    l2policy.hitLatency = 8;
    l2policy.missLatency = 100;

    victpolicy.cacheSize = 1024;
    victpolicy.blockSize = 64;
    victpolicy.blockNum = 1024 / 64;
    victpolicy.associativity = victpolicy.blockNum;
    victpolicy.hitLatency = 1;
    victpolicy.missLatency = 1;

    // Initialize memory and cache
    MemoryManager* memory = nullptr;
    Cache* l1cache = nullptr, * l2cache = nullptr, * victcache = nullptr;
    memory = new MemoryManager();
    l2cache = new Cache(memory, l2policy);
    l1cache = new Cache(memory, l1policy, l2cache);
    victcache = new Cache(memory, victpolicy);
    if (with_victim)
        l1cache->victim = victcache;
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
    if (with_victim) {
        std::cout << "Victim cache Hit: " << l1cache->victim->statistics.numHit << std::endl;
        delete l1cache->victim;
    }

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
            std::string victString = argv[2];
            if (victString == std::string("V")) { with_victim = true; }
        }
        return true;
    }
    else {
        return false;
    }
}

void printUsage() { printf("Usage: CacheSim trace-file\n"); }