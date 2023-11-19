/*
 * Implementation of a simple cache simulator
 *
 * Created By He, Hao in 2019-04-27
 */

#include <cstdio>
#include <cstdlib>

#include "Cache.h"

Cache::Cache(MemoryManager* manager, Policy policy, Cache* lowerCache,
	bool writeBack, bool writeAllocate) {
	this->referenceCounter = 0;
	this->memory = manager;
	this->policy = policy;
	this->lowerCache = lowerCache;
	if (!this->isPolicyValid()) {
		fprintf(stderr, "Policy invalid!\n");
		exit(-1);
	}
	this->initCache();
	this->statistics.numRead = 0;
	this->statistics.numWrite = 0;
	this->statistics.numHit = 0;
	this->statistics.numMiss = 0;
	this->statistics.totalCycles = 0;
	this->writeBack = writeBack;
	this->writeAllocate = writeAllocate;
}

bool Cache::inCache(uint32_t addr) {
	return getBlockId(addr) != -1 ? true : false;
}

uint32_t Cache::getBlockId(uint32_t addr) {
	uint32_t tag = this->getTag(addr);
	uint32_t id = this->getId(addr);
	// printf("0x%x 0x%x 0x%x\n", addr, tag, id);
	// iterate over the given set
	for (uint32_t i = id * policy.associativity;
		i < (id + 1) * policy.associativity; ++i) {
		if (this->blocks[i].id != id) {
			fprintf(stderr, "Inconsistent ID in block %d\n", i);
			exit(-1);
		}
		if (this->blocks[i].valid && this->blocks[i].tag == tag) {
			return i;
		}
	}
	return -1;
}

uint8_t Cache::getByte(uint32_t addr, uint32_t* cycles) {
	this->referenceCounter++;
	this->statistics.numRead++;

	// If in cache, return directly
	int blockId;
	if ((blockId = this->getBlockId(addr)) != -1) {
		uint32_t offset = this->getOffset(addr);
		this->statistics.numHit++;
		this->statistics.totalCycles += this->policy.hitLatency;
		this->blocks[blockId].lastReference = this->referenceCounter;
		this->blocks[blockId].rrpv = 0;
		if (cycles) *cycles = this->policy.hitLatency;
		//if (this->lowerCache != nullptr)
		//	std::cout << "hit!" << std::endl;
		return this->blocks[blockId].data[offset];
	}
	//if (this->lowerCache != nullptr)
	//	std::cout << "miss! " << std::endl;
	// Else, find the data in memory or other level of cache
	this->statistics.numMiss++;
	this->statistics.totalCycles += this->policy.missLatency;
	this->loadBlockFromLowerLevel(addr, cycles);

	// The block is in top level cache now, return directly
	if ((blockId = this->getBlockId(addr)) != -1) {
		uint32_t offset = this->getOffset(addr);
		this->blocks[blockId].lastReference = this->referenceCounter;
		return this->blocks[blockId].data[offset];
	}
	else {
		fprintf(stderr, "Error: data not in top level cache!\n");
		exit(-1);
	}
}

void Cache::setByte(uint32_t addr, uint8_t val, uint32_t* cycles) {
	this->referenceCounter++;
	this->statistics.numWrite++;

	// If in cache, write to it directly
	int blockId;
	if ((blockId = this->getBlockId(addr)) != -1) {
		uint32_t offset = this->getOffset(addr);
		this->statistics.numHit++;
		this->statistics.totalCycles += this->policy.hitLatency;
		this->blocks[blockId].modified = true;
		this->blocks[blockId].lastReference = this->referenceCounter;
		this->blocks[blockId].data[offset] = val;
		this->blocks[blockId].rrpv = 0;
		if (!this->writeBack) {
			this->writeBlockToLowerLevel(this->blocks[blockId]);
			this->statistics.totalCycles += this->policy.missLatency;
		}
		if (cycles) *cycles = this->policy.hitLatency;
		return;
	}

	// Else, load the data from cache
	// TODO: implement bypassing
	this->statistics.numMiss++;
	this->statistics.totalCycles += this->policy.missLatency;

	if (this->writeAllocate) {
		this->loadBlockFromLowerLevel(addr, cycles);

		if ((blockId = this->getBlockId(addr)) != -1) {
			uint32_t offset = this->getOffset(addr);
			this->blocks[blockId].modified = true;
			this->blocks[blockId].lastReference = this->referenceCounter;
			this->blocks[blockId].data[offset] = val;
			return;
		}
		else {
			fprintf(stderr, "Error: data not in top level cache!\n");
			exit(-1);
		}
	}
	else {
		if (this->lowerCache == nullptr) {
			this->memory->setByteNoCache(addr, val);
		}
		else {
			this->lowerCache->setByte(addr, val);
		}
	}
}

void Cache::printInfo(bool verbose) {
	printf("---------- Cache Info -----------\n");
	printf("Cache Size: %d bytes\n", this->policy.cacheSize);
	printf("Block Size: %d bytes\n", this->policy.blockSize);
	printf("Block Num: %d\n", this->policy.blockNum);
	printf("Associativiy: %d\n", this->policy.associativity);
	printf("Hit Latency: %d\n", this->policy.hitLatency);
	printf("Miss Latency: %d\n", this->policy.missLatency);

	if (verbose) {
		for (int j = 0; j < this->blocks.size(); ++j) {
			const Block& b = this->blocks[j];
			printf("Block %d: tag 0x%x id %d %s %s (last ref %d)\n", j, b.tag, b.id,
				b.valid ? "valid" : "invalid",
				b.modified ? "modified" : "unmodified", b.lastReference);
			// printf("Data: ");
			// for (uint8_t d : b.data)
			// printf("%d ", d);
			// printf("\n");
		}
	}
}

void Cache::printStatistics() {
	printf("-------- STATISTICS ----------\n");
	printf("Num Read: %d\n", this->statistics.numRead);
	printf("Num Write: %d\n", this->statistics.numWrite);
	printf("Num Hit: %d\n", this->statistics.numHit);
	printf("Num Miss: %d\n", this->statistics.numMiss);
	printf("Total Cycles: %llu\n", this->statistics.totalCycles);
	if (this->lowerCache != nullptr) {
		printf("---------- LOWER CACHE ----------\n");
		this->lowerCache->printStatistics();
	}
}

bool Cache::isPolicyValid() {
	if (!this->isPowerOfTwo(policy.cacheSize)) {
		fprintf(stderr, "Invalid Cache Size %d\n", policy.cacheSize);
		return false;
	}
	if (!this->isPowerOfTwo(policy.blockSize)) {
		fprintf(stderr, "Invalid Block Size %d\n", policy.blockSize);
		return false;
	}
	if (policy.cacheSize % policy.blockSize != 0) {
		fprintf(stderr, "cacheSize %% blockSize != 0\n");
		return false;
	}
	if (policy.blockNum * policy.blockSize != policy.cacheSize) {
		fprintf(stderr, "blockNum * blockSize != cacheSize\n");
		return false;
	}
	if (policy.blockNum % policy.associativity != 0) {
		fprintf(stderr, "blockNum %% associativity != 0\n");
		return false;
	}
	return true;
}

void Cache::initCache() {
	this->blocks = std::vector<Block>(policy.blockNum);
	for (uint32_t i = 0; i < this->blocks.size(); ++i) {
		Block& b = this->blocks[i];
		b.valid = false;
		b.modified = false;
		b.size = policy.blockSize;
		b.tag = 0;
		b.id = i / policy.associativity;
		b.lastReference = 0;
		b.data = std::vector<uint8_t>(b.size);
	}
}

void Cache::loadBlockFromLowerLevel(uint32_t addr, uint32_t* cycles) {
	// non-inclusive
	uint32_t blockSize = this->policy.blockSize;

	// Initialize new block from memory
	Block b;
	b.valid = true;
	b.modified = false;
	b.tag = this->getTag(addr);
	b.id = this->getId(addr);
	b.size = blockSize;
	b.data = std::vector<uint8_t>(b.size);
	uint32_t bits = this->log2i(blockSize);
	uint32_t mask = ~((1 << bits) - 1);
	uint32_t blockAddrBegin = addr & mask;
	for (uint32_t i = blockAddrBegin; i < blockAddrBegin + blockSize; ++i) {
		if (this->lowerCache == nullptr) { // Last level cache
			b.data[i - blockAddrBegin] = this->memory->getByteNoCache(i);
			if (cycles) *cycles = 100; // latency from disk
		}
		else {
			b.data[i - blockAddrBegin] = this->lowerCache->getByte(i, cycles);
			lowerCache->blocks[lowerCache->getBlockId(i)].upperLevelBlockID = b.id; // for inclusive
			if (this->inclusionPolicy == EXCLUSIVE) {
				lowerCache->blocks[lowerCache->getBlockId(i)].valid = false;
			}
		} 
	}

	// Find replace block
	uint32_t id = this->getId(addr);
	uint32_t blockIdBegin = id * this->policy.associativity;
	uint32_t blockIdEnd = (id + 1) * this->policy.associativity;
	uint32_t replaceId = this->getReplacementBlockId(blockIdBegin, blockIdEnd);
	Block replaceBlock = this->blocks[replaceId];
	if (inclusionPolicy == INCLUSIVE && this->upperCache != nullptr && replaceBlock.upperLevelBlockID != -1) { // Back invalidation
		Block upperreplaceBlock = this->upperCache->blocks[replaceBlock.upperLevelBlockID];
		if (upperCache->writeBack && upperreplaceBlock.valid && upperreplaceBlock.modified) {
			upperCache->writeBlockToLowerLevel(upperreplaceBlock);
			upperCache->statistics.totalCycles += upperCache->policy.missLatency;
		}
		this->upperCache->blocks[replaceBlock.upperLevelBlockID].valid = false;
	}
	if (inclusionPolicy == EXCLUSIVE && this->upperCache == nullptr && this->lowerCache != nullptr) {
		uint32_t lowerid = this->lowerCache->getId(addr);
		uint32_t lowerblockIdBegin = lowerid * this->lowerCache->policy.associativity;
		uint32_t lowerblockIdEnd = (lowerid + 1) * this->lowerCache->policy.associativity;
		uint32_t lowerreplaceId = this->lowerCache->getReplacementBlockId(lowerblockIdBegin, lowerblockIdEnd);
		Block lowerreplaceBlock = this->lowerCache->blocks[lowerreplaceId]; 
		if (lowerCache->writeBack && lowerreplaceBlock.valid && lowerreplaceBlock.modified) {
			lowerCache->writeBlockToLowerLevel(lowerreplaceBlock);
			lowerCache->statistics.totalCycles += lowerCache->policy.missLatency;
		}
		this->lowerCache->blocks[lowerreplaceId] = replaceBlock;
	}
	if (this->writeBack && replaceBlock.valid && replaceBlock.modified) { // write back to memory
		this->writeBlockToLowerLevel(replaceBlock);
		this->statistics.totalCycles += this->policy.missLatency;
	}
	this->blocks[replaceId].upperLevelBlockID = -1; // for inclusive

	this->blocks[replaceId] = b;
}

uint32_t Cache::getReplacementBlockId(uint32_t begin, uint32_t end) {
	// Find invalid block first
	for (uint32_t i = begin; i < end; ++i) {
		if (!this->blocks[i].valid)
			return i;
	}

	// Otherwise use LRU
	if (this->replacementPolicy == LRU) {
		uint32_t resultId = begin;
		uint32_t min = this->blocks[begin].lastReference;
		for (uint32_t i = begin; i < end; ++i) {
			if (this->blocks[i].lastReference < min) {
				resultId = i;
				min = this->blocks[i].lastReference;
			}
		}
		return resultId;
	}
	else if (this->replacementPolicy == RRIP) {
		uint32_t resultId = begin;
		bool flag = true;
		while (flag) {
			for (uint32_t i = begin; i < end; ++i) {
				if (this->blocks[i].rrpv == ASSOCIATIVITY - 1) {
					resultId = i;
					flag = false;
					break;
				}
			}
			for (uint32_t i = begin; i < end; ++i) { this->blocks[i].rrpv++; }
		}
		return resultId;
	}
	else if (this->replacementPolicy == OPTIMAL) {
		uint32_t step = 0;
		uint32_t nowPos = this->addrPos;
		uint32_t numOfAddrFound = 0;
		//std::cout << nowPos << " " << std::endl;
		memset(this->isFound, false, ASSOCIATIVITY);
		while (nowPos < this->lenth && step++ < 1000) {
			uint32_t blockId = this->getBlockId(this->addr_trace[nowPos++]);
			if (blockId == -1) { continue; }
			for (uint32_t i = begin; i < end; ++i) {
				if (numOfAddrFound >= ASSOCIATIVITY - 1) {
					for (uint32_t j = 0; j < ASSOCIATIVITY; ++j) {
						if (!isFound[j]) { return j + begin; }
					}
				}
				if (i == blockId && !isFound[i - begin]) {
					numOfAddrFound++;
					isFound[i - begin] = true;
					break;
				}
			}
		}
		for (uint32_t j = 0; j < ASSOCIATIVITY; ++j) {
			if (!isFound[j]) { return j + begin; }
		}
		return begin;
	}
}

void Cache::writeBlockToLowerLevel(Cache::Block& b) {
	uint32_t addrBegin = this->getAddr(b);
	if (this->lowerCache == nullptr) {
		for (uint32_t i = 0; i < b.size; ++i) {
			this->memory->setByteNoCache(addrBegin + i, b.data[i]);
		}
	}
	else {
		for (uint32_t i = 0; i < b.size; ++i) {
			this->lowerCache->setByte(addrBegin + i, b.data[i]);
		}
	}
}

bool Cache::isPowerOfTwo(uint32_t n) { return n > 0 && (n & (n - 1)) == 0; }

uint32_t Cache::log2i(uint32_t val) {
	if (val == 0)
		return uint32_t(-1);
	if (val == 1)
		return 0;
	uint32_t ret = 0;
	while (val > 1) {
		val >>= 1;
		ret++;
	}
	return ret;
}

uint32_t Cache::getTag(uint32_t addr) {
	uint32_t offsetBits = log2i(policy.blockSize);
	uint32_t idBits = log2i(policy.blockNum / policy.associativity);
	uint32_t mask = (1 << (32 - offsetBits - idBits)) - 1;
	return (addr >> (offsetBits + idBits)) & mask;
}

uint32_t Cache::getId(uint32_t addr) {
	uint32_t offsetBits = log2i(policy.blockSize);
	uint32_t idBits = log2i(policy.blockNum / policy.associativity);
	uint32_t mask = (1 << idBits) - 1;
	return (addr >> offsetBits) & mask;
}

uint32_t Cache::getOffset(uint32_t addr) {
	uint32_t bits = log2i(policy.blockSize);
	uint32_t mask = (1 << bits) - 1;
	return addr & mask;
}

uint32_t Cache::getAddr(Cache::Block& b) {
	uint32_t offsetBits = log2i(policy.blockSize);
	uint32_t idBits = log2i(policy.blockNum / policy.associativity);
	return (b.tag << (offsetBits + idBits)) | (b.id << offsetBits);
}