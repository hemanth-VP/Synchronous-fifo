`include "fifo_environment.sv"

class fifo_test extends uvm_test;
  fifo_sequence fifo_seq;
  fifo_environment fifo_env;
  `uvm_component_utils(fifo_test)
  
  function new(string name = "wrrd_test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    fifo_seq = fifo_sequence::type_id::create("fifo_seq", this);
    fifo_env = fifo_environment::type_id::create("fifo_env", this);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    fifo_seq.start(fifo_env.fifo_agt.fifo_seqr);
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this, 100);
  endtask
  
endclass