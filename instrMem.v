`timescale  1ns/1ps

module instrMem(
    input clk,
    input [31:0] readAdd,
    output reg [31:0] instruction
);

reg [7:0] memory [255:00];

// Initialize instructions

initial begin
    memory[0] = 8'h00;
    memory[1]= 8'h11;
    memory[2] = 8'h10;
    memory[3] =  8'hAA;

    memory[4] = 8'h00;
    memory[5] = 8'h11;
    memory[6] = 8'h15;
    memory[7] =  8'hAA;

    memory[8] = 8'h00;
    memory[9] = 8'h22;
    memory[10] = 8'h10;
    memory[11] =  8'hBB;

    memory[12] = 8'h00;
    memory[13] = 8'h33;
    memory[14] = 8'h10;
    memory[15] =  8'hCC;

    // Continue like this

end

always @(*) begin // DO I need a posedge clk here? Otherwise the signal is useless
    instruction[31:24] <= memory[readAdd];
    instruction[23:16] <= memory[readAdd+1];
    instruction[15:8] <= memory[readAdd+2];
    instruction[7:0] <= memory[readAdd+3];

end
endmodule

//testbench
// `timescale 1ns / 1ps

// module instrMem_tb;

//     reg clk;
//     reg [31:0] readAdd;
//     wire [31:0] instruction;

//     instrMem instrMem_inst(
//         .clk(clk),
//         .readAdd(readAdd),
//         .instruction(instruction)
//     );

//     always #5 clk = ~clk;
//     initial begin
//         $dumpfile("instrMem_tb.vcd");
//         $dumpvars(0, instrMem_tb);
//         clk = 0;
//         readAdd = 32'h00000000;
//         #10;
//         readAdd = 32'h00000004;
//         #10;
//         readAdd = 32'h00000008;
//         #10;
//         readAdd = 32'h0000000C;
//         #10;
//         $finish;
//     end 

// endmodule
