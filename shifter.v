//Shifter module
`timescale 1ns/1ps

module shifter(
    input [31:0] in,
    output [31:0] shifted
    );

    assign shifted = in << 2;

endmodule

//testbench

// `timescale 1ns/1ps

// module shifter_tb;

//     reg [31:0] in;
//     wire [31:0] shifted;

//     shifter shifter_inst(
//         .in(in),
//         .shifted(shifted)
//     );

//     initial begin
//         $dumpfile("shifter_tb.vcd");
//         $dumpvars(0, shifter_tb);

//         in = 32'h00000001;
//         #10;
//         in = 32'h00000002;
//         #10;
//         $finish;
//     end
//     endmodule
