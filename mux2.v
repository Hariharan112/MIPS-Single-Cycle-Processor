// 2x1 mux for width of 5 bits
`timescale 1ns / 1ps
module mux2(
    in_0,
    in_1,
    sel,
    Out
    );

    parameter WIDTH = 5;
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