// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Sun Jul  8 17:37:56 2018
// Host        : voldemort-x running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               D:/pingpong2/pingpong2.sim/mySim/synth/func/xsim/memorycontrol_t_func_synth.v
// Design      : memorycontrol
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a15tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dat_mem,blk_mem_gen_v8_4_1,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.2" *) 
module dat_mem
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "1" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.1309 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "dat_mem.mem" *) 
  (* C_INIT_FILE_NAME = "dat_mem.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "READ_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dat_mem_blk_mem_gen_v8_4_1 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "ins_mem,blk_mem_gen_v8_4_1,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.2" *) 
module ins_mem
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "1" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.622 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "ins_mem.mem" *) 
  (* C_INIT_FILE_NAME = "ins_mem.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  ins_mem_blk_mem_gen_v8_4_1 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule

(* NotValidForBitStream *)
module memorycontrol
   (clk,
    Address,
    WriteData,
    Read,
    Write,
    ReadData,
    keys,
    led,
    cs,
    digit);
  input clk;
  input [31:0]Address;
  input [31:0]WriteData;
  input Read;
  input Write;
  output [31:0]ReadData;
  input [3:0]keys;
  output [15:0]led;
  output [3:0]cs;
  output [7:0]digit;

  wire [31:0]Address;
  wire [13:0]Address_IBUF;
  wire Read;
  wire [31:0]ReadData;
  wire \ReadData[4]_i_1_n_0 ;
  wire \ReadData[4]_i_3_n_0 ;
  wire \ReadData[4]_i_4_n_0 ;
  wire \ReadData[4]_i_5_n_0 ;
  wire \ReadData[4]_i_6_n_0 ;
  wire \ReadData[4]_i_7_n_0 ;
  wire [4:0]ReadData_OBUF;
  wire Read_IBUF;
  wire Write;
  wire [31:0]WriteData;
  wire [31:0]WriteData_IBUF;
  wire Write_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [3:0]cs;
  wire \cs[3]_i_1_n_0 ;
  wire [3:0]cs_OBUF;
  wire [7:0]digit;
  wire [7:0]digit_OBUF;
  wire en_RAM;
  wire en_ROM;
  wire [3:0]keys;
  wire [3:0]keys_IBUF;
  wire [15:0]led;
  wire \led[15]_i_1_n_0 ;
  wire [15:0]led_OBUF;
  wire [4:0]p_1_in;
  wire temp;
  wire [31:1]NLW_RAM_douta_UNCONNECTED;
  wire [31:1]NLW_ROM_douta_UNCONNECTED;

  IBUF \Address_IBUF[0]_inst 
       (.I(Address[0]),
        .O(Address_IBUF[0]));
  IBUF \Address_IBUF[10]_inst 
       (.I(Address[10]),
        .O(Address_IBUF[10]));
  IBUF \Address_IBUF[11]_inst 
       (.I(Address[11]),
        .O(Address_IBUF[11]));
  IBUF \Address_IBUF[12]_inst 
       (.I(Address[12]),
        .O(Address_IBUF[12]));
  IBUF \Address_IBUF[13]_inst 
       (.I(Address[13]),
        .O(Address_IBUF[13]));
  IBUF \Address_IBUF[1]_inst 
       (.I(Address[1]),
        .O(Address_IBUF[1]));
  IBUF \Address_IBUF[2]_inst 
       (.I(Address[2]),
        .O(Address_IBUF[2]));
  IBUF \Address_IBUF[3]_inst 
       (.I(Address[3]),
        .O(Address_IBUF[3]));
  IBUF \Address_IBUF[4]_inst 
       (.I(Address[4]),
        .O(Address_IBUF[4]));
  IBUF \Address_IBUF[5]_inst 
       (.I(Address[5]),
        .O(Address_IBUF[5]));
  IBUF \Address_IBUF[6]_inst 
       (.I(Address[6]),
        .O(Address_IBUF[6]));
  IBUF \Address_IBUF[7]_inst 
       (.I(Address[7]),
        .O(Address_IBUF[7]));
  IBUF \Address_IBUF[8]_inst 
       (.I(Address[8]),
        .O(Address_IBUF[8]));
  IBUF \Address_IBUF[9]_inst 
       (.I(Address[9]),
        .O(Address_IBUF[9]));
  (* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.2" *) 
  dat_mem RAM
       (.addra(Address_IBUF[9:0]),
        .clka(clk_IBUF_BUFG),
        .dina(WriteData_IBUF),
        .douta({NLW_RAM_douta_UNCONNECTED[31:1],temp}),
        .ena(en_RAM),
        .wea(Write_IBUF));
  LUT6 #(
    .INIT(64'h0101010000000000)) 
    RAM_i_1
       (.I0(Address_IBUF[11]),
        .I1(Address_IBUF[13]),
        .I2(Address_IBUF[12]),
        .I3(Read_IBUF),
        .I4(Write_IBUF),
        .I5(Address_IBUF[10]),
        .O(en_RAM));
  (* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.2" *) 
  ins_mem ROM
       (.addra(Address_IBUF[9:0]),
        .clka(clk_IBUF_BUFG),
        .douta({NLW_ROM_douta_UNCONNECTED[31:1],temp}),
        .ena(en_ROM));
  LUT5 #(
    .INIT(32'h00000100)) 
    ROM_i_1
       (.I0(Address_IBUF[11]),
        .I1(Address_IBUF[13]),
        .I2(Address_IBUF[12]),
        .I3(Read_IBUF),
        .I4(Address_IBUF[10]),
        .O(en_ROM));
  LUT6 #(
    .INIT(64'hAAABAAAAAAA8AAAA)) 
    \ReadData[0]_i_1 
       (.I0(temp),
        .I1(\ReadData[4]_i_7_n_0 ),
        .I2(\ReadData[4]_i_6_n_0 ),
        .I3(\ReadData[4]_i_5_n_0 ),
        .I4(\ReadData[4]_i_4_n_0 ),
        .I5(keys_IBUF[0]),
        .O(p_1_in[0]));
  LUT5 #(
    .INIT(32'h00000008)) 
    \ReadData[1]_i_1 
       (.I0(keys_IBUF[1]),
        .I1(\ReadData[4]_i_4_n_0 ),
        .I2(\ReadData[4]_i_5_n_0 ),
        .I3(\ReadData[4]_i_6_n_0 ),
        .I4(\ReadData[4]_i_7_n_0 ),
        .O(p_1_in[1]));
  LUT5 #(
    .INIT(32'h00000008)) 
    \ReadData[3]_i_1 
       (.I0(keys_IBUF[2]),
        .I1(\ReadData[4]_i_4_n_0 ),
        .I2(\ReadData[4]_i_5_n_0 ),
        .I3(\ReadData[4]_i_6_n_0 ),
        .I4(\ReadData[4]_i_7_n_0 ),
        .O(p_1_in[3]));
  LUT5 #(
    .INIT(32'hAAAAAAAE)) 
    \ReadData[4]_i_1 
       (.I0(\ReadData[4]_i_3_n_0 ),
        .I1(\ReadData[4]_i_4_n_0 ),
        .I2(\ReadData[4]_i_5_n_0 ),
        .I3(\ReadData[4]_i_6_n_0 ),
        .I4(\ReadData[4]_i_7_n_0 ),
        .O(\ReadData[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000008)) 
    \ReadData[4]_i_2 
       (.I0(keys_IBUF[3]),
        .I1(\ReadData[4]_i_4_n_0 ),
        .I2(\ReadData[4]_i_5_n_0 ),
        .I3(\ReadData[4]_i_6_n_0 ),
        .I4(\ReadData[4]_i_7_n_0 ),
        .O(p_1_in[4]));
  LUT6 #(
    .INIT(64'h00000000000000F8)) 
    \ReadData[4]_i_3 
       (.I0(Address_IBUF[10]),
        .I1(Write_IBUF),
        .I2(Read_IBUF),
        .I3(Address_IBUF[12]),
        .I4(Address_IBUF[13]),
        .I5(Address_IBUF[11]),
        .O(\ReadData[4]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \ReadData[4]_i_4 
       (.I0(Address_IBUF[5]),
        .I1(Address_IBUF[6]),
        .I2(Address_IBUF[4]),
        .I3(Address_IBUF[7]),
        .O(\ReadData[4]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \ReadData[4]_i_5 
       (.I0(Address_IBUF[9]),
        .I1(Address_IBUF[10]),
        .I2(Address_IBUF[11]),
        .I3(Address_IBUF[13]),
        .O(\ReadData[4]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \ReadData[4]_i_6 
       (.I0(Address_IBUF[12]),
        .I1(Address_IBUF[3]),
        .I2(Address_IBUF[8]),
        .I3(Address_IBUF[2]),
        .O(\ReadData[4]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hDF)) 
    \ReadData[4]_i_7 
       (.I0(Address_IBUF[0]),
        .I1(Address_IBUF[1]),
        .I2(Read_IBUF),
        .O(\ReadData[4]_i_7_n_0 ));
  OBUF \ReadData_OBUF[0]_inst 
       (.I(ReadData_OBUF[0]),
        .O(ReadData[0]));
  OBUF \ReadData_OBUF[10]_inst 
       (.I(1'b0),
        .O(ReadData[10]));
  OBUF \ReadData_OBUF[11]_inst 
       (.I(1'b0),
        .O(ReadData[11]));
  OBUF \ReadData_OBUF[12]_inst 
       (.I(1'b0),
        .O(ReadData[12]));
  OBUF \ReadData_OBUF[13]_inst 
       (.I(1'b0),
        .O(ReadData[13]));
  OBUF \ReadData_OBUF[14]_inst 
       (.I(1'b0),
        .O(ReadData[14]));
  OBUF \ReadData_OBUF[15]_inst 
       (.I(1'b0),
        .O(ReadData[15]));
  OBUF \ReadData_OBUF[16]_inst 
       (.I(1'b0),
        .O(ReadData[16]));
  OBUF \ReadData_OBUF[17]_inst 
       (.I(1'b0),
        .O(ReadData[17]));
  OBUF \ReadData_OBUF[18]_inst 
       (.I(1'b0),
        .O(ReadData[18]));
  OBUF \ReadData_OBUF[19]_inst 
       (.I(1'b0),
        .O(ReadData[19]));
  OBUF \ReadData_OBUF[1]_inst 
       (.I(ReadData_OBUF[1]),
        .O(ReadData[1]));
  OBUF \ReadData_OBUF[20]_inst 
       (.I(1'b0),
        .O(ReadData[20]));
  OBUF \ReadData_OBUF[21]_inst 
       (.I(1'b0),
        .O(ReadData[21]));
  OBUF \ReadData_OBUF[22]_inst 
       (.I(1'b0),
        .O(ReadData[22]));
  OBUF \ReadData_OBUF[23]_inst 
       (.I(1'b0),
        .O(ReadData[23]));
  OBUF \ReadData_OBUF[24]_inst 
       (.I(1'b0),
        .O(ReadData[24]));
  OBUF \ReadData_OBUF[25]_inst 
       (.I(1'b0),
        .O(ReadData[25]));
  OBUF \ReadData_OBUF[26]_inst 
       (.I(1'b0),
        .O(ReadData[26]));
  OBUF \ReadData_OBUF[27]_inst 
       (.I(1'b0),
        .O(ReadData[27]));
  OBUF \ReadData_OBUF[28]_inst 
       (.I(1'b0),
        .O(ReadData[28]));
  OBUF \ReadData_OBUF[29]_inst 
       (.I(1'b0),
        .O(ReadData[29]));
  OBUF \ReadData_OBUF[2]_inst 
       (.I(1'b0),
        .O(ReadData[2]));
  OBUF \ReadData_OBUF[30]_inst 
       (.I(1'b0),
        .O(ReadData[30]));
  OBUF \ReadData_OBUF[31]_inst 
       (.I(1'b0),
        .O(ReadData[31]));
  OBUF \ReadData_OBUF[3]_inst 
       (.I(ReadData_OBUF[3]),
        .O(ReadData[3]));
  OBUF \ReadData_OBUF[4]_inst 
       (.I(ReadData_OBUF[4]),
        .O(ReadData[4]));
  OBUF \ReadData_OBUF[5]_inst 
       (.I(1'b0),
        .O(ReadData[5]));
  OBUF \ReadData_OBUF[6]_inst 
       (.I(1'b0),
        .O(ReadData[6]));
  OBUF \ReadData_OBUF[7]_inst 
       (.I(1'b0),
        .O(ReadData[7]));
  OBUF \ReadData_OBUF[8]_inst 
       (.I(1'b0),
        .O(ReadData[8]));
  OBUF \ReadData_OBUF[9]_inst 
       (.I(1'b0),
        .O(ReadData[9]));
  FDRE #(
    .INIT(1'b0)) 
    \ReadData_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\ReadData[4]_i_1_n_0 ),
        .D(p_1_in[0]),
        .Q(ReadData_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ReadData_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\ReadData[4]_i_1_n_0 ),
        .D(p_1_in[1]),
        .Q(ReadData_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ReadData_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\ReadData[4]_i_1_n_0 ),
        .D(p_1_in[3]),
        .Q(ReadData_OBUF[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ReadData_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\ReadData[4]_i_1_n_0 ),
        .D(p_1_in[4]),
        .Q(ReadData_OBUF[4]),
        .R(1'b0));
  IBUF Read_IBUF_inst
       (.I(Read),
        .O(Read_IBUF));
  IBUF \WriteData_IBUF[0]_inst 
       (.I(WriteData[0]),
        .O(WriteData_IBUF[0]));
  IBUF \WriteData_IBUF[10]_inst 
       (.I(WriteData[10]),
        .O(WriteData_IBUF[10]));
  IBUF \WriteData_IBUF[11]_inst 
       (.I(WriteData[11]),
        .O(WriteData_IBUF[11]));
  IBUF \WriteData_IBUF[12]_inst 
       (.I(WriteData[12]),
        .O(WriteData_IBUF[12]));
  IBUF \WriteData_IBUF[13]_inst 
       (.I(WriteData[13]),
        .O(WriteData_IBUF[13]));
  IBUF \WriteData_IBUF[14]_inst 
       (.I(WriteData[14]),
        .O(WriteData_IBUF[14]));
  IBUF \WriteData_IBUF[15]_inst 
       (.I(WriteData[15]),
        .O(WriteData_IBUF[15]));
  IBUF \WriteData_IBUF[16]_inst 
       (.I(WriteData[16]),
        .O(WriteData_IBUF[16]));
  IBUF \WriteData_IBUF[17]_inst 
       (.I(WriteData[17]),
        .O(WriteData_IBUF[17]));
  IBUF \WriteData_IBUF[18]_inst 
       (.I(WriteData[18]),
        .O(WriteData_IBUF[18]));
  IBUF \WriteData_IBUF[19]_inst 
       (.I(WriteData[19]),
        .O(WriteData_IBUF[19]));
  IBUF \WriteData_IBUF[1]_inst 
       (.I(WriteData[1]),
        .O(WriteData_IBUF[1]));
  IBUF \WriteData_IBUF[20]_inst 
       (.I(WriteData[20]),
        .O(WriteData_IBUF[20]));
  IBUF \WriteData_IBUF[21]_inst 
       (.I(WriteData[21]),
        .O(WriteData_IBUF[21]));
  IBUF \WriteData_IBUF[22]_inst 
       (.I(WriteData[22]),
        .O(WriteData_IBUF[22]));
  IBUF \WriteData_IBUF[23]_inst 
       (.I(WriteData[23]),
        .O(WriteData_IBUF[23]));
  IBUF \WriteData_IBUF[24]_inst 
       (.I(WriteData[24]),
        .O(WriteData_IBUF[24]));
  IBUF \WriteData_IBUF[25]_inst 
       (.I(WriteData[25]),
        .O(WriteData_IBUF[25]));
  IBUF \WriteData_IBUF[26]_inst 
       (.I(WriteData[26]),
        .O(WriteData_IBUF[26]));
  IBUF \WriteData_IBUF[27]_inst 
       (.I(WriteData[27]),
        .O(WriteData_IBUF[27]));
  IBUF \WriteData_IBUF[28]_inst 
       (.I(WriteData[28]),
        .O(WriteData_IBUF[28]));
  IBUF \WriteData_IBUF[29]_inst 
       (.I(WriteData[29]),
        .O(WriteData_IBUF[29]));
  IBUF \WriteData_IBUF[2]_inst 
       (.I(WriteData[2]),
        .O(WriteData_IBUF[2]));
  IBUF \WriteData_IBUF[30]_inst 
       (.I(WriteData[30]),
        .O(WriteData_IBUF[30]));
  IBUF \WriteData_IBUF[31]_inst 
       (.I(WriteData[31]),
        .O(WriteData_IBUF[31]));
  IBUF \WriteData_IBUF[3]_inst 
       (.I(WriteData[3]),
        .O(WriteData_IBUF[3]));
  IBUF \WriteData_IBUF[4]_inst 
       (.I(WriteData[4]),
        .O(WriteData_IBUF[4]));
  IBUF \WriteData_IBUF[5]_inst 
       (.I(WriteData[5]),
        .O(WriteData_IBUF[5]));
  IBUF \WriteData_IBUF[6]_inst 
       (.I(WriteData[6]),
        .O(WriteData_IBUF[6]));
  IBUF \WriteData_IBUF[7]_inst 
       (.I(WriteData[7]),
        .O(WriteData_IBUF[7]));
  IBUF \WriteData_IBUF[8]_inst 
       (.I(WriteData[8]),
        .O(WriteData_IBUF[8]));
  IBUF \WriteData_IBUF[9]_inst 
       (.I(WriteData[9]),
        .O(WriteData_IBUF[9]));
  IBUF Write_IBUF_inst
       (.I(Write),
        .O(Write_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT6 #(
    .INIT(64'h0000040000000000)) 
    \cs[3]_i_1 
       (.I0(\ReadData[4]_i_6_n_0 ),
        .I1(\ReadData[4]_i_4_n_0 ),
        .I2(\ReadData[4]_i_5_n_0 ),
        .I3(Read_IBUF),
        .I4(Address_IBUF[0]),
        .I5(Address_IBUF[1]),
        .O(\cs[3]_i_1_n_0 ));
  OBUF \cs_OBUF[0]_inst 
       (.I(cs_OBUF[0]),
        .O(cs[0]));
  OBUF \cs_OBUF[1]_inst 
       (.I(cs_OBUF[1]),
        .O(cs[1]));
  OBUF \cs_OBUF[2]_inst 
       (.I(cs_OBUF[2]),
        .O(cs[2]));
  OBUF \cs_OBUF[3]_inst 
       (.I(cs_OBUF[3]),
        .O(cs[3]));
  FDRE #(
    .INIT(1'b0)) 
    \cs_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\cs[3]_i_1_n_0 ),
        .D(WriteData_IBUF[8]),
        .Q(cs_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cs_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\cs[3]_i_1_n_0 ),
        .D(WriteData_IBUF[9]),
        .Q(cs_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cs_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\cs[3]_i_1_n_0 ),
        .D(WriteData_IBUF[10]),
        .Q(cs_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cs_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\cs[3]_i_1_n_0 ),
        .D(WriteData_IBUF[11]),
        .Q(cs_OBUF[3]),
        .R(1'b0));
  OBUF \digit_OBUF[0]_inst 
       (.I(digit_OBUF[0]),
        .O(digit[0]));
  OBUF \digit_OBUF[1]_inst 
       (.I(digit_OBUF[1]),
        .O(digit[1]));
  OBUF \digit_OBUF[2]_inst 
       (.I(digit_OBUF[2]),
        .O(digit[2]));
  OBUF \digit_OBUF[3]_inst 
       (.I(digit_OBUF[3]),
        .O(digit[3]));
  OBUF \digit_OBUF[4]_inst 
       (.I(digit_OBUF[4]),
        .O(digit[4]));
  OBUF \digit_OBUF[5]_inst 
       (.I(digit_OBUF[5]),
        .O(digit[5]));
  OBUF \digit_OBUF[6]_inst 
       (.I(digit_OBUF[6]),
        .O(digit[6]));
  OBUF \digit_OBUF[7]_inst 
       (.I(digit_OBUF[7]),
        .O(digit[7]));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\cs[3]_i_1_n_0 ),
        .D(WriteData_IBUF[0]),
        .Q(digit_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\cs[3]_i_1_n_0 ),
        .D(WriteData_IBUF[1]),
        .Q(digit_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\cs[3]_i_1_n_0 ),
        .D(WriteData_IBUF[2]),
        .Q(digit_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\cs[3]_i_1_n_0 ),
        .D(WriteData_IBUF[3]),
        .Q(digit_OBUF[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\cs[3]_i_1_n_0 ),
        .D(WriteData_IBUF[4]),
        .Q(digit_OBUF[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\cs[3]_i_1_n_0 ),
        .D(WriteData_IBUF[5]),
        .Q(digit_OBUF[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\cs[3]_i_1_n_0 ),
        .D(WriteData_IBUF[6]),
        .Q(digit_OBUF[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\cs[3]_i_1_n_0 ),
        .D(WriteData_IBUF[7]),
        .Q(digit_OBUF[7]),
        .R(1'b0));
  IBUF \keys_IBUF[0]_inst 
       (.I(keys[0]),
        .O(keys_IBUF[0]));
  IBUF \keys_IBUF[1]_inst 
       (.I(keys[1]),
        .O(keys_IBUF[1]));
  IBUF \keys_IBUF[2]_inst 
       (.I(keys[2]),
        .O(keys_IBUF[2]));
  IBUF \keys_IBUF[3]_inst 
       (.I(keys[3]),
        .O(keys_IBUF[3]));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    \led[15]_i_1 
       (.I0(\ReadData[4]_i_6_n_0 ),
        .I1(\ReadData[4]_i_4_n_0 ),
        .I2(\ReadData[4]_i_5_n_0 ),
        .I3(Address_IBUF[0]),
        .I4(Write_IBUF),
        .I5(Address_IBUF[1]),
        .O(\led[15]_i_1_n_0 ));
  OBUF \led_OBUF[0]_inst 
       (.I(led_OBUF[0]),
        .O(led[0]));
  OBUF \led_OBUF[10]_inst 
       (.I(led_OBUF[10]),
        .O(led[10]));
  OBUF \led_OBUF[11]_inst 
       (.I(led_OBUF[11]),
        .O(led[11]));
  OBUF \led_OBUF[12]_inst 
       (.I(led_OBUF[12]),
        .O(led[12]));
  OBUF \led_OBUF[13]_inst 
       (.I(led_OBUF[13]),
        .O(led[13]));
  OBUF \led_OBUF[14]_inst 
       (.I(led_OBUF[14]),
        .O(led[14]));
  OBUF \led_OBUF[15]_inst 
       (.I(led_OBUF[15]),
        .O(led[15]));
  OBUF \led_OBUF[1]_inst 
       (.I(led_OBUF[1]),
        .O(led[1]));
  OBUF \led_OBUF[2]_inst 
       (.I(led_OBUF[2]),
        .O(led[2]));
  OBUF \led_OBUF[3]_inst 
       (.I(led_OBUF[3]),
        .O(led[3]));
  OBUF \led_OBUF[4]_inst 
       (.I(led_OBUF[4]),
        .O(led[4]));
  OBUF \led_OBUF[5]_inst 
       (.I(led_OBUF[5]),
        .O(led[5]));
  OBUF \led_OBUF[6]_inst 
       (.I(led_OBUF[6]),
        .O(led[6]));
  OBUF \led_OBUF[7]_inst 
       (.I(led_OBUF[7]),
        .O(led[7]));
  OBUF \led_OBUF[8]_inst 
       (.I(led_OBUF[8]),
        .O(led[8]));
  OBUF \led_OBUF[9]_inst 
       (.I(led_OBUF[9]),
        .O(led[9]));
  FDRE #(
    .INIT(1'b0)) 
    \led_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\led[15]_i_1_n_0 ),
        .D(WriteData_IBUF[0]),
        .Q(led_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\led[15]_i_1_n_0 ),
        .D(WriteData_IBUF[10]),
        .Q(led_OBUF[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\led[15]_i_1_n_0 ),
        .D(WriteData_IBUF[11]),
        .Q(led_OBUF[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\led[15]_i_1_n_0 ),
        .D(WriteData_IBUF[12]),
        .Q(led_OBUF[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\led[15]_i_1_n_0 ),
        .D(WriteData_IBUF[13]),
        .Q(led_OBUF[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\led[15]_i_1_n_0 ),
        .D(WriteData_IBUF[14]),
        .Q(led_OBUF[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\led[15]_i_1_n_0 ),
        .D(WriteData_IBUF[15]),
        .Q(led_OBUF[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\led[15]_i_1_n_0 ),
        .D(WriteData_IBUF[1]),
        .Q(led_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\led[15]_i_1_n_0 ),
        .D(WriteData_IBUF[2]),
        .Q(led_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\led[15]_i_1_n_0 ),
        .D(WriteData_IBUF[3]),
        .Q(led_OBUF[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\led[15]_i_1_n_0 ),
        .D(WriteData_IBUF[4]),
        .Q(led_OBUF[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\led[15]_i_1_n_0 ),
        .D(WriteData_IBUF[5]),
        .Q(led_OBUF[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\led[15]_i_1_n_0 ),
        .D(WriteData_IBUF[6]),
        .Q(led_OBUF[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\led[15]_i_1_n_0 ),
        .D(WriteData_IBUF[7]),
        .Q(led_OBUF[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\led[15]_i_1_n_0 ),
        .D(WriteData_IBUF[8]),
        .Q(led_OBUF[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \led_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\led[15]_i_1_n_0 ),
        .D(WriteData_IBUF[9]),
        .Q(led_OBUF[9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module dat_mem_blk_mem_gen_generic_cstr
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [31:0]douta;
  input clka;
  input ena;
  input [9:0]addra;
  input [31:0]dina;
  input [0:0]wea;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;

  dat_mem_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module dat_mem_blk_mem_gen_prim_width
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [31:0]douta;
  input clka;
  input ena;
  input [9:0]addra;
  input [31:0]dina;
  input [0:0]wea;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;

  dat_mem_blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module dat_mem_blk_mem_gen_prim_wrapper_init
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [31:0]douta;
  input clka;
  input ena;
  input [9:0]addra;
  input [31:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_68 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_69 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_70 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_71 ;
  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_01(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_02(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_03(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_04(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_05(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_06(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_07(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_08(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_09(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_0A(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_0B(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_0C(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_0D(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_0E(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_0F(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_10(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_11(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_12(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_13(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_14(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_15(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_16(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_17(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_18(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_19(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_1A(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_1B(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_1C(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_1D(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_1E(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_1F(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_20(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_21(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_22(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_23(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_24(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_25(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_26(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_27(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_28(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_29(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_2A(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_2B(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_2C(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_2D(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_2E(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_2F(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_30(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_31(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_32(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_33(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_34(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_35(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_36(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_37(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_38(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_39(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_3A(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_3B(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_3C(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_3D(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_3E(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_3F(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_40(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_41(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_42(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_43(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_44(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_45(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_46(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_47(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_48(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_49(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_4A(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_4B(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_4C(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_4D(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_4E(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_4F(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_50(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_51(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_52(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_53(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_54(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_55(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_56(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_57(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_58(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_59(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_5A(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_5B(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_5C(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_5D(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_5E(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_5F(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_60(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_61(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_62(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_63(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_64(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_65(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_66(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_67(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_68(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_69(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_6A(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_6B(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_6C(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_6D(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_6E(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_6F(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_70(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_71(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_72(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_73(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_74(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_75(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_76(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_77(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_78(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_79(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_7A(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_7B(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_7C(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_7D(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_7E(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_7F(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI(dina),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(douta),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_68 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_69 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_70 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_71 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(ena),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module dat_mem_blk_mem_gen_top
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [31:0]douta;
  input clka;
  input ena;
  input [9:0]addra;
  input [31:0]dina;
  input [0:0]wea;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;

  dat_mem_blk_mem_gen_generic_cstr \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* C_ADDRA_WIDTH = "10" *) (* C_ADDRB_WIDTH = "10" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "0" *) 
(* C_COUNT_36K_BRAM = "1" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "1" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.1309 mW" *) 
(* C_FAMILY = "artix7" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "dat_mem.mem" *) 
(* C_INIT_FILE_NAME = "dat_mem.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "0" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "1024" *) (* C_READ_DEPTH_B = "1024" *) (* C_READ_WIDTH_A = "32" *) 
(* C_READ_WIDTH_B = "32" *) (* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) 
(* C_RST_PRIORITY_A = "CE" *) (* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) 
(* C_USE_BRAM_BLOCK = "0" *) (* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) 
(* C_USE_DEFAULT_DATA = "1" *) (* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) 
(* C_USE_URAM = "0" *) (* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) 
(* C_WRITE_DEPTH_A = "1024" *) (* C_WRITE_DEPTH_B = "1024" *) (* C_WRITE_MODE_A = "READ_FIRST" *) 
(* C_WRITE_MODE_B = "WRITE_FIRST" *) (* C_WRITE_WIDTH_A = "32" *) (* C_WRITE_WIDTH_B = "32" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "blk_mem_gen_v8_4_1" *) (* downgradeipidentifiedwarnings = "yes" *) 
module dat_mem_blk_mem_gen_v8_4_1
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [9:0]addra;
  input [31:0]dina;
  output [31:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [9:0]addrb;
  input [31:0]dinb;
  output [31:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [9:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [9:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;

  assign dbiterr = \<const0> ;
  assign doutb[31] = \<const0> ;
  assign doutb[30] = \<const0> ;
  assign doutb[29] = \<const0> ;
  assign doutb[28] = \<const0> ;
  assign doutb[27] = \<const0> ;
  assign doutb[26] = \<const0> ;
  assign doutb[25] = \<const0> ;
  assign doutb[24] = \<const0> ;
  assign doutb[23] = \<const0> ;
  assign doutb[22] = \<const0> ;
  assign doutb[21] = \<const0> ;
  assign doutb[20] = \<const0> ;
  assign doutb[19] = \<const0> ;
  assign doutb[18] = \<const0> ;
  assign doutb[17] = \<const0> ;
  assign doutb[16] = \<const0> ;
  assign doutb[15] = \<const0> ;
  assign doutb[14] = \<const0> ;
  assign doutb[13] = \<const0> ;
  assign doutb[12] = \<const0> ;
  assign doutb[11] = \<const0> ;
  assign doutb[10] = \<const0> ;
  assign doutb[9] = \<const0> ;
  assign doutb[8] = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  dat_mem_blk_mem_gen_v8_4_1_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_1_synth" *) 
module dat_mem_blk_mem_gen_v8_4_1_synth
   (douta,
    clka,
    ena,
    addra,
    dina,
    wea);
  output [31:0]douta;
  input clka;
  input ena;
  input [9:0]addra;
  input [31:0]dina;
  input [0:0]wea;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;

  dat_mem_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .ena(ena),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module ins_mem_blk_mem_gen_generic_cstr
   (douta,
    clka,
    ena,
    addra);
  output [31:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;

  ins_mem_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module ins_mem_blk_mem_gen_prim_width
   (douta,
    clka,
    ena,
    addra);
  output [31:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;

  ins_mem_blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module ins_mem_blk_mem_gen_prim_wrapper_init
   (douta,
    clka,
    ena,
    addra);
  output [31:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_68 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_69 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_70 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_71 ;
  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h000000010000000100000001000000010000000100000001204200015C020400),
    .INIT_01(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_02(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_03(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_04(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_05(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_06(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_07(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_08(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_09(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_0A(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_0B(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_0C(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_0D(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_0E(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_0F(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_10(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_11(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_12(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_13(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_14(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_15(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_16(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_17(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_18(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_19(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_1A(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_1B(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_1C(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_1D(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_1E(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_1F(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_20(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_21(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_22(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_23(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_24(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_25(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_26(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_27(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_28(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_29(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_2A(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_2B(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_2C(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_2D(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_2E(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_2F(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_30(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_31(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_32(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_33(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_34(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_35(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_36(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_37(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_38(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_39(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_3A(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_3B(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_3C(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_3D(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_3E(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_3F(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_40(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_41(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_42(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_43(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_44(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_45(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_46(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_47(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_48(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_49(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_4A(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_4B(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_4C(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_4D(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_4E(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_4F(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_50(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_51(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_52(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_53(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_54(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_55(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_56(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_57(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_58(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_59(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_5A(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_5B(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_5C(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_5D(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_5E(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_5F(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_60(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_61(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_62(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_63(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_64(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_65(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_66(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_67(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_68(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_69(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_6A(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_6B(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_6C(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_6D(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_6E(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_6F(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_70(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_71(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_72(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_73(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_74(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_75(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_76(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_77(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_78(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_79(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_7A(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_7B(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_7C(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_7D(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_7E(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_7F(256'h0000000100000001000000010000000100000001000000010000000100000001),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(douta),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_68 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_69 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_70 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_71 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(ena),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module ins_mem_blk_mem_gen_top
   (douta,
    clka,
    ena,
    addra);
  output [31:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;

  ins_mem_blk_mem_gen_generic_cstr \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* C_ADDRA_WIDTH = "10" *) (* C_ADDRB_WIDTH = "10" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "0" *) 
(* C_COUNT_36K_BRAM = "1" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "1" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.622 mW" *) 
(* C_FAMILY = "artix7" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "ins_mem.mem" *) 
(* C_INIT_FILE_NAME = "ins_mem.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "3" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "1024" *) (* C_READ_DEPTH_B = "1024" *) (* C_READ_WIDTH_A = "32" *) 
(* C_READ_WIDTH_B = "32" *) (* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) 
(* C_RST_PRIORITY_A = "CE" *) (* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) 
(* C_USE_BRAM_BLOCK = "0" *) (* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) 
(* C_USE_DEFAULT_DATA = "1" *) (* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) 
(* C_USE_URAM = "0" *) (* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) 
(* C_WRITE_DEPTH_A = "1024" *) (* C_WRITE_DEPTH_B = "1024" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
(* C_WRITE_MODE_B = "WRITE_FIRST" *) (* C_WRITE_WIDTH_A = "32" *) (* C_WRITE_WIDTH_B = "32" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "blk_mem_gen_v8_4_1" *) (* downgradeipidentifiedwarnings = "yes" *) 
module ins_mem_blk_mem_gen_v8_4_1
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [9:0]addra;
  input [31:0]dina;
  output [31:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [9:0]addrb;
  input [31:0]dinb;
  output [31:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [9:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [9:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;

  assign dbiterr = \<const0> ;
  assign doutb[31] = \<const0> ;
  assign doutb[30] = \<const0> ;
  assign doutb[29] = \<const0> ;
  assign doutb[28] = \<const0> ;
  assign doutb[27] = \<const0> ;
  assign doutb[26] = \<const0> ;
  assign doutb[25] = \<const0> ;
  assign doutb[24] = \<const0> ;
  assign doutb[23] = \<const0> ;
  assign doutb[22] = \<const0> ;
  assign doutb[21] = \<const0> ;
  assign doutb[20] = \<const0> ;
  assign doutb[19] = \<const0> ;
  assign doutb[18] = \<const0> ;
  assign doutb[17] = \<const0> ;
  assign doutb[16] = \<const0> ;
  assign doutb[15] = \<const0> ;
  assign doutb[14] = \<const0> ;
  assign doutb[13] = \<const0> ;
  assign doutb[12] = \<const0> ;
  assign doutb[11] = \<const0> ;
  assign doutb[10] = \<const0> ;
  assign doutb[9] = \<const0> ;
  assign doutb[8] = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  ins_mem_blk_mem_gen_v8_4_1_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_1_synth" *) 
module ins_mem_blk_mem_gen_v8_4_1_synth
   (douta,
    clka,
    ena,
    addra);
  output [31:0]douta;
  input clka;
  input ena;
  input [9:0]addra;

  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;

  ins_mem_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
