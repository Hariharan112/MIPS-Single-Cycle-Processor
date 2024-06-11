`timescale 1ns/1ps

module controller(
    input [5:0] opcode,
    input clk,
    output reg [1:0] ALUop,
    output reg regdst, branch, memread, mem2reg, memwrite, alusrc, regwrite
);

always @(posedge clk) begin

    case(opcode) 
        6'b000000: begin
            regdst <=1;
            alusrc <=0;
            mem2reg <=0;
            regwrite <=1;
            memread <= 0;
            memwrite <=0;
            branch <=0;
            ALUop <= 2'b10;
        end
        
        6'b100011: begin 
            regdst <=1'b0;
            alusrc <=1'b1;
            mem2reg <=1'b1;
            regwrite <=1'b1;
            memread <= 1'b1;
            memwrite <=1'b0;
            branch <=1'b0;
            ALUop <= 2'b00;
        end

        6'b101011: begin
            regdst <=1'bx;
            alusrc <=1;
            mem2reg <=1'bx;
            regwrite <=0;
            memread <= 0;
            memwrite <=1;
            branch <=0;
            ALUop <= 2'b00;
        end

        6'b000100:begin
            regdst <=1'bx;
            alusrc <=0;
            mem2reg <=1'bx;
            regwrite <=0;
            memread <= 0;
            memwrite <=0;
            branch <=1;
            ALUop <= 2'b01;
        end

        default: begin
            // Default behavior if none of the cases match
            regdst <= 1'bx;
            alusrc <= 1'bx;
            mem2reg <= 1'bx;
            regwrite <= 1'bx;
            memread <= 1'bx;
            memwrite <= 1'bx;
            branch <= 1'bx;
            ALUop <= 3'bxxx;
        end
    endcase

end

endmodule

//testbench
// `timescale 1ns / 1ps

// module controller_tb;

//     reg [5:0] opcode;
//     reg clk;
//     wire [2:0] ALUop;
//     wire regdst, branch, memread, mem2reg, memwrite, alusrc, regwrite;

//     controller controller_inst(
//         .opcode(opcode),
//         .clk(clk),
//         .ALUop(ALUop),
//         .regdst(regdst),
//         .branch(branch),
//         .memread(memread),
//         .mem2reg(mem2reg),
//         .memwrite(memwrite),
//         .alusrc(alusrc),
//         .regwrite(regwrite)
//     );

//     always #5 clk = ~clk;


//     initial begin
//         $dumpfile("controller_tb.vcd");
//         $dumpvars(0, controller_tb);
        
//         clk = 0;
//         opcode = 6'b000000;
//         #10;
//         opcode = 6'b100011;
//         #10;
//         opcode = 6'b101011;
//         #10;
//         opcode = 6'b000100;
//         #10;
//         $finish;
//     end

// endmodule
