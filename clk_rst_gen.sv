module clk_rst_gen
 (
  output wire clk,
  output reg  reset_n
);

  event gen_rst;

  reg running;
  reg unmasked_clk;

  initial begin
    unmasked_clk <= 1'b1;
    running      <= 1'b0;
  end

  always begin
    #5;
    unmasked_clk <= ~unmasked_clk;
  end

  assign clk = unmasked_clk & running;

  initial begin
    #5;
    reset_n <= 1'b1;
    #50;
    ->gen_rst;
  end

  always @(gen_rst) begin
    if (clk)
      #5;
    reset_n <= 1'b0;
    running <= 1'b0;
    #50;
    running <= 1'b1;
    #50;
    reset_n <= 1'b1;
  end
endmodule
