// 8x1 MUX with 32 bit data inputs

`timescale 1ns/1ps
module mux8 (
    input [2:0] sel,
    input [31:0] in0, in1, in2, in3, in4, in5, in6, in7,
    output [31:0] out
);

    assign out = (sel == 3'b000) ? in0 : 
                    (sel == 3'b001) ? in1 : 
                    (sel == 3'b010) ? in2 : 
                    (sel == 3'b011) ? in3 :
                    (sel == 3'b100) ? in4 :
                    (sel == 3'b101) ? in5 :
                    (sel == 3'b110) ? in6 :
                    (sel == 3'b111) ? in7 : 32'bx;

endmodule

//testbench
// `timescale 1ns/1ps

// module mux8_tb;

//     reg [2:0] sel;
//     reg [31:0] in0, in1, in2, in3, in4, in5, in6, in7;
//     wire [31:0] out;

//     mux8 mux8_inst(
//         .sel(sel),
//         .in0(in0),
//         .in1(in1),
//         .in2(in2),
//         .in3(in3),
//         .in4(in4),
//         .in5(in5),
//         .in6(in6),
//         .in7(in7),
//         .out(out)
//     );

//     initial begin
//         $dumpfile("mux8_tb.vcd");
//         $dumpvars(0, mux8_tb);
        
//         in0 = 32'h00000001;
//         in1 = 32'h00000002;
//         in2 = 32'h00000003;
//         in3 = 32'h00000004;
//         in4 = 32'h00000005;
//         in5 = 32'h00000006;
//         in6 = 32'h00000007;
//         in7 = 32'h00000008;
//         sel = 3'b000;
//         #10;
//         sel = 3'b001;
//         #10;
//         sel = 3'b010;
//         #10;
//         sel = 3'b011;
//         #10;
//         sel = 3'b100;
//         #10;
//         sel = 3'b101;
//         #10;
//         sel = 3'b110;
//         #10;
//         sel = 3'b111;
//         #10;
//         $finish;
//     end
// endmodule
