interface fifo_interface(input clk, reset);
    bit [127 : 0] i_wrdata;
  bit  i_rden;
   bit i_wren;
  bit o_full;
  bit  o_empty;
  bit [127:0]o_rddata;
  bit o_alm_full;
  bit o_alm_empty ;
  
  clocking dr_cb @(posedge clk);
    default input #1 output #1;
    output i_wren;
    output i_rden;
    output i_wrdata;
   input o_full;
    input o_empty;
    input o_rddata;
    input o_alm_full;
    input  o_alm_empty;
  endclocking
  
  clocking mo_cb @(posedge clk);
    default input #1 output #1;
    input i_wren;
    input i_rden;
    input  i_wrdata;
    input o_full;
    input o_empty;
    input o_rddata;
    input o_alm_full;
    input  o_alm_empty;
  endclocking
  
  modport dr_mp (input clk, reset, clocking dr_cb);
    modport mo_mp (input clk, reset, clocking mo_cb);
    
      endinterface