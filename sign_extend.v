// Sign extender module

module sign_extend(
    input [15:0] Imm,
    output reg [31:0] extended
    );

    always @(*) begin
        extended[31:0] <= { {16{Imm[15]}}, Imm[15:0]};
    end

endmodule
//testbench

// module sign_extend_tb;

//     reg [15:0] Imm;
//     wire [31:0] extended;

//     sign_extend sign_extend_inst(
//         .Imm(Imm),
//         .extended(extended)
//     );

//     initial begin
//         $dumpfile("sign_extend_tb.vcd");
//         $dumpvars(0, sign_extend_tb);
        
//         Imm = 16'h0001;
//         #10;
//         Imm = 16'h0002;
//         #10;
//         $finish;
//     end
//     endmodule