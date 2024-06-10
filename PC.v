`timescale 1ns/1ps

module PC(
    input [31:0] adress,
    input clk,
    output [31:0] PCout
);

always @(posedge clk) begin
    PCout <= address;
end
endmodule
