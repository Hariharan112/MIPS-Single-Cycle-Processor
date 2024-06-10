`timescale  1ns/1ps

module instrMem(
    input clk,
    input [31:0] readAdd,
    output [31:0] instruction
);

reg [7:0] memory [255:00];

// Initialize instructions

initial begin
    memory[0] = 
    memory[1] = 
    memory[2] =
    memory [3] =

    // Continue like this

end

always @(*) begin
    instruction[31:24] <= memory[address];
    instruction[23:16] <= memory[address+1];
    instruction[15:8] <= memory[address+2];
    instruction[7:0] <= memory[address+3];

end
endmodule