`include "fifo_agent.sv"
`include "fifo_scoreboard.sv"

class fifo_environment extends uvm_env;
  fifo_agent fifo_agt;
  fifo_scoreboard fifo_scb;
  `uvm_component_utils(fifo_environment)
  
  function new(string name = "fifo_environment", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    fifo_agt = fifo_agent::type_id::create("fifo_agt", this);
    fifo_scb = fifo_scoreboard::type_id::create("fifo_scb", this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    fifo_agt.fifo_mon.item_got_port.connect(fifo_scb.item_got_export);
  endfunction
  
endclass