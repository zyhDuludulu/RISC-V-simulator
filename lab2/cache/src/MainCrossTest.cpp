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
replacementPolicy replacementPolicyList[] = { RRIP, LRU };
std::string replacementPolicyString[] = { "RRIP", "LRU" };
inclusionPolicy inclusionPolicyList[] = { INCLUSIVE, EXCLUSIVE, NONINCLUSIVE };
std::string inlcusionPolicyString[] = { "INCLUSIVE", "EXCLUSIVE", "NON-INCLUSIVE" };

int main(int argc, char** argv) {
    if (!parseParameters(argc, argv)) {
        printUsage();
        //return -1;
    }
    traceFilePath = "D:/Course/CS211/cs211-lab/lab2/cache/cache-trace/cross.trace";
    for (int i = 0; i < 2; ++i) {
        for (int j = 0; j < 3; ++j) {
            for (int k = 0; k < 2; ++k) {
                replacementPolicy l1replacementPolicy = replacementPolicyList[i];
                replacementPolicy l2replacementPolicy = replacementPolicyList[k];
                inclusionPolicy inclusionPolicy = inclusionPolicyList[j];
                std::cout << "\nL1 Policy: " << replacementPolicyString[i]
                    << "  L2 Policy: " << replacementPolicyString[k]
                    << "  Inclusion Policy: " << inlcusionPolicyString[j] << std::endl;

                Cache::Policy l1policy, l2policy;
                l1policy.cacheSize = 2 * 1024;
                l1policy.blockSize = 16;
                l1policy.blockNum = 2 * 1024 / 16;
                l1policy.associativity = ASSOCIATIVITY;
                l1policy.hitLatency = 2;
                l1policy.missLatency = 8;
                l2policy.cacheSize = 8 * 1024;
                l2policy.blockSize = 16;
                l2policy.blockNum = 8 * 1024 / 16;
                l2policy.associativity = ASSOCIATIVITY;
                l2policy.hitLatency = 8;
                l2policy.missLatency = 100;


                // Initialize memory and cache
                MemoryManager* memory = nullptr;
                Cache* l1cache = nullptr, * l2cache = nullptr;
                memory = new MemoryManager();
                l2cache = new Cache(memory, l2policy);
                l1cache = new Cache(memory, l1policy, l2cache);
                l1cache->replacementPolicy = l1replacementPolicy;
                l2cache->replacementPolicy = l2replacementPolicy;
                l1cache->inclusionPolicy = inclusionPolicy;
                l2cache->inclusionPolicy = inclusionPolicy;
                memory->setCache(l1cache);

                // Read and execute trace in cache-trace/ folder
                std::ifstream trace(traceFilePath);
                if (!trace.is_open()) {
                    printf("Unable to open file %s\n", traceFilePath);
                    exit(-1);
                }

                char type; //'r' for read, 'w' for write
                uint32_t addr;
                uint32_t nowPos = 0;

                int i = 1;
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
            }
        }
    }
    
    return 0;
}

bool parseParameters(int argc, char** argv) {
    // Read Parameters
    if (argc > 1) {
        traceFilePath = argv[1];
        return true;
    }
    else {
        return false;
    }
}

void printUsage() { printf("Usage: CacheSim trace-file\n"); }