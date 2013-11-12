module top_level_tb ();
  wire       clk;
  wire       reset_n;
  wire       test_in_valid;
  wire [7:0] test_in;
  wire       test_out_valid;
  wire [7:0] test_out;

  clk_rst_gen u_clk_rst (.*);
  test u_test (.*);
endmodule

