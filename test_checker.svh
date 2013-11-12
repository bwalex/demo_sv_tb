`ifndef _TEST_CHECKER_SVH
`define _TEST_CHECKER_SVH

`include "tb_classes.svh"
`include "test_trans.svh"

class test_checker extends tb_component;
  function new(string name, tb_component parent = null);
    super.new(name, parent);
  endfunction

  function void check_transaction(test_transaction trans);
    bit [7:0] expected;

    expected = trans.in + 1'b1;
    if (trans.out != expected) begin
      $fatal(2, "Transaction mismatch - for input %x expected %x but got %x",
        trans.in, expected, trans.out);
    end else begin
      $display("Yey; all good: in=%d out=%d", trans.in, trans.out);
    end
  endfunction
endclass // test_checker

`endif
