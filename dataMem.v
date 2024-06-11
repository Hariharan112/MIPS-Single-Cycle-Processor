`timescale 1ns/1ps

module DataMem(
    input clk,
    input memread, memwrite,
    input [31:0] address, writeData,
    output reg [31:0] data1
);


reg [7:0] memory [255:0]; 
//initialize memory
initial begin
    memory[0] = 8'h00;
    memory [1] = 8'h11;
    memory [2] = 8'h10;
    memory [3] =  8'hAA;
    //continue ...
end

always @(posedge clk) begin
    if (memwrite) begin
        memory[address] <= writeData[31:24];
        memory[address +1] <= writeData[23:16];
        memory[address +2] <= writeData[15:8];
        memory[address +3] <= writeData[7:0];
        
    end
    
    if (memread) begin
        data1[31:24] <=memory[address];
        data1[23:16] <= memory[address+1];
        data1[15:8] <= memory[address+2];
        data1[7:0] <= memory[address+3];
    end
end


endmodule

// Testbench to check module
// `timescale 1ns / 1ps

// module DataMem_tb;

//     reg clk, memread, memwrite;
//     reg [31:0] address, writeData;
//     wire [31:0] data;

//     DataMem DataMem_inst(
//         .clk(clk),
//         .memread(memread),
//         .memwrite(memwrite),
//         .address(address),
//         .writeData(writeData),
//         .data1(data)
//     );
//     always #5 clk = ~clk;
//     initial begin
//         $dumpfile("DataMem_tb.vcd");
//         $dumpvars(0, DataMem_tb);
//         clk = 0;

//         memread = 1'b0;
//         memwrite = 1'b0;
//         address = 32'h00000000;
//         writeData = 32'h00000000;
//         #10;

//         memread = 1'b0;
//         memwrite = 1'b1;
//         address = 32'h00000000;
//         writeData = 32'h00000001;
//         #10;

//         memread = 1'b1;
//         memwrite = 1'b0;
//         address = 32'h00000000;
//         writeData = 32'h00000000;
//         #10;
//         $finish;
//     end

// endmodule