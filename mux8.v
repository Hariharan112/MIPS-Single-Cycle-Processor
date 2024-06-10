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