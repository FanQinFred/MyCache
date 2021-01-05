`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/05 13:16:27
// Design Name: 
// Module Name: top
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


module top(
    input clk_i,
    input rst_i,

    //inst sram-like 
    input              inst_req,
    input              inst_wr,
    input  wire [1:0]  inst_size,

    input  wire [31:0] inst_addr,
    input  wire [31:0] inst_wdata,
    output wire [31:0] inst_rdata,
    output             inst_addr_ok,
    output             inst_data_ok

    );

    wire rsta_busy;
    wire rstb_busy;

    wire s_aclk;
    wire s_aresetn;

    wire [3 : 0] s_axi_awid;
    wire [31 : 0] s_axi_awaddr;
    wire [7 : 0] s_axi_awlen;
    wire [2 : 0] s_axi_awsize;
    wire [1 : 0] s_axi_awburst;
    wire s_axi_awvalid;
    wire s_axi_awready;

    wire [31 : 0] s_axi_wdata;
    wire [3 : 0] s_axi_wstrb;
    wire s_axi_wlast;
    wire s_axi_wvalid;
    wire s_axi_wready;

    wire [3 : 0] s_axi_bid;
    wire [1 : 0] s_axi_bresp;
    wire s_axi_bvalid;
    wire s_axi_bready;

    wire [3 : 0] s_axi_arid;
    wire [31 : 0] s_axi_araddr;
    wire [7 : 0] s_axi_arlen;
    wire [2 : 0] s_axi_arsize;
    wire [1 : 0] s_axi_arburst;
    wire s_axi_arvalid;
    wire s_axi_arready;

    wire [3 : 0] s_axi_rid;
    wire [31 : 0] s_axi_rdata;
    wire [1 : 0] s_axi_rresp;
    wire s_axi_rlast;
    wire s_axi_rvalid;
    wire s_axi_rready;

cache_axi_interface axi_interface_instance (
    .clk(clk_i),
    .resetn(~rst_i),

    .inst_req(inst_req),
    .inst_wr(inst_wr),
    .inst_size(inst_size),
    .inst_addr(inst_addr),
    .inst_wdata(inst_wdata),
    .inst_rdata(inst_rdata),
    .inst_addr_ok(inst_addr_ok),
    .inst_data_ok(inst_data_ok),

    .data_req(1'b0),
    .data_wr(1'b0),
    .data_size(2'b00),
    .data_wen(1'b0),
    .data_addr(32'b0),
    .data_wdata(32'b0),
    .data_rdata(),
    .data_addr_ok(),
    .data_data_ok(),

    .arid(s_axi_arid),
    .araddr(s_axi_araddr),
    .arlen(s_axi_arlen),
    .arsize(s_axi_arsize),
    .arburst(s_axi_arburst),
    .arlock(),
    .arcache(),
    .arprot(),
    .arvalid(s_axi_arvalid),
    .arready(s_axi_arready),

    .rid(s_axi_rid),
    .rdata(s_axi_rdata),
    .rresp(s_axi_rresp),
    .rlast(s_axi_rlast),
    .rvalid(s_axi_rvalid),
    .rready(s_axi_rready),


    .awid(s_axi_awid),
    .awaddr(s_axi_awaddr),
    .awlen(s_axi_awlen),
    .awsize(s_axi_awsize),
    .awburst(s_axi_awburst),
    .awlock(),
    .awcache(),
    .awprot(),
    .awvalid(s_axi_awvalid),
    .awready(s_axi_awready),

    .wid(),
    .wdata(s_axi_wdata),
    .wstrb(s_axi_wstrb),
    .wlast(s_axi_wlast),
    .wvalid(s_axi_wvalid),
    .wready(s_axi_wready),

    .bid(s_axi_bid),
    .bresp(s_axi_bresp),
    .bvalid(s_axi_bvalid),
    .bready(s_axi_bready)
);

cache_mem cache_mem_instance_ (
  .rsta_busy(rsta_busy),          // output wire rsta_busy
  .rstb_busy(rstb_busy),          // output wire rstb_busy

  .s_aclk(clk_i),                // input wire s_aclk
  .s_aresetn(rts_i),          // input wire s_aresetn

  .s_axi_awid(s_axi_awid),        // input wire [3 : 0] s_axi_awid
  .s_axi_awaddr(s_axi_awaddr),    // input wire [31 : 0] s_axi_awaddr
  .s_axi_awlen(s_axi_awlen),      // input wire [7 : 0] s_axi_awlen
  .s_axi_awsize(s_axi_awsize),    // input wire [2 : 0] s_axi_awsize
  .s_axi_awburst(s_axi_awburst),  // input wire [1 : 0] s_axi_awburst
  .s_axi_awvalid(s_axi_awvalid),  // input wire s_axi_awvalid
  .s_axi_awready(s_axi_awready),  // output wire s_axi_awready

  .s_axi_wdata(s_axi_wdata),      // input wire [31 : 0] s_axi_wdata
  .s_axi_wstrb(s_axi_wstrb),      // input wire [3 : 0] s_axi_wstrb
  .s_axi_wlast(s_axi_wlast),      // input wire s_axi_wlast
  .s_axi_wvalid(s_axi_wvalid),    // input wire s_axi_wvalid
  .s_axi_wready(s_axi_wready),    // output wire s_axi_wready

  .s_axi_bid(s_axi_bid),          // output wire [3 : 0] s_axi_bid
  .s_axi_bresp(s_axi_bresp),      // output wire [1 : 0] s_axi_bresp
  .s_axi_bvalid(s_axi_bvalid),    // output wire s_axi_bvalid
  .s_axi_bready(s_axi_bready),    // input wire s_axi_bready

  .s_axi_arid(s_axi_arid),        // input wire [3 : 0] s_axi_arid
  .s_axi_araddr(s_axi_araddr),    // input wire [31 : 0] s_axi_araddr
  .s_axi_arlen(s_axi_arlen),      // input wire [7 : 0] s_axi_arlen
  .s_axi_arsize(s_axi_arsize),    // input wire [2 : 0] s_axi_arsize
  .s_axi_arburst(s_axi_arburst),  // input wire [1 : 0] s_axi_arburst
  .s_axi_arvalid(s_axi_arvalid),  // input wire s_axi_arvalid
  .s_axi_arready(s_axi_arready),  // output wire s_axi_arready

  .s_axi_rid(s_axi_rid),          // output wire [3 : 0] s_axi_rid
  .s_axi_rdata(s_axi_rdata),      // output wire [31 : 0] s_axi_rdata
  .s_axi_rresp(s_axi_rresp),      // output wire [1 : 0] s_axi_rresp
  .s_axi_rlast(s_axi_rlast),      // output wire s_axi_rlast
  .s_axi_rvalid(s_axi_rvalid),    // output wire s_axi_rvalid
  .s_axi_rready(s_axi_rready)     // input wire s_axi_rready
);




endmodule
