`timescale 1ns/1ps

module DataMem(
    input clk,
    input memread, memwrite,
    input [31:0] address, writeData
    output [31:0] data
);


reg [7:0] memory [255:0]; 
//initialize memory
initial begin
    memory[0] = 
    memory [1] = 
    memory [2] =
    memory [3] =  
    //continue ...
end

always @(posedge clk) begin
    if (memwrite) begin
        memory[address] <= writeData[31:24];
        memory[address +1] <= writeData[23:16];
        memory[address +2] <= writeData[15:8];
        memory[address +3] <= writeData[7:0];
        
    end
    
    if (memread) begin
        data[31:24] <=memory[address];
        data[23:16] <= memory[address+1];
        data[15:8] <= memory[address+2];
        data[7:0] <= memory[address+3];
    end
end


endmodule