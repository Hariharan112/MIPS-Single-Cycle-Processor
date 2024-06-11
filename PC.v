`timescale 1ns/1ps

module PC(
    input [31:0] address,
    input clk,
    output reg [31:0] PCout
);

initial begin
    PCout <= 31'h00000000;
end

always @(posedge clk) begin
    PCout <= address;
end
endmodule

// testbench
// `timescale 1ns/1ps

// module PC_tb;

//     reg [31:0] address;
//     reg clk;
//     wire [31:0] PCout;

//     PC PC_inst(
//         .address(address),
//         .clk(clk),
//         .PCout(PCout)
//     );

//     initial begin
//         $dumpfile("PC_tb.vcd");
//         $dumpvars(0, PC_tb);
        
//         address = 32'h00000001;
//         clk = 0;
//         #10;
//         clk = 1;
//         #10;
//         address = 32'h00000002;
//         clk = 0;
//         #10;
//         clk = 1;
//         #10;
//         $finish;
//     end
// endmodule
