`ifndef _TEST_MONITOR_SVH
`define _TEST_MONITOR_SVH

`include "tb_classes.svh"
`include "foo_tb_mon_intf.svh"
`include "test_checker.svh"

class test_monitor extends tb_component;
  virtual foo_tb_mon_intf intf;
  test_checker test_checker;

  test_transaction trans;

  int trans_checked;

  function new(string name, tb_component parent = null);
    super.new(name, parent);
    test_checker = new("Checker", this);
    reset();
  endfunction

  function void set_intf(virtual foo_tb_mon_intf intf);
    this.intf = intf;
  endfunction

  task run();
    fork
      initialize();
      monitor();
    join_none
  endtask

  task initialize();
    bit wait_rst = (intf.reset_n !== 1'b0);
    forever begin
      if (wait_rst)
        @(negedge intf.reset_n);

      reset();

      wait_rst = 1'b1;
    end
  endtask

  task monitor();
    forever begin
      do @(posedge intf.clk); while (!intf.reset_n);
      tick();
    end
  endtask

  function void tick();
    if (intf.cb.test_out_valid) begin
      assert(trans != null);
      trans.out = intf.cb.test_out;
      test_checker.check_transaction(trans);
      trans = null;
      ++trans_checked;
    end

    if (intf.cb.test_in_valid) begin
      assert(trans == null);
      trans = new();
      trans.in = intf.cb.test_in;
    end

    if (trans_checked == 25) begin
      $display("enough!");
      $finish();
    end
  endfunction

  function void reset();
    $display("%t: Reset asserted", $time);
    trans = null;
    trans_checked = 0;
  endfunction
endclass // test_monitor

`endif
