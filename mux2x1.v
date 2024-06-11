`timescale 1ns / 1ps

//verilog module for 2x1_MUX
module mux_2x1(
    in_0,
    in_1,
    sel,
    Out
    );

    parameter WIDTH = 32;
    input [WIDTH-1:0] in_0;               
    input [WIDTH-1:0] in_1;                
    input sel;              
    output reg [WIDTH-1:0] Out;
    
    always @(*) begin
      case (sel)
        0: 
          Out = in_0;
        1: 
          Out = in_1;
        default: 
          Out = 32'bx; 
      endcase
    end
endmodule

//testbench
// `timescale 1ns / 1ps

// module mux_2x1_tb;

//     reg [31:0] in_0, in_1;
//     reg sel;
//     wire [31:0] Out;

//     mux_2x1 mux_2x1_inst(
//         .in_0(in_0),
//         .in_1(in_1),
//         .sel(sel),
//         .Out(Out)
//     );

//     initial begin
//         $dumpfile("mux_2x1_tb.vcd");
//         $dumpvars(0, mux_2x1_tb);
        
//         in_0 = 32'h00000001;
//         in_1 = 32'h00000002;
//         sel = 0;
//         #10;
//         in_0 = 32'h00000020;
//         in_1 = 32'h00000004;
//         sel = 1;
//         #10;
//         $finish;
//     end
//     endmodule
