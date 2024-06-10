`timescale 1ns/1ps

module ALU  (
    output [31:0] aluResult, 
    input aluZero,
    input [31:0] A32, B32,
    input [2:0] ALUop
);
    
    wire [31:0] and_out, or_out, add_out, sub_out, slt_out; 

    assign and_out = A32 & B32;
    assign or_out = A32 | B32;
    assign add_out = A32 + B32;
    assign sub_out = A32 - B32;
    assign slt_out = (A32 < B32) ? 31'h1 : 31'h0;
    
    assign aluZero = (aluResult == 0) ? 1'b1 : 1'b0;

    mux8 ALUMUX (
        .sel(ALUop),
        .in0(and_out),
        .in1(or_out),
        .in2(add_out),
        .in3(32'bx),
        .in4(32'bx),
        .in5(32'bx),
        .in6(sub_out),
        .in7(slt_out),
        .out(aluResult)
    )


endmodule