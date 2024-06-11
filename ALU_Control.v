// Controller for The ALU

`timescale 1ns / 1ps
module ALU_control(
    input [5:0] FF, //Function Field
    input [1:0] ALUop,
    output reg [2:0] ALU_control
    );

    always @(*) begin
        casex (ALUop)
            2'b00: 
                ALU_control = 3'b010; //Add
            2'b01: 
                ALU_control = 4'b110; //Subtract
            2'b1x: 
                casex(FF)
                    6'bxx0000:
                        ALU_control = 3'b010; //Add
                    6'bxx0010:
                        ALU_control = 3'b110; //Subtract
                    6'bxx0100:
                        ALU_control = 3'b000; //AND
                    6'bxx0101:
                        ALU_control = 3'b001; //OR
                    6'bxx1010:
                        ALU_control = 3'b111; //SLT
                    default:
                        ALU_control = 3'bxxx; //Invalid
                endcase
            default:
                ALU_control = 3'bxxx; //Invalid
        endcase
    end
endmodule

//testbench to check module
// `timescale 1ns / 1ps
// module ALU_control_tb;

//     reg [5:0] FF;
//     reg [1:0] ALUop;
//     wire [2:0] ALU_control;

//     ALU_control ALU_control_inst(
//         .FF(FF),
//         .ALUop(ALUop),
//         .ALU_control(ALU_control)
//     );

//     initial begin
//         $dumpfile("ALU_control_tb.vcd");
//         $dumpvars(0, ALU_control_tb);
        
//         FF = 6'b000000;
//         ALUop = 2'b00;
//         #10;
//         FF = 6'b000010;
//         ALUop = 2'b01;
//         #10;
//         FF = 6'b000000;
//         ALUop = 2'b10;
//         #10;
//         FF = 6'b000010;
//         ALUop = 2'b10;
//         #10;
//         FF = 6'b000100;
//         ALUop = 2'b10;
//         #10;
//         FF = 6'b000101;
//         ALUop = 2'b10;
//         #10;
//         FF = 6'b001010;
//         ALUop = 2'b10;
//         #10;
//         $finish;
//     end

// endmodule
