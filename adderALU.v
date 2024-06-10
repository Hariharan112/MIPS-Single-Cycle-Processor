`timescale 1ns/1ps

module adderALU(
    input [31:0] A, B,
    output [31:0] result
);

assign result = A+B;

endmodule