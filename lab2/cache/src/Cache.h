/*
 * Basic cache simulator
 *
 * Created by He, Hao on 2019-4-27
 */

#ifndef CACHE_H
#define CACHE_H

#include <cstdint>
#include <vector>

#include "MemoryManager.h"

class MemoryManager;
enum inclusionPolicy {
	INCLUSIVE,
	EXCLUSIVE,
	NONINCLUSIVE
};

#define ASSOCIATIVITY 8
enum replacementPolicy {
	LRU,
	RRIP,
	OPTIMAL
};

class Cache {
public:
	struct Policy {
		// In bytes, must be power of 2
		uint32_t cacheSize;
		uint32_t blockSize;
		uint32_t blockNum;
		uint32_t associativity;
		uint32_t hitLatency;  // in cycles
		uint32_t missLatency; // in cycles
	};

	struct Block {
		bool valid;
		bool modified;
		uint32_t tag;
		uint32_t id;
		uint32_t size;
		uint32_t lastReference;
		int64_t upperLevelBlockID = -1;
		uint32_t rrpv = ASSOCIATIVITY - 1;
		std::vector<uint8_t> data;
		Block() {}
		Block(const Block& b)
			: valid(b.valid), modified(b.modified), tag(b.tag), id(b.id),
			size(b.size), upperLevelBlockID(b.upperLevelBlockID) {
			data = b.data;
		}
	};

	struct Statistics {
		uint32_t numRead;
		uint32_t numWrite;
		uint32_t numHit;
		uint32_t numMiss;
		uint64_t totalCycles;
	};

	Cache(MemoryManager* manager, Policy policy, Cache* lowerCache = nullptr,
		bool writeBack = true, bool writeAllocate = true);

	bool inCache(uint32_t addr);
	uint32_t getBlockId(uint32_t addr);
	uint8_t getByte(uint32_t addr, uint32_t* cycles = nullptr);
	void setByte(uint32_t addr, uint8_t val, uint32_t* cycles = nullptr);
	void setUpperCache(Cache* upperCache) {
		this->upperCache = upperCache;
	}

	void printInfo(bool verbose);
	void printStatistics();
	uint32_t getVictimBlockId(uint32_t addr);

	Statistics statistics;
	inclusionPolicy iPolicy = NONINCLUSIVE;
	replacementPolicy rPolicy = LRU;
	std::vector<uint32_t> addr_trace;
	uint32_t lenth;
	uint32_t addrPos = 0; // after the current addr
	bool isFound[ASSOCIATIVITY];
	Cache* victim = nullptr;
	uint32_t victim_index = 0;

private:
	uint32_t referenceCounter;
	bool writeBack;     // default true
	bool writeAllocate; // default true
	MemoryManager* memory;
	Cache* lowerCache;
	Cache* upperCache = nullptr;
	Policy policy;
	std::vector<Block> blocks;

	void initCache();
	void loadBlockFromLowerLevel(uint32_t addr, uint32_t* cycles = nullptr);
	uint32_t getReplacementBlockId(uint32_t begin, uint32_t end);
	void writeBlockToLowerLevel(Block& b);

	// Utility Functions
	bool isPolicyValid();
	bool isPowerOfTwo(uint32_t n);
	uint32_t log2i(uint32_t val);
	uint32_t getTag(uint32_t addr);
	uint32_t getId(uint32_t addr);
	uint32_t getOffset(uint32_t addr);
	uint32_t getAddr(Block& b);
};

#endif