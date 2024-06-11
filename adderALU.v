`timescale 1ns/1ps

module adderALU(
    input [31:0] A, B,
    output [31:0] result
);

assign result = A+B;

endmodule

// testbench

// `timescale 1ns/1ps

// module adderALU_tb;

//     reg [31:0] A, B;
//     wire [31:0] result;

//     adderALU adderALU_inst(
//         .A(A),
//         .B(B),
//         .result(result)
//     );

//     initial begin
//         $dumpfile("adderALU_tb.vcd");
//         $dumpvars(0, adderALU_tb);

//         A = 32'h00000001;
//         B = 32'h00000002;
//         #10;
//         A = 32'h00000020;
//         B = 32'h00000004;
//         #10;
//         $finish;
//     end

// endmodule
