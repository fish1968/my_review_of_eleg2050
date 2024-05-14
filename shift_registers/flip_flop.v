`ifndef FLIP_FLOP_V
`define FLIP_FLOP_V

// Module code goes here

module flip_flop (
  input wire clk,
  input wire reset,
  input wire d,
  output wire q
);

  reg q_r;

  always @(posedge clk or posedge reset)
  begin
    if (reset)
      q_r <= 1'b0;
    else
      q_r <= d;
  end
  assign q = q_r;

endmodule
`endif
