`ifndef _FOO_TB_MON_INTF_SVH
`define _FOO_TB_MON_INTF_SVH

interface foo_tb_mon_intf
 (
  inout       clk,
  inout       reset_n,
  inout       test_in_valid,
  inout [7:0] test_in,
  inout       test_out_valid,
  inout [7:0] test_out
);

  clocking cb @(posedge clk or negedge reset_n);
    default input #1step output #0;
    input  clk;
    input  reset_n;
    input  test_in_valid;
    input  test_in;

    input  test_out_valid;
    input  test_out;
  endclocking
endinterface

`endif
