`timescale 1ns/1ps

module Regfile(
    input clk,
    input [4:0] readRegA, readRegB, writeReg,
    input [31:0] writeData,
    input RegWrite,
    output reg [31:0] regA, regB
);

reg [31:0] regMem [255:0];

// Init the regfile

initial begin
    regMem[1] = 8'hAD;
    regMem[2] = 8'hAD;
    regMem[3] = 8'hAD;
    regMem[4] = 8'hAD;
    // ... Continue as required.
end

// Write at posedge
always @(posedge clk) begin
    if(RegWrite) begin
        regMem[writeReg] <= writeData;
    end
end

//Read at negedge
always @(negedge clk) begin
    regA <= regMem[readRegA];
    regB <= regMem[readRegB];
end
endmodule

//testbench
// `timescale 1ns / 1ps

// module Regfile_tb;

//     reg clk;
//     reg [4:0] readRegA, readRegB, writeReg;
//     reg [31:0] writeData;
//     reg RegWrite;
//     wire [31:0] regA, regB;

//     Regfile Regfile_inst(
//         .clk(clk),
//         .readRegA(readRegA),
//         .readRegB(readRegB),
//         .writeReg(writeReg),
//         .writeData(writeData),
//         .RegWrite(RegWrite),
//         .regA(regA),
//         .regB(regB)
//     );

//     initial begin
//         $dumpfile("Regfile_tb.vcd");
//         $dumpvars(0, Regfile_tb);
        
//         readRegA = 5'b00001;
//         readRegB = 5'b00010;
//         writeReg = 5'b00011;
//         writeData = 32'h00000001;
//         RegWrite = 1;
//         clk = 0;
//         #10;
//         clk = 1;
//         #10;
//         readRegA = 5'b00011;
//         readRegB = 5'b00011;
//         writeReg = 5'b00011;
//         writeData = 32'h00000002;
//         RegWrite = 1;
//         clk = 0;
//         #10;
//         clk = 1;
//         #10;
//         $finish;
//     end
// endmodule
