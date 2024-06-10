`timescale 1ns/1ps

module Regfile(
    input clk,
    input [4:0] readRegA, readRegB, writeReg,
    input [31:0] writeData,
    input RegWrite,
    output [31:0] regA, regB
);

reg [31:0] regMem [255:0];

// Init the regfile

initial begin
    regMem[1] = 
    regMem[2] = 
    regMem[3] = 
    regMem[4] = 
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