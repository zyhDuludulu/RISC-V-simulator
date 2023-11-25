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
#include <algorithm>

#include "Cache.h"
#include "Debug.h"
#include "MemoryManager.h"

bool parseParameters(int argc, char** argv);
void printUsage();

const char* traceFilePath;
replacementPolicy replacementPolicyList[] = { RRIP, LRU };
std::string replacementPolicyString[] = { "RRIP", "LRU" };
replacementPolicy myRPolicy = LRU;
std::string myRPolicyString;

int main(int argc, char** argv) {
    if (!parseParameters(argc, argv)) {
        printUsage();
        return -1;
    }
    std::cout << "replacement Policy: " << myRPolicyString << std::endl;
    //traceFilePath = "D:/Course/CS211/cs211-lab/lab2/cache/cache-trace/optimal.trace";
    Cache::Policy l1policy, l2policy;
    replacementPolicy rePolicy = myRPolicy;
    l1policy.cacheSize = 32 * 1024;
    l1policy.blockSize = 64;
    l1policy.blockNum = 32 * 1024 / 64;
    l1policy.associativity = ASSOCIATIVITY;
    l1policy.hitLatency = 2;
    l1policy.missLatency = 8;
    l2policy.cacheSize = 256 * 1024;
    l2policy.blockSize = 64;
    l2policy.blockNum = 256 * 1024 / 64;
    l2policy.associativity = ASSOCIATIVITY;
    l2policy.hitLatency = 8;
    l2policy.missLatency = 100;
    

    // Initialize memory and cache
    MemoryManager* memory = nullptr;
    Cache* l1cache = nullptr, * l2cache = nullptr;
    memory = new MemoryManager();
    l2cache = new Cache(memory, l2policy);
    l1cache = new Cache(memory, l1policy, l2cache);
    l1cache->rPolicy = rePolicy;
    l2cache->rPolicy = rePolicy;
    memory->setCache(l1cache);

    // Read and execute trace in cache-trace/ folder
    std::ifstream trace(traceFilePath);
    if (!trace.is_open()) {
        printf("Unable to open file %s\n", traceFilePath);
        exit(-1);
    }

    char type; //'r' for read, 'w' for write
    uint32_t addr;
    if (rePolicy == OPTIMAL) {
        std::ifstream trace1(traceFilePath);
        std::vector<uint32_t> addr_trace;
        uint32_t lenth = 0;
        while (trace1 >> type >> std::hex >> addr) {
            addr_trace.push_back(addr);
        }
        lenth = addr_trace.size();
        l1cache->addr_trace = addr_trace;
        l2cache->addr_trace = addr_trace;
        l1cache->lenth = lenth;
        l2cache->lenth = lenth;
    }
    uint32_t nowPos = 0;
    
    while (trace >> type >> std::hex >> addr) {
        if (rePolicy == OPTIMAL) {
            l1cache->addrPos = nowPos;
            l2cache->addrPos = nowPos;
            nowPos++;
        }
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
            std::string* index = std::find(replacementPolicyString, 
                replacementPolicyString + sizeof(replacementPolicyString) / sizeof(replacementPolicyString[0]),
                argv[2]);
            myRPolicy = replacementPolicyList[index - replacementPolicyString];
            myRPolicyString = replacementPolicyString[index - replacementPolicyString];
        }
        return true;
    }
    else {
        return false;
    }
}

void printUsage() { printf("Usage: CacheSim trace-file\n"); }