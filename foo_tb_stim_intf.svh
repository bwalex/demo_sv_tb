`ifndef _FOO_TB_STIM_INTF_SVH
`define _FOO_TB_STIM_INTF_SVH

interface foo_tb_stim_intf
 (
  inout       clk,
  inout       reset_n,
  inout       test_in_valid,
  inout [7:0] test_in
);

  clocking cb @(posedge clk or negedge reset_n);
    default input #1step output #0;
    input  clk;
    input  reset_n;
    output test_in_valid;
    output test_in;
  endclocking
endinterface

`endif
