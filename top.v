`timescale 1ns/1ps

module top(
    input clk
)

// Wires required

// PC
PC PC_reg (
    .address(PCin),
    .clk(clk),
    .PCout(PCout)
);

// Instruction Mem
instrMem instruction_Memory(
    .clk(clk),
    .readAdd(PCout),
    .instruction(instruction)
);

// PC+4 adder
adderALU PCp4(
    .A(PCout),
    .B(32'd4),
    .result(PCp4)
);

// regdst mux. Change. we need new mux...
mux_2x1 regsel (
    .in_0(instruction[15:11]),
    .in_1(instur[20:16]),
    .sel(regdst),
    .Out(writeregline)
);

//Regfile
Regfile regfile(
    .clk(clk),
    .readRegA(instruction[25:21]),
    .readRegB(instruction[20:16]),
    .writeReg(writeregline),
    .writeData(writedataline)
    .RegWrite(regwrite),
    .regA(regA),
    .regB(regB)
);

//Controller
controller main_control(
    .opcode(instruction[31:26]),
    .clk(clk),
    .ALUop(ALUop),
    .regdst(regdst),
    .branch(branch),
    .memread(memread),
    .mem2reg(mem2reg),
    .memwrite(memwrite)
    .alusrc(alusrc),
    .regwrite(regwrite)
);

//Sign extender
sign_extend extender (
    .Imm(instruction[15:0]),
    .extended(extendedline)
);

//shift left
shifter shift(
    .in(extendedline),
    .shifted(shiftExtendline)
);

mux_2x1 aluselect (
    .in_0(regB)
    .in_1(extendedline)
    .sel(alusrc)
    .out(aluBline)
);

//Main ALU. Calling alucontrol first
ALU_control alucontrol (
    .FF(instruction[5:0]),
    .ALUop(ALUop),
    .ALU_control(aluOPline)
);

ALU mainALU (
    .aluResult(aluresline),
    .aluZero(aluZeroline),
    .A32(regA),
    .B32(aluBline)
    .ALUop(aluOPline)
);

//Jumper alu
adderALU Jumpctrl (
    .A(PCp4),
    .B(shiftExtendline),
    .result(jumperline)
)

//Mux for PC control
mux_2x1 pcp4_control (
    .in_0(PCp4),
    .in_1(jumperline),
    .sel(branch & aluZeroline),
    .Out(PCin)
);

// Data memory
DataMem datamemory (
    .clk(clk),
    .memread(memread),
    .memwrite(memwrite),
    .address(aluresline)
    .writeData(regB),
    .data(datamemline)
);

//Mux to choose final result data
mux_2x1 datachoose (
    .in_0(aluresline),
    .in_1(datamemline),
    .sel(mem2reg),
    .Out(writedataline)
);

endmodule