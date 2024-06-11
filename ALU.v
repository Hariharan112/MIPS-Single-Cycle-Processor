`timescale 1ns/1ps

module ALU  (
    output [31:0] aluResult, 
    output aluZero,
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
    );
endmodule

// Testbench to check module
// `timescale 1ns / 1ps

// module ALU_tb;

//     reg [31:0] A32, B32;
//     reg [2:0] ALUop;
//     wire [31:0] aluResult;
//     wire aluZero;

//     ALU ALU_inst(
//         .A32(A32),
//         .B32(B32),
//         .ALUop(ALUop),
//         .aluResult(aluResult),
//         .aluZero(aluZero)
//     );

//     initial begin
//         $dumpfile("ALU_tb.vcd");
//         $dumpvars(0, ALU_tb);
        
//         A32 = 32'h00000001;
//         B32 = 32'h00000002;
//         ALUop = 3'b000;
//         #10;
//         A32 = 32'h00000020;
//         B32 = 32'h00000004;
//         ALUop = 3'b001;
//         #10;
//         A32 = 32'h00000001;
//         B32 = 32'h00000002;
//         ALUop = 3'b010;
//         #10;
//         A32 = 32'h00000020;
//         B32 = 32'h00000004;
//         ALUop = 3'b011;
//         #10;
//         A32 = 32'h00000001;
//         B32 = 32'h00000002;
//         ALUop = 3'b100;
//         #10;
//         A32 = 32'h00000020;
//         B32 = 32'h00000004;
//         ALUop = 3'b101;
//         #10;
//         A32 = 32'h00000001;
//         B32 = 32'h00000002;
//         ALUop = 3'b110;
//         #10;
//         A32 = 32'h00000020;
//         B32 = 32'h00000004;
//         ALUop = 3'b111;
//         #10;
//         $finish;
//     end

// endmodule
