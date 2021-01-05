`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/05 14:10:52
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test();

    logic        rst_i;
    logic        clk_i;

    logic        inst_req;
    logic        inst_wr;
    logic [1:0]  inst_size;

    logic [31:0] inst_addr;
    logic [31:0] inst_wdata;
    logic [31:0] inst_rdata;
    logic        inst_addr_ok;
    logic        inst_data_ok;

    initial begin
        rst_i         = 1'b1;
        clk_i         = 1'b1;
        inst_req      = 1'b0;
        inst_wr       = 1'b0;
        inst_size =2'b11;
        inst_wdata    =32'b0;
        inst_addr     =32'd4;
        # 500 rst_i    = 1'b0;
        # 50 inst_req = 1'b1;

    end
    always #20 clk_i = ~ clk_i;
    always #20 inst_addr = inst_addr + 4;
    // always #5 inst_req = ~inst_req;

    top top_test(
        .clk_i(clk_i),
        .rst_i(rst_i),

        .inst_req(inst_req),
        .inst_wr(inst_wr),
        .inst_size(inst_size),

        .inst_addr(inst_addr),
        .inst_wdata(inst_wdata),

        .inst_rdata(inst_rdata),
        .inst_addr_ok(inst_addr_ok),
        .inst_data_ok(inst_data_ok)
    );

endmodule
