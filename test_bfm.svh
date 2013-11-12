`ifndef _TEST_BFM_SVH
`define _TEST_BFM_SVH

`include "tb_classes.svh"
`include "foo_tb_stim_intf.svh"

class test_bfm extends tb_component;
  virtual foo_tb_stim_intf intf;

  rand bit [7:0] value;
  rand bit       valid;

  constraint valid_dist {
    valid dist {
      1'b0 :/ 80,
      1'b1 :/ 20
    };
  }

  function new(string name, tb_component parent = null);
    super.new(name, parent);
  endfunction

  function void set_intf(virtual foo_tb_stim_intf intf);
    this.intf = intf;
  endfunction

  task run();
    fork
      initialize();
      drive();
    join_none
  endtask

  task initialize();
    forever begin
      @(negedge intf.reset_n);
      intf.cb.test_in_valid <= 1'b0;
    end
  endtask

  task drive();
    forever begin
      @(posedge intf.clk);
      tick();
    end
  endtask

  task tick();
    assert(randomize());
    intf.cb.test_in_valid <= valid;
    intf.cb.test_in       <= value;
  endtask
endclass

`endif
