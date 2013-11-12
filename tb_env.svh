`ifndef _TB_ENV_SVH
`define _TB_ENV_SVH

`include "tb_classes.svh"
`include "foo_tb_mon_intf.svh"
`include "foo_tb_stim_intf.svh"
`include "test_monitor.svh"
`include "test_bfm.svh"

class tb_env extends tb_component;
  test_bfm     test_bfm;
  test_monitor test_monitor;

  function new(string name);
    super.new(name);

    test_bfm     = new("BFM", this);
    test_monitor = new("Monitor", this);
  endfunction

  function void set_mon_intf(virtual foo_tb_mon_intf intf);
    test_monitor.set_intf(intf);
  endfunction

  function void set_stim_intf(virtual foo_tb_stim_intf intf);
    test_bfm.set_intf(intf);
  endfunction

  task run();
    fork
      test_bfm.run();
      test_monitor.run();
    join
  endtask
endclass

`endif
