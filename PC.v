`timescale 1ns/1ps

module PC(
    input [31:0] address,
    input clk,
    output [31:0] PCout
);

initial begin
    PCout <= 31'h00000000;
end

always @(posedge clk) begin
    PCout <= address;
end
endmodule
