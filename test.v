module test
 (
  input clk,
  input reset_n,
  input        test_in_valid,
  input  [7:0] test_in,
  output       test_out_valid,
  output [7:0] test_out
);

  reg  [7:0] test_r;
  wire [7:0] next_test;
  reg        valid_r;

  assign next_test = test_in + 1'b1;

  always @(posedge clk or negedge reset_n)
    if (~reset_n)
      test_r <= 8'h00;
    else
      test_r <= next_test;

  always @(posedge clk or negedge reset_n)
    if (~reset_n)
      valid_r <= 1'b0;
    else
      valid_r <= test_in_valid;

  assign test_out_valid = valid_r;
  assign test_out       = test_r;
endmodule

