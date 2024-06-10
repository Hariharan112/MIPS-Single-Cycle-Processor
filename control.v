`timescale 1ns/1ps

module controller(
    input [5:0] opcode,
    input clk,
    output [2:0] ALUop,
    output regdst, branch, memread, mem2reg, memwrite, alusrc, regwrite
)

always @(posedge clk) begin

    case(opcode) 
        6'b000000: 
            regdst <=1;
            alusrc <=0;
            mem2reg <=0;
            regwrite <=1;
            memread <= 0;
            memwrite <=0;
            branch <=0;
            ALUop <= 2'b10;
        
        6'b1000110: 
            regdst <=0;
            alusrc <=1;
            mem2reg <=1;
            regwrite <=1;
            memread <= 1;
            memwrite <=0;
            branch <=0;
            ALUop <= 2'b00;

        6'b101011:
            regdst <=1'bx;
            alusrc <=1;
            mem2reg <=1'bx;
            regwrite <=0;
            memread <= 0;
            memwrite <=1;
            branch <=0;
            ALUop <= 2'b00;

        6'b000100:
            regdst <=1'bx;
            alusrc <=0;
            mem2reg <=1'bx;
            regwrite <=0;
            memread <= 0;
            memwrite <=0;
            branch <=1;
            ALUop <= 2'b01;

    endcase

end

endmodule
