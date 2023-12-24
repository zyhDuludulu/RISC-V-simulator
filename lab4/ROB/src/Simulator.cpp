/*
 * Created by He, Hao at 2019-3-11
 */

#include <cstdint>
#include <cstring>
#include <fstream>
#include <sstream>
#include <string>

#include "Debug.h"
#include "Simulator.h"

namespace RISCV {

	const char* REGNAME[32] = {
		"zero", // x0
		"ra",   // x1
		"sp",   // x2
		"gp",   // x3
		"tp",   // x4
		"t0",   // x5
		"t1",   // x6
		"t2",   // x7
		"s0",   // x8
		"s1",   // x9
		"a0",   // x10
		"a1",   // x11
		"a2",   // x12
		"a3",   // x13
		"a4",   // x14
		"a5",   // x15
		"a6",   // x16
		"a7",   // x17
		"s2",   // x18
		"s3",   // x19
		"s4",   // x20
		"s5",   // x21
		"s6",   // x22
		"s7",   // x23
		"s8",   // x24
		"s9",   // x25
		"s10",  // x26
		"s11",  // x27
		"t3",   // x28
		"t4",   // x29
		"t5",   // x30
		"t6",   // x31
	};

	const char* INSTNAME[]{
		"lui",  "auipc", "jal",   "jalr",  "beq",   "bne",  "blt",  "bge",  "bltu",
		"bgeu", "lb",    "lh",    "lw",    "ld",    "lbu",  "lhu",  "sb",   "sh",
		"sw",   "sd",    "addi",  "slti",  "sltiu", "xori", "ori",  "andi", "slli",
		"srli", "srai",  "add",   "sub",   "sll",   "slt",  "sltu", "xor",  "srl",
		"sra",  "or",    "and",   "ecall", "addiw", "mul",  "mulh", "div",  "rem",
		"lwu",  "slliw", "srliw", "sraiw", "addw",  "subw", "sllw", "srlw", "sraw",
	};

} // namespace RISCV

using namespace RISCV;

Simulator::Simulator(MemoryManager* memory, BranchPredictor* predictor) {
	this->memory = memory;
	this->branchPredictor = predictor;
	this->pc = 0;
	for (int i = 0; i < REGNUM; ++i) {
		this->reg[i] = 0;
	}
}

Simulator::~Simulator() {}

void Simulator::initStack(uint32_t baseaddr, uint32_t maxSize) {
	this->reg[REG_SP] = baseaddr;
	this->stackBase = baseaddr;
	this->maximumStackSize = maxSize;
	for (uint32_t addr = baseaddr; addr > baseaddr - maxSize; addr--) {
		if (!this->memory->isPageExist(addr)) {
			this->memory->addPage(addr);
		}
		this->memory->setByte(addr, 0);
	}
}

void Simulator::simulate() {
	// Main Simulation Loop
	while (true) {
		if (this->reg[0] != 0) {
			// Some instruction might set this register to zero
			this->reg[0] = 0;
			// this->panic("Register 0's value is not zero!\n");
		}

		if (this->reg[REG_SP] < this->stackBase - this->maximumStackSize) {
			this->panic("Stack Overflow!\n");
		}

		//std::cout << std::hex << this->pc << std::endl;
		//for (int i = 0; i < 32; ++i) { std::cout << reg[i] << " "; }
		//std::cout << std::endl;
		//if (pc == 0x1025c) {
		//	int a = 1;
		//}
		this->issue();
		this->exe();
		this->wb();
		this->commit();

		for (int i = 0; i < number_of_component; ++i) { RS[i].isNew = false; }

		this->history.cycleCount++;
		this->history.regRecord.push_back(this->getRegInfoStr());
		if (this->history.regRecord.size() >= 100000) { // Avoid using up memory
			this->history.regRecord.clear();
			this->history.instRecord.clear();
		}
	}
}

void Simulator::issue() {
	if (this->pc % 2 != 0) { this->panic("Illegal PC 0x%x!\n", this->pc); }
	std::string instname = "";
	std::string inststr = "";
	std::string deststr, op1str, op2str, offsetstr;
	Inst insttype = Inst::UNKNOWN;
	uint32_t inst = this->memory->getInt(this->pc);
	int64_t op1 = 0, op2 = 0, offset = 0; // op1, op2 and offset are values
	RegId dest = 0, reg1 = -1, reg2 = -1; // reg1 and reg2 are operands

	// Reg for 32bit instructions
	if (true) // 32 bit instruction
	{
		uint32_t opcode = inst & 0x7F;
		uint32_t funct3 = (inst >> 12) & 0x7;
		uint32_t funct7 = (inst >> 25) & 0x7F;
		RegId rd = (inst >> 7) & 0x1F;
		RegId rs1 = (inst >> 15) & 0x1F;
		RegId rs2 = (inst >> 20) & 0x1F;
		int32_t imm_i = int32_t(inst) >> 20;
		int32_t imm_s =
			int32_t(((inst >> 7) & 0x1F) | ((inst >> 20) & 0xFE0)) << 20 >> 20;
		int32_t imm_sb = int32_t(((inst >> 7) & 0x1E) | ((inst >> 20) & 0x7E0) |
			((inst << 4) & 0x800) | ((inst >> 19) & 0x1000))
			<< 19 >> 19;
		int32_t imm_u = int32_t(inst) >> 12;
		int32_t imm_uj = int32_t(((inst >> 21) & 0x3FF) | ((inst >> 10) & 0x400) |
			((inst >> 1) & 0x7F800) | ((inst >> 12) & 0x80000))
			<< 12 >> 11;
		switch (opcode) {
		case OP_REG:
			op1 = this->reg[rs1];
			op2 = this->reg[rs2];
			reg1 = rs1;
			reg2 = rs2;
			dest = rd;
			switch (funct3) {
			case 0x0: // add, mul, sub
				if (funct7 == 0x00) {
					instname = "add";
					insttype = ADD;
				}
				else if (funct7 == 0x01) {
					instname = "mul";
					insttype = MUL;
				}
				else if (funct7 == 0x20) {
					instname = "sub";
					insttype = SUB;
				}
				else {
					this->panic("Unknown funct7 0x%x for funct3 0x%x\n", funct7, funct3);
				}
				break;
			case 0x1: // sll, mulh
				if (funct7 == 0x00) {
					instname = "sll";
					insttype = SLL;
				}
				else if (funct7 == 0x01) {
					instname = "mulh";
					insttype = MULH;
				}
				else {
					this->panic("Unknown funct7 0x%x for funct3 0x%x\n", funct7, funct3);
				}
				break;
			case 0x2: // slt
				if (funct7 == 0x00) {
					instname = "slt";
					insttype = SLT;
				}
				else {
					this->panic("Unknown funct7 0x%x for funct3 0x%x\n", funct7, funct3);
				}
				break;
			case 0x3: // sltu
				if (funct7 == 0x00)
				{
					instname = "sltu";
					insttype = SLTU;
				}
				else
				{
					this->panic("Unknown funct7 0x%x for funct3 0x%x\n", funct7, funct3);
				}
				break;
			case 0x4: // xor div
				if (funct7 == 0x00) {
					instname = "xor";
					insttype = XOR;
				}
				else if (funct7 == 0x01) {
					instname = "div";
					insttype = DIV;
				}
				else {
					this->panic("Unknown funct7 0x%x for funct3 0x%x\n", funct7, funct3);
				}
				break;
			case 0x5: // srl, sra
				if (funct7 == 0x00) {
					instname = "srl";
					insttype = SRL;
				}
				else if (funct7 == 0x20) {
					instname = "sra";
					insttype = SRA;
				}
				else {
					this->panic("Unknown funct7 0x%x for funct3 0x%x\n", funct7, funct3);
				}
				break;
			case 0x6: // or, rem
				if (funct7 == 0x00) {
					instname = "or";
					insttype = OR;
				}
				else if (funct7 == 0x01) {
					instname = "rem";
					insttype = REM;
				}
				else {
					this->panic("Unknown funct7 0x%x for funct3 0x%x\n", funct7, funct3);
				}
				break;
			case 0x7: // and
				if (funct7 == 0x00) {
					instname = "and";
					insttype = AND;
				}
				else {
					this->panic("Unknown funct7 0x%x for funct3 0x%x\n", funct7, funct3);
				}
				break;
			default:
				this->panic("Unknown Funct3 field %x\n", funct3);
			}
			op1str = REGNAME[rs1];
			op2str = REGNAME[rs2];
			deststr = REGNAME[rd];
			inststr = instname + " " + deststr + "," + op1str + "," + op2str;
			break;
		case OP_IMM:
			op1 = this->reg[rs1];
			reg1 = rs1;
			op2 = imm_i;
			dest = rd;
			switch (funct3) {
			case 0x0:
				instname = "addi";
				insttype = ADDI;
				break;
			case 0x2:
				instname = "slti";
				insttype = SLTI;
				break;
			case 0x3:
				instname = "sltiu";
				insttype = SLTIU;
				break;
			case 0x4:
				instname = "xori";
				insttype = XORI;
				break;
			case 0x6:
				instname = "ori";
				insttype = ORI;
				break;
			case 0x7:
				instname = "andi";
				insttype = ANDI;
				break;
			case 0x1:
				instname = "slli";
				insttype = SLLI;
				op2 = op2 & 0x3F;
				break;
			case 0x5:
				if (((inst >> 26) & 0x3F) == 0x0) {
					instname = "srli";
					insttype = SRLI;
					op2 = op2 & 0x3F;
				}
				else if (((inst >> 26) & 0x3F) == 0x10) {
					instname = "srai";
					insttype = SRAI;
					op2 = op2 & 0x3F;
				}
				else {
					this->panic("Unknown funct7 0x%x for OP_IMM\n", (inst >> 26) & 0x3F);
				}
				break;
			default:
				this->panic("Unknown Funct3 field %x\n", funct3);
			}
			op1str = REGNAME[rs1];
			op2str = std::to_string(op2);
			deststr = REGNAME[dest];
			inststr = instname + " " + deststr + "," + op1str + "," + op2str;
			break;
		case OP_LUI:
			op1 = imm_u;
			op2 = 0;
			offset = imm_u;
			dest = rd;
			instname = "lui";
			insttype = LUI;
			op1str = std::to_string(imm_u);
			deststr = REGNAME[dest];
			inststr = instname + " " + deststr + "," + op1str;
			break;
		case OP_AUIPC:
			op1 = imm_u;
			op2 = 0;
			offset = imm_u;
			dest = rd;
			instname = "auipc";
			insttype = AUIPC;
			op1str = std::to_string(imm_u);
			deststr = REGNAME[dest];
			inststr = instname + " " + deststr + "," + op1str;
			break;
		case OP_JAL:
			op1 = imm_uj;
			op2 = 0;
			offset = imm_uj;
			dest = rd;
			instname = "jal";
			insttype = JAL;
			op1str = std::to_string(imm_uj);
			deststr = REGNAME[dest];
			inststr = instname + " " + deststr + "," + op1str;
			break;
		case OP_JALR:
			op1 = this->reg[rs1];
			reg1 = rs1;
			op2 = imm_i;
			dest = rd;
			instname = "jalr";
			insttype = JALR;
			op1str = REGNAME[rs1];
			op2str = std::to_string(op2);
			deststr = REGNAME[dest];
			inststr = instname + " " + deststr + "," + op1str + "," + op2str;
			break;
		case OP_BRANCH:
			op1 = this->reg[rs1];
			op2 = this->reg[rs2];
			reg1 = rs1;
			reg2 = rs2;
			offset = imm_sb;
			switch (funct3) {
			case 0x0:
				instname = "beq";
				insttype = BEQ;
				break;
			case 0x1:
				instname = "bne";
				insttype = BNE;
				break;
			case 0x4:
				instname = "blt";
				insttype = BLT;
				break;
			case 0x5:
				instname = "bge";
				insttype = BGE;
				break;
			case 0x6:
				instname = "bltu";
				insttype = BLTU;
				break;
			case 0x7:
				instname = "bgeu";
				insttype = BGEU;
				break;
			default:
				this->panic("Unknown funct3 0x%x at OP_BRANCH\n", funct3);
			}
			op1str = REGNAME[rs1];
			op2str = REGNAME[rs2];
			offsetstr = std::to_string(offset);
			inststr = instname + " " + op1str + "," + op2str + "," + offsetstr;
			break;
		case OP_STORE:
			op1 = this->reg[rs1];
			op2 = this->reg[rs2];
			reg1 = rs1;
			reg2 = rs2;
			offset = imm_s;
			switch (funct3) {
			case 0x0:
				instname = "sb";
				insttype = SB;
				break;
			case 0x1:
				instname = "sh";
				insttype = SH;
				break;
			case 0x2:
				instname = "sw";
				insttype = SW;
				break;
			case 0x3:
				instname = "sd";
				insttype = SD;
				break;
			default:
				this->panic("Unknown funct3 0x%x for OP_STORE\n", funct3);
			}
			op1str = REGNAME[rs1];
			op2str = REGNAME[rs2];
			offsetstr = std::to_string(offset);
			inststr = instname + " " + op2str + "," + offsetstr + "(" + op1str + ")";
			break;
		case OP_LOAD:
			op1 = this->reg[rs1];
			reg1 = rs1;
			op2 = imm_i;
			offset = imm_i;
			dest = rd;
			switch (funct3) {
			case 0x0:
				instname = "lb";
				insttype = LB;
				break;
			case 0x1:
				instname = "lh";
				insttype = LH;
				break;
			case 0x2:
				instname = "lw";
				insttype = LW;
				break;
			case 0x3:
				instname = "ld";
				insttype = LD;
				break;
			case 0x4:
				instname = "lbu";
				insttype = LBU;
				break;
			case 0x5:
				instname = "lhu";
				insttype = LHU;
				break;
			case 0x6:
				instname = "lwu";
				insttype = LWU;
			default:
				this->panic("Unknown funct3 0x%x for OP_LOAD\n", funct3);
			}
			op1str = REGNAME[rs1];
			op2str = std::to_string(op2);
			deststr = REGNAME[rd];
			inststr = instname + " " + deststr + "," + op2str + "(" + op1str + ")";
			break;
		case OP_SYSTEM:
			if (funct3 == 0x0 && funct7 == 0x000) {
				instname = "ecall";
				rs1 = REG_A0;
				rs2 = REG_A7;
				op1 = this->reg[REG_A0];
				op2 = this->reg[REG_A7];
				reg1 = REG_A0;
				reg2 = REG_A7;
				dest = REG_A0;
				insttype = ECALL;
			}
			else {
				this->panic("Unknown OP_SYSTEM inst with funct3 0x%x and funct7 0x%x\n",
					funct3, funct7);
			}
			inststr = instname;
			break;
		case OP_IMM32:
			op1 = this->reg[rs1];
			reg1 = rs1;
			op2 = imm_i;
			dest = rd;
			switch (funct3) {
			case 0x0:
				instname = "addiw";
				insttype = ADDIW;
				break;
			case 0x1:
				instname = "slliw";
				insttype = SLLIW;
				break;
			case 0x5:
				if (((inst >> 25) & 0x7F) == 0x0) {
					instname = "srliw";
					insttype = SRLIW;
				}
				else if (((inst >> 25) & 0x7F) == 0x20) {
					instname = "sraiw";
					insttype = SRAIW;
				}
				else {
					this->panic("Unknown shift inst type 0x%x\n", ((inst >> 25) & 0x7F));
				}
				break;
			default:
				this->panic("Unknown funct3 0x%x for OP_ADDIW\n", funct3);
			}
			op1str = REGNAME[rs1];
			op2str = std::to_string(op2);
			deststr = REGNAME[rd];
			inststr = instname + " " + deststr + "," + op1str + "," + op2str;
			break;
		case OP_32: {
			op1 = this->reg[rs1];
			op2 = this->reg[rs2];
			reg1 = rs1;
			reg2 = rs2;
			dest = rd;

			uint32_t temp = (inst >> 25) & 0x7F; // 32bit funct7 field
			switch (funct3) {
			case 0x0:
				if (temp == 0x0) {
					instname = "addw";
					insttype = ADDW;
				}
				else if (temp == 0x20) {
					instname = "subw";
					insttype = SUBW;
				}
				else {
					this->panic("Unknown 32bit funct7 0x%x\n", temp);
				}
				break;
			case 0x1:
				if (temp == 0x0) {
					instname = "sllw";
					insttype = SLLW;
				}
				else {
					this->panic("Unknown 32bit funct7 0x%x\n", temp);
				}
				break;
			case 0x5:
				if (temp == 0x0) {
					instname = "srlw";
					insttype = SRLW;
				}
				else if (temp == 0x20) {
					instname = "sraw";
					insttype = SRAW;
				}
				else {
					this->panic("Unknown 32bit funct7 0x%x\n", temp);
				}
				break;
			default:
				this->panic("Unknown 32bit funct3 0x%x\n", funct3);
			}
		} break;
		default:
			this->panic("Unsupported opcode 0x%x!\n", opcode);
		}

		// issue
		// how can r and b be properly initialized?
		int r = getComponentUsed(insttype);
		if (RS[r].busy || ROB[b].busy) { return; }
		if (registerStat[rs1].busy) {
			int h = registerStat[rs1].reorder;
			if (ROB[h].ready) {
				RS[r].Vj = ROB[h].value;
				RS[r].Qj = -1;
			}
			else { RS[r].Qj = h; }
			if (rs1 == 0) { 
				RS[r].Vj = 0; 
				RS[r].Qj = -1;
			}
		}
		else {
			RS[r].Vj = op1;
			RS[r].Qj = -1;
		}
		RS[r].pc = this->pc;
		RS[r].busy = true;
		RS[r].dest = b;
		RS[r].inst = inst;
		RS[r].opcode = opcode;
		RS[r].insttype = insttype;
		RS[r].time = latency[r];
		ROB[b].busy = true;
		ROB[b].inst = inst;
		ROB[b].dest = rd;
		ROB[b].ready = false;
		ROB[b].opcode = opcode;
		ROB[b].insttype = insttype;
		switch (opcode) {
		case OP_STORE:
			//std::cout << std::dec << rs1 << ' ' << rs2 << ' ' << imm_s << std::endl;
			if (registerStat[rs2].busy) {
				int temp = registerStat[rs2].reorder;
				if (ROB[temp].ready) {
					RS[r].Vk = ROB[temp].value;
					RS[r].Qk = -1;
				}
				else { RS[r].Qk = temp; }
				if (rs2 == 0) {
					RS[r].Vk = 0;
					RS[r].Qk = -1;
				}
			}
			else {
				RS[r].Vk = op2;
				RS[r].Qk = -1;
			}
			RS[r].A = imm_s;
			break;
		case OP_LOAD:
			RS[r].A = imm_i;
			RS[r].Qk = -1;
			registerStat[rd].reorder = b;
			registerStat[rd].busy = true;
			ROB[b].dest = rd;
			break;
		default:
			if (registerStat[rs2].busy && opcode != OP_IMM && opcode != OP_IMM32) {
				int temp = registerStat[rs2].reorder;
				if (ROB[temp].ready) {
					RS[r].Vk = ROB[temp].value;
					RS[r].Qk = -1;
				}
				else { RS[r].Qk = temp; }
				if (rs2 == 0) {
					RS[r].Vk = 0;
					RS[r].Qk = -1;
				}
			}
			else {
				RS[r].Vk = op2;
				RS[r].Qk = -1;
			}
			registerStat[rd].reorder = b;
			registerStat[rd].busy = true;
			ROB[b].dest = rd;
			break;
		}
		//std::cout << "rs1 " << 
		b = (b + 1) % 32; // queue


		char buf[4096];
		sprintf(buf, "0x%lx: %s\n", this->pc, inststr.c_str());
		this->history.instRecord.push_back(buf);
	}
	else { // 16 bit instruction
		this->panic(
			"Current implementation does not support 16bit RV64C instructions!\n");
	}

	if (instname != INSTNAME[insttype]) {
		this->panic("Unmatch instname %s with insttype %d\n", instname.c_str(),
			insttype);
	}

	bool predictedBranch = false;
	if (isBranch(insttype)) {
		predictedBranch = this->branchPredictor->predict(this->pc, insttype,
			op1, op2, offset);
		this->predictbranch = predictedBranch;
		if (predictedBranch) {
			this->pc = this->pc + offset;
			this->anotherPC = this->pc + 4;
		}
		else {
			this->anotherPC = this->pc + offset;
			this->pc = this->pc + 4;
		}
	}
	else if (isJump(insttype)) {
		if (insttype == JAL) { pc += op1; }
		else { 
			if (registerStat[1].busy) { return; }
			pc = (op1 + op2) & (~(uint64_t)1); 
		}
		int a = 1;
	}
	else { pc = pc + 4; }
}

void Simulator::exe() {
	// from the head of the rob, check who is the first, load or store
	for (int i = 0; i < number_of_component; ++i) {
		if (!RS[i].busy || RS[i].Qj != -1 || RS[i].Qk != -1) { continue; }
		if (RS[i].time != 0) { --RS[i].time; continue; }
		RS[i].time--;
		bool writeReg = false;
		int64_t op1 = RS[i].Vj;
		int64_t op2 = RS[i].Vk;
		int64_t out = 0;
		uint64_t dRegPC = RS[i].pc;
		int32_t imm_s =
			int32_t(((RS[i].inst >> 7) & 0x1F) | ((RS[i].inst >> 20) & 0xFE0)) << 20 >> 20;
		bool writeMem = false;
		bool readMem = false;
		switch (RS[i].insttype) {
		case LUI:
			writeReg = true;
			out = op1 << 12;
			break;
		case AUIPC:
			writeReg = true;
			out = dRegPC + (op1 << 12);
			break;
		case JAL:
			writeReg = true;
			out = dRegPC + 4;
			dRegPC = dRegPC + op1;
			branch = true;
			break;
		case JALR:
			writeReg = true;
			out = dRegPC + 4;
			dRegPC = (op1 + op2) & (~(uint64_t)1);
			branch = true;
			break;
		case BEQ:
			branch = false;
			if (op1 == op2) { branch = true; }
			break;
		case BNE:
			branch = false;
			if (op1 != op2) { branch = true; }
			break;
		case BLT:
			branch = false;
			if (op1 < op2) { branch = true; }
			break;
		case BGE:
			branch = false;
			if (op1 >= op2) { branch = true; }
			break;
		case BLTU:
			branch = false;
			if ((uint64_t)op1 < (uint64_t)op2) { branch = true; }
			break;
		case BGEU:
			branch = false;
			if ((uint64_t)op1 >= (uint64_t)op2) { branch = true; }
			break;
		case ADDI:
		case ADD:
			writeReg = true;
			out = op1 + op2;
			break;
		case ADDIW:
		case ADDW:
			writeReg = true;
			out = (int64_t)((int32_t)op1 + (int32_t)op2);
			break;
		case SUB:
			writeReg = true;
			out = op1 - op2;
			break;
		case SUBW:
			writeReg = true;
			out = (int64_t)((int32_t)op1 - (int32_t)op2);
			break;
		case MUL:
			writeReg = true;
			out = op1 * op2;
			break;
		case DIV:
			writeReg = true;
			out = op1 / op2;
			break;
		case SLTI:
		case SLT:
			writeReg = true;
			out = op1 < op2 ? 1 : 0;
			break;
		case SLTIU:
		case SLTU:
			writeReg = true;
			out = (uint64_t)op1 < (uint64_t)op2 ? 1 : 0;
			break;
		case XORI:
		case XOR:
			writeReg = true;
			out = op1 ^ op2;
			break;
		case ORI:
		case OR:
			writeReg = true;
			out = op1 | op2;
			break;
		case ANDI:
		case AND:
			writeReg = true;
			out = op1 & op2;
			break;
		case SLLI:
		case SLL:
			writeReg = true;
			out = op1 << op2;
			break;
		case SLLIW:
		case SLLW:
			writeReg = true;
			out = int64_t(int32_t(op1 << op2));
			break;
			break;
		case SRLI:
		case SRL:
			writeReg = true;
			out = (uint64_t)op1 >> (uint64_t)op2;
			break;
		case SRLIW:
		case SRLW:
			writeReg = true;
			out = uint64_t(uint32_t((uint32_t)op1 >> (uint32_t)op2));
			break;
		case SRAI:
		case SRA:
			writeReg = true;
			out = op1 >> op2;
			break;
		case SRAW:
		case SRAIW:
			writeReg = true;
			out = int64_t(int32_t((int32_t)op1 >> (int32_t)op2));
			break;
		case ECALL:
			out = handleSystemCall(op1, op2);
			writeReg = true;
			break;
			// TODO: should be handled in memory access
			// and save the result in the rs
		case LB:
			readMem = true;
			writeReg = true;
			memLen = 1;
			out = op1 + op2;
			readSignExt = true;
			break;
		case LH:
			readMem = true;
			writeReg = true;
			memLen = 2;
			out = op1 + op2;
			readSignExt = true;
			break;
		case LW:
			readMem = true;
			writeReg = true;
			memLen = 4;
			out = op1 + op2;
			readSignExt = true;
			break;
		case LD:
			readMem = true;
			writeReg = true;
			memLen = 8;
			out = op1 + op2;
			readSignExt = true;
			break;
		case LBU:
			readMem = true;
			writeReg = true;
			memLen = 1;
			out = op1 + op2;
			readSignExt = false;
			break;
		case LHU:
			readMem = true;
			writeReg = true;
			memLen = 2;
			out = op1 + op2;
			readSignExt = false;
			break;
		case LWU:
			readMem = true;
			writeReg = true;
			memLen = 4;
			out = op1 + op2;
			readSignExt = false;
			break;
		case SB:
			writeMem = true;
			memLen = 1;
			out = op1 + imm_s;
			op2 = op2 & 0xFF;
			break;
		case SH:
			writeMem = true;
			memLen = 2;
			out = op1 + imm_s;
			op2 = op2 & 0xFFFF;
			break;
		case SW:
			writeMem = true;
			memLen = 4;
			out = op1 + imm_s;
			op2 = op2 & 0xFFFFFFFF;
			break;
		case SD:
			writeMem = true;
			memLen = 8;
			out = op1 + imm_s;
			break;
		default:
			this->panic("Unknown instruction type %d\n", RS[i].insttype);
		}
		if (RS[i].opcode == OP_LOAD) { ROB[RS[i].dest].address = RS[i].Vj + RS[i].A; }
		else if (RS[i].opcode == OP_STORE) { ROB[RS[i].dest].address = RS[i].Vj + RS[i].A; }
		else { RS[i].result = out; }
		RS[i].isNew = true;
	}
}

void Simulator::wb() {
	for (int i = 0; i < number_of_component; ++i) {
		if (!RS[i].busy || RS[i].Qj != -1 || RS[i].Qk != -1 || RS[i].isNew || RS[i].time > -1) { continue; }
		if (RS[i].opcode == OP_STORE) {
			if (RS[i].Qk == -1) {
				ROB[RS[i].dest].value = RS[i].Vk; // ?
				ROB[RS[i].dest].ready = true;
				RS[i].busy = false;
			}
		}
		else {
			int temp = RS[i].dest;
			RS[i].busy = false;
			if (registerStat[1].busy && temp == registerStat[1].reorder && ROB[temp].insttype == JALR) {
				pc = (RS[i].Vj + RS[i].Vk) & (~(uint64_t)1);
			}
			if (RS[i].opcode != OP_LOAD) {
				for (int j = 0; j < number_of_component; ++j) {
					if (!RS[j].busy) { continue; }
					if (RS[j].Qj == temp) {
						RS[j].Vj = RS[i].result;
						RS[j].Qj = -1;
					}
					if (RS[j].Qk == temp) {
						RS[j].Vk = RS[i].result;
						RS[j].Qk = -1;
					}
				}
			} else { RS[2].busy = true; }
			ROB[temp].ready = true;
			ROB[temp].value = RS[i].result;
			ROB[temp].op2 = RS[i].Vk;
		}
	}
}

void Simulator::commit() {
	// from the head of the ROB
	if (!ROB[h].ready || !ROB[h].busy) { return; }
	int d = ROB[h].dest;
	if (isBranch(ROB[h].insttype)) {
		if (predictbranch != branch) { // mis-prediction
			//std::cout << "predict: " << predictbranch << "  branch: " << branch << std::endl;
			//std::cout << "MIS_PREDICTION TO PC: " << this->pc << std::endl;
			//std::cout << "SHOULD BE: " << this->anotherPC << std::endl;
			for (int i = 0; i < 32; ++i) {
				ROB[i].busy = false;
				b = 0;
				h = 0;
				registerStat[i].busy = false;
			}
			for (int i = 0; i < number_of_component; ++i) { RS[i].busy = false; }
			// update the pc
			this->pc = this->anotherPC;
			return;
		}
	}
	else if (ROB[h].opcode == OP_STORE) {
		bool good = true;
		uint32_t cycles = 0;
		//std::cout << "store at: " << ROB[h].address << " value:" << ROB[h].value << " len: " << memLen << std::endl;
		switch (memLen) {
		case 1:
			good = this->memory->setByte(ROB[h].address, ROB[h].value, &cycles);
			break;
		case 2:
			good = this->memory->setShort(ROB[h].address, ROB[h].value, &cycles);
			break;
		case 4:
			good = this->memory->setInt(ROB[h].address, ROB[h].value, &cycles);
			break;
		case 8:
			good = this->memory->setLong(ROB[h].address, ROB[h].value, &cycles);
			break;
		default:
			this->panic("Unknown memLen %d\n", memLen);
		}
		if (!good) { this->panic("Invalid Mem Access!\n"); }
		
	}
	else if (ROB[h].opcode == OP_LOAD) {
		uint32_t cycles = 0;
		switch (memLen) {
		case 1:
			if (readSignExt) { reg[d] = (int64_t)this->memory->getByte(ROB[h].address, &cycles); }
			else { reg[d] = (uint64_t)this->memory->getByte(ROB[h].address, &cycles); }
			break;
		case 2:
			if (readSignExt) { reg[d] = (int64_t)this->memory->getShort(ROB[h].address, &cycles); }
			else { reg[d] = (uint64_t)this->memory->getShort(ROB[h].address, &cycles); }
			break;
		case 4:
			if (readSignExt) { reg[d] = (int64_t)this->memory->getInt(ROB[h].address, &cycles); }
			else { reg[d] = (uint64_t)this->memory->getInt(ROB[h].address, &cycles); }
			break;
		case 8:
			if (readSignExt) { reg[d] = (int64_t)this->memory->getLong(ROB[h].address, &cycles); }
			else { reg[d] = (uint64_t)this->memory->getLong(ROB[h].address, &cycles); }
			break;
		default:
			this->panic("Unknown memLen %d\n", memLen);
		}
		for (int j = 0; j < number_of_component; ++j) {
			int temp = RS[2].dest;
			if (!RS[j].busy) { continue; }
			if (RS[j].Qj == temp) {
				RS[j].Vj = reg[d];
				RS[j].Qj = -1;
			}
			if (RS[j].Qk == temp) {
				RS[j].Vk = reg[d];
				RS[j].Qk = -1;
			}
		}
		RS[2].busy = false;
		//std::cout << "load at: " << ROB[h].address << " value:" << reg[d] << " len: " << memLen << std::endl;
	}
	else { reg[d] = ROB[h].value; }
	ROB[h].busy = false;
	if (registerStat[d].reorder == h) {
		registerStat[d].busy = false;
	}
	//std::cout << "ROB commit at " << h << std::endl;
	h = (h + 1) % 32;
}

int64_t Simulator::handleSystemCall(int64_t op1, int64_t op2) {
	int64_t type = op2; // reg a7
	int64_t arg1 = op1; // reg a0
	switch (type) {
	case 0: { // print string
		uint32_t addr = arg1;
		char ch = this->memory->getByte(addr);
		while (ch != '\0') {
			printf("%c", ch);
			ch = this->memory->getByte(++addr);
		}
		break;
	}
	case 1: // print char
		printf("%c", (char)arg1);
		break;
	case 2: // print num
		printf("%d", (int32_t)arg1);
		break;
	case 3:
	case 93: // exit
		printf("Program exit from an exit() system call\n");
		if (shouldDumpHistory) {
			printf("Dumping history to dump.txt...");
			this->dumpHistory();
		}
		this->printStatistics();
		exit(0);
	case 4: // read char
		scanf(" %c", (char*)&op1);
		break;
	case 5: // read num
		scanf(" %ld", &op1);
		break;
	case 6: // print float
		printf("%f", (float)arg1);
		break;
	default:
		this->panic("Unknown syscall type %d\n", type);
	}
	return op1;
}

void Simulator::printInfo() {
	printf("------------ CPU STATE ------------\n");
	printf("PC: 0x%lx\n", this->pc);
	for (uint32_t i = 0; i < 32; ++i) {
		printf("%s: 0x%.8lx(%ld) ", REGNAME[i], this->reg[i], this->reg[i]);
		if (i % 4 == 3)
			printf("\n");
	}
	printf("-----------------------------------\n");
}

void Simulator::printStatistics() {
	printf("------------ STATISTICS -----------\n");
	printf("Number of Instructions: %u\n", this->history.instCount);
	printf("Number of Cycles: %u\n", this->history.cycleCount);
	printf("Avg Cycles per Instrcution: %.4f\n",
		(float)this->history.cycleCount / this->history.instCount);
	printf("Branch Perdiction Accuacy: %.4f (Strategy: %s)\n",
		(float)this->history.predictedBranch /
		(this->history.predictedBranch + this->history.unpredictedBranch),
		this->branchPredictor->strategyName().c_str());
	printf("Number of Control Hazards: %u\n",
		this->history.controlHazardCount);
	printf("Number of Data Hazards: %u\n", this->history.dataHazardCount);
	printf("Number of Memory Hazards: %u\n",
		this->history.memoryHazardCount);
	printf("-----------------------------------\n");
	//this->memory->printStatistics();
}

std::string Simulator::getRegInfoStr() {
	std::string str;
	char buf[65536];

	str += "------------ CPU STATE ------------\n";
	sprintf(buf, "PC: 0x%lx\n", this->pc);
	str += buf;
	for (uint32_t i = 0; i < 32; ++i) {
		sprintf(buf, "%s: 0x%.8lx(%ld) ", REGNAME[i], this->reg[i], this->reg[i]);
		str += buf;
		if (i % 4 == 3) {
			str += "\n";
		}
	}
	str += "-----------------------------------\n";

	return str;
}

void Simulator::dumpHistory() {
	std::ofstream ofile("dump.txt");
	ofile << "================== Excecution History =================="
		<< std::endl;
	for (uint32_t i = 0; i < this->history.instRecord.size(); ++i) {
		ofile << this->history.instRecord[i];
		ofile << this->history.regRecord[i];
	}
	ofile << "========================================================"
		<< std::endl;
	ofile << std::endl;

	ofile << "====================== Memory Dump ======================"
		<< std::endl;
	ofile << this->memory->dumpMemory();
	ofile << "========================================================="
		<< std::endl;
	ofile << std::endl;

	ofile.close();
}

void Simulator::panic(const char* format, ...) {
	char buf[BUFSIZ];
	va_list args;
	va_start(args, format);
	vsprintf(buf, format, args);
	fprintf(stderr, "%s", buf);
	va_end(args);
	this->dumpHistory();
	fprintf(stderr, "Execution history and memory dump in dump.txt\n");
	exit(-1);
}
