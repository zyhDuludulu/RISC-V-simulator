/*
 * Created by He, Hao at 2019-3-11
 */

#include <cstring>
#include <fstream>
#include <sstream>
#include <string>
#include <iostream>
#include <iomanip>

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
	for (int i = 0; i < REGNUM; ++i) { this->reg[i] = 0; }
	for (uint32_t i = 0; i < number_of_component; i++) { fuList[i].type = i; }
	for (int i = 0; i < 33; i++) { resultDepUnit[i] = executeComponent::blank; }
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

		this->executeWriteBack = false;
		this->executeWBReg = -1;
		this->memoryWriteBack = false;
		this->memoryWBReg = -1;

		// THE EXECUTION ORDER of these functions are important!!!
		// Changing them will introduce strange bugs
		this->issue();
		this->readOperands();
		this->execution();
		this->writeBack();
		//this->printBoard();
		if (this->pc == 0x104f4) {
			int a = 1;
		}

		this->history.cycleCount++;
		this->history.regRecord.push_back(this->getRegInfoStr());
		if (this->history.regRecord.size() >= 100000) { // Avoid using up memory
			this->history.regRecord.clear();
			this->history.instRecord.clear();
		}

		if (verbose) {
			this->printInfo();
		}

		if (this->isSingleStep) {
			printf("Type d to dump memory in dump.txt, press ENTER to continue: ");
			char ch;
			while ((ch = getchar()) != '\n') {
				if (ch == 'd') {
					this->dumpHistory();
				}
			}
		}
	}
}

void Simulator::issue() {
	if (this->pc % 2 != 0) { this->panic("Illegal PC 0x%x!\n", this->pc); }

	// handle jump
	if (this->jump) { return; }

	uint32_t inst = this->memory->getInt(this->pc);
	uint32_t len = 4;

	// decode
	std::string instname = "";
	std::string inststr = "";
	std::string deststr, op1str, op2str, offsetstr;
	Inst insttype = Inst::UNKNOWN;
	int64_t op1 = 0, op2 = 0, offset = 0; // op1, op2 and offset are values
	RegId dest = 0, reg1 = 32, reg2 = 32; // reg1 and reg2 are operands

	// Reg for 32bit instructions
	if (len == 4) // 32 bit instruction
	{
		uint32_t opcode = inst & 0x7F;
		uint32_t funct3 = (inst >> 12) & 0x7;
		uint32_t funct7 = (inst >> 25) & 0x7F;
		RegId rd = (inst >> 7) & 0x1F;
		RegId rs1 = (inst >> 15) & 0x1F;
		RegId rs2 = (inst >> 20) & 0x1F;
		int32_t imm_i = int32_t(inst) >> 20;
		int32_t imm_s = int32_t(((inst >> 7) & 0x1F) | ((inst >> 20) & 0xFE0)) << 20 >> 20;
		int32_t imm_sb = int32_t(((inst >> 7) & 0x1E) | ((inst >> 20) & 0x7E0) |
			((inst << 4) & 0x800) | ((inst >> 19) & 0x1000)) << 19 >> 19;
		int32_t imm_u = int32_t(inst) >> 12;
		int32_t imm_uj = int32_t(((inst >> 21) & 0x3FF) | ((inst >> 10) & 0x400) |
			((inst >> 1) & 0x7F800) | ((inst >> 12) & 0x80000)) << 12 >> 11;

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
				} else if (funct7 == 0x01) {
					instname = "mul";
					insttype = MUL;
				} else if (funct7 == 0x20) {
					instname = "sub";
					insttype = SUB;
				} else { this->panic("Unknown funct7 0x%x for funct3 0x%x\n", funct7, funct3); }
				break;
			case 0x1: // sll, mulh
				if (funct7 == 0x00) {
					instname = "sll";
					insttype = SLL;
				} else if (funct7 == 0x01) {
					instname = "mulh";
					insttype = MULH;
				} else { this->panic("Unknown funct7 0x%x for funct3 0x%x\n", funct7, funct3); }
				break;
			case 0x2: // slt
				if (funct7 == 0x00) {
					instname = "slt";
					insttype = SLT;
				} else { this->panic("Unknown funct7 0x%x for funct3 0x%x\n", funct7, funct3); }
				break;
			case 0x3: // sltu
				if (funct7 == 0x00) {
					instname = "sltu";
					insttype = SLTU;
				} else { this->panic("Unknown funct7 0x%x for funct3 0x%x\n", funct7, funct3); }
				break;
			case 0x4: // xor div
				if (funct7 == 0x00) {
					instname = "xor";
					insttype = XOR;
				} else if (funct7 == 0x01) {
					instname = "div";
					insttype = DIV;
				} else { this->panic("Unknown funct7 0x%x for funct3 0x%x\n", funct7, funct3); }
				break;
			case 0x5: // srl, sra
				if (funct7 == 0x00) {
					instname = "srl";
					insttype = SRL;
				} else if (funct7 == 0x20) {
					instname = "sra";
					insttype = SRA;
				} else { this->panic("Unknown funct7 0x%x for funct3 0x%x\n", funct7, funct3); }
				break;
			case 0x6: // or, rem
				if (funct7 == 0x00) {
					instname = "or";
					insttype = OR;
				} else if (funct7 == 0x01) {
					instname = "rem";
					insttype = REM;
				} else { this->panic("Unknown funct7 0x%x for funct3 0x%x\n", funct7, funct3); }
				break;
			case 0x7: // and
				if (funct7 == 0x00) {
					instname = "and";
					insttype = AND;
				} else { this->panic("Unknown funct7 0x%x for funct3 0x%x\n", funct7, funct3); }
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
				} else if (((inst >> 26) & 0x3F) == 0x10) {
					instname = "srai";
					insttype = SRAI;
					op2 = op2 & 0x3F;
				} else { this->panic("Unknown funct7 0x%x for OP_IMM\n", (inst >> 26) & 0x3F); }
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
				op1 = this->reg[REG_A0];
				op2 = this->reg[REG_A7];
				reg1 = REG_A0;
				reg2 = REG_A7;
				dest = REG_A0;
				insttype = ECALL;
			} else { this->panic("Unknown OP_SYSTEM inst with funct3 0x%x and funct7 0x%x\n", funct3, funct7); }
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
				} else if (((inst >> 25) & 0x7F) == 0x20) {
					instname = "sraiw";
					insttype = SRAIW;
				} else { this->panic("Unknown shift inst type 0x%x\n", ((inst >> 25) & 0x7F)); }
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
				} else if (temp == 0x20) {
					instname = "subw";
					insttype = SUBW;
				} else { this->panic("Unknown 32bit funct7 0x%x\n", temp); }
				break;
			case 0x1:
				if (temp == 0x0) {
					instname = "sllw";
					insttype = SLLW;
				} else { this->panic("Unknown 32bit funct7 0x%x\n", temp); }
				break;
			case 0x5:
				if (temp == 0x0) {
					instname = "srlw";
					insttype = SRLW;
				} else if (temp == 0x20) {
					instname = "sraw";
					insttype = SRAW;
				} else { this->panic("Unknown 32bit funct7 0x%x\n", temp); }
				break;
			default:
				this->panic("Unknown 32bit funct3 0x%x\n", funct3);
			}
		} break;
		default:
			this->panic("Unsupported opcode 0x%x!\n", opcode);
		}

		char buf[4096];
		sprintf(buf, "0x%lx: %s\n", this->pc, inststr.c_str());
		this->history.instRecord.push_back(buf);

		if (verbose) { printf("Decoded instruction 0x%.8x as %s\n", inst, inststr.c_str()); }
	}
	else { this->panic("Current implementation does not support 16bit RV64C instructions!\n"); }
	if (instname != INSTNAME[insttype]) { this->panic("Unmatch instname %s with insttype %d\n", instname.c_str(), insttype); }
	// decode ENDED

	executeComponent ec = getComponentUsed(insttype);

	for (uint32_t i = 0; i < number_of_component; i++) {
		if (fuList[i].type == ec && fuList[i].busy == NO && resultDepUnit[dest] == executeComponent::blank) {
			// issue successfully
			// TODO
			fuList[i].busy = YES;
			fuList[i].op = insttype;
			fuList[i].Fi = dest;
			fuList[i].Fj = reg1;
			fuList[i].Fk = reg2;
			fuList[i].Qj = resultDepUnit[reg1];
			fuList[i].Qk = resultDepUnit[reg2];
			fuList[i].op1 = op1;
			fuList[i].op2 = op2;
			fuList[i].offset = offset;
			fuList[i].Rj = fuList[i].Qj == executeComponent::blank;
			fuList[i].Rk = fuList[i].Qk == executeComponent::blank;
			fuList[i].instruction_status = instStatus::OPERANDS;
			fuList[i].isNew = YES;
			resultDepUnit[dest] = executeComponent(i);
			printf("0x%.8x: ", this->pc);
			std::cout << instname << std::endl;
			this->pc += 4;
			if (isJump(insttype) || isBranch(insttype)) { 
				this->jump = YES; 
			}
			return;
		}

	}

	// if branch jump after all the FU finished.
	// set the status to branching: following instruction will not be read
}

void Simulator::readOperands() {
	for (uint32_t i = 0; i < number_of_component; i++) {
		if (fuList[i].instruction_status != instStatus::OPERANDS || fuList[i].isNew == YES) { continue; }
		if (fuList[i].Rj == NO) { fuList[i].Rj = resultDepUnit[fuList[i].Fj] == executeComponent::blank; }
		if (fuList[i].Rk == NO) { fuList[i].Rk = resultDepUnit[fuList[i].Fk] == executeComponent::blank; }
		if (fuList[i].Rj == YES && fuList[i].Rk == YES) {
			fuList[i].Rj = NO;
			fuList[i].Rk = NO;
			fuList[i].instruction_status = instStatus::COMPLETE_EXE;
			fuList[i].isNew = YES;
			fuList[i].time = latency[getComponentUsed(fuList[i].op)];
			// read operands successfully
			// TODO
		}
	}
}

void Simulator::execution() {
	for (uint32_t i = 0; i < number_of_component; i++) {
		if (fuList[i].isNew == YES || fuList[i].instruction_status != instStatus::COMPLETE_EXE) { continue; }
		if (fuList[i].time > 0) { fuList[i].time--; }
		else if (fuList[i].time == 0) { 
			fuList[i].instruction_status = instStatus::WRITE_BACK; 
			fuList[i].isNew = YES;
		}
	}
}

void Simulator::writeBack() {
	for (uint32_t i = 0; i < number_of_component; i++) {
		if (fuList[i].isNew == YES || fuList[i].instruction_status != instStatus::WRITE_BACK) { continue; }
		uint32_t dest = fuList[i].Fi;
		for (uint32_t j = 0; j < number_of_component; j++) {
			if (dest == fuList[j].Fj && fuList[j].Rj == YES && fuList[j].busy) { return; }
			if (dest == fuList[j].Fk && fuList[j].Rk == YES && fuList[j].busy) { return; }
		}
		// write back and set yes acording to the reglist
		// TODO
		this->history.instCount++;

		Inst inst = fuList[i].op;
		int64_t op1 = fuList[i].op1;
		int64_t op2 = fuList[i].op2;
		int64_t offset = fuList[i].offset;

		uint64_t dRegPC = this->pc - 4; // ??
		bool writeReg = false;
		RegId destReg = fuList[i].Fi;
		int64_t out = 0;
		bool writeMem = false;
		bool readMem = false;
		bool readSignExt = false;
		uint32_t memLen = 0;
		bool branch = false;
		// ???????????????????????????????????????????????? 完全处于一个大蒙蔽状态，感谢
		switch (inst) {
		case LUI:
			writeReg = true;
			out = offset << 12;
			break;
		case AUIPC:
			writeReg = true;
			out = dRegPC + (offset << 12);
			//std::cout << out << std::endl;
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
			if (op1 == op2) {
				branch = true;
				dRegPC = dRegPC + offset;
			}
			break;
		case BNE:
			//std::cout << op1 << "  " << op2 << std::endl;
			if (op1 != op2) {
				branch = true;
				dRegPC = dRegPC + offset;
			}
			break;
		case BLT:
			if (op1 < op2) {
				branch = true;
				dRegPC = dRegPC + offset;
			}
			break;
		case BGE:
			if (op1 >= op2) {
				branch = true;
				dRegPC = dRegPC + offset;
			}
			break;
		case BLTU:
			if ((uint64_t)op1 < (uint64_t)op2) {
				branch = true;
				dRegPC = dRegPC + offset;
			}
			break;
		case BGEU:
			if ((uint64_t)op1 >= (uint64_t)op2) {
				branch = true;
				dRegPC = dRegPC + offset;
			}
			break;
		case LB:
			readMem = true;
			writeReg = true;
			memLen = 1;
			out = op1 + offset;
			readSignExt = true;
			break;
		case LH:
			readMem = true;
			writeReg = true;
			memLen = 2;
			out = op1 + offset;
			readSignExt = true;
			break;
		case LW:
			readMem = true;
			writeReg = true;
			memLen = 4;
			out = op1 + offset;
			readSignExt = true;
			break;
		case LD:
			readMem = true;
			writeReg = true;
			memLen = 8;
			out = op1 + offset;
			readSignExt = true;
			break;
		case LBU:
			readMem = true;
			writeReg = true;
			memLen = 1;
			out = op1 + offset;
			break;
		case LHU:
			readMem = true;
			writeReg = true;
			memLen = 2;
			out = op1 + offset;
			break;
		case LWU:
			readMem = true;
			writeReg = true;
			memLen = 4;
			out = op1 + offset;
			break;
		case SB:
			writeMem = true;
			memLen = 1;
			out = op1 + offset;
			op2 = op2 & 0xFF;
			break;
		case SH:
			writeMem = true;
			memLen = 2;
			out = op1 + offset;
			op2 = op2 & 0xFFFF;
			break;
		case SW:
			writeMem = true;
			memLen = 4;
			out = op1 + offset;
			op2 = op2 & 0xFFFFFFFF;
			break;
		case SD:
			writeMem = true;
			memLen = 8;
			out = op1 + offset;
			break;
		case ADDI:
		case ADD:
			writeReg = true;
			out = op1 + op2;
			//std::cout << out << std::endl;
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
			std::cout << op1 << "  " << op2 << std::endl;
			writeReg = true;
			out = op1 & op2;
			std::cout << "andi : " << out << std::endl;
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
		default:
			this->panic("Unknown instruction type %d\n", inst);
		}

		// Pipeline Related Code
		if (isJump(inst)) {
			// Control hazard here
			this->pc = dRegPC;
			this->jump = NO;
			this->history.controlHazardCount++;
		}
		if (isBranch(inst)) {
			this->jump = NO;
		}
		if (isReadMem(inst)) {
			if (fuList[i].Fj == destReg || fuList[i].Fk == destReg) {
				this->history.cycleCount--;
				this->history.memoryHazardCount++;
			}
		}

		// inside the execute stage, there's ALU and other components
		// latency analysis of each instruction inside execute stage
		uint32_t lat = this->latency[getComponentUsed(inst)];

		fuList[i].busy = NO;
		fuList[i].instruction_status = instStatus::ISSUE;
		// read mem unfinished
		this->reg[dest] = out;
		std::cout << "reg[" << dest << "]: " << out << std::endl;
		resultDepUnit[dest] = executeComponent::blank;
	}
	
	// trun the isNew to NO !!! DO NOT FORGET IT !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	for (uint32_t i = 0; i < number_of_component; i++) { fuList[i].isNew = NO; }
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

void Simulator::printBoard() {
	std::cout << "index, futype, busy, op, fi, fj, fk, qj, qk, rj, rk, time, status" << std::endl;
	for (int i = 0; i < number_of_component; i++) {
		std::cout << i << std::right << std::setw(7) << i << std::right << std::setw(8) << fuList[i].busy << std::right << std::setw(7) << fuList[i].op
			<< std::right << std::setw(4) << fuList[i].Fi << std::right << std::setw(4) << fuList[i].Fj << std::right << std::setw(4) << fuList[i].Fk
			<< std::right << std::setw(3) << fuList[i].Qj << std::right << std::setw(4) << fuList[i].Qk << std::right << std::setw(4) << fuList[i].Rj
			<< std::right << std::setw(4) << fuList[i].Rk << std::right << std::setw(4) << fuList[i].time<< std::right << std::setw(6) << fuList[i].instruction_status << std::endl;
	}
}