import uvm_pkg::*;
`include "uvm_macros.svh"
`include "fifo_interface.sv"
`include "fifo_test.sv"


module testbench;
  bit clk;
  bit reset;
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 1;
    reset = 0;
    #5;
    reset =1 ;
  end
  
  fifo_interface tif(clk, reset);
  
  synchronous_fifo dut(.clk(tif.clk),
                       .reset(tif.reset),
               .i_wrdata(tif.i_wrdata),
               .i_rden(tif.i_rden),
               .i_wren(tif.i_wren),
               .o_full(tif.o_full),
     
               .o_empty(tif.o_empty),
               
               .o_rddata(tif.o_rddata));
  
  initial begin
    uvm_config_db#(virtual fifo_interface)::set(null, "", "vif", tif);
   
    run_test("fifo_test");
     
  end
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    
  end
  
endmodule