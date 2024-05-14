`timescale 1ps/1ps
`include "jk_flip_flop.v"

module testbench;
  reg clk;
  wire outputs[3:0];
  reg clear;
  jk_flip_flop uut (
    .j(1'b1),
    .k(1'b1),
    .clk(clk),
    .neg_clear(clear),
    .q(outputs[0])
  );
  jk_flip_flop uut1 (
    .j(1'b1),
    .k(1'b1),
    .clk(outputs[0]),
    .neg_clear(clear),
    .q(outputs[1])
  );
  jk_flip_flop uut2 (
    .j(1'b1),
    .k(1'b1),
    .clk(outputs[1]),
    .neg_clear(~(outputs[2] & outputs[3])),
    .q(outputs[2])
  );
  jk_flip_flop uut3 (
    .j(1'b1),
    .k(1'b1),
    .clk(outputs[2]),
    .neg_clear(~(outputs[2] & outputs[3])),
    .q(outputs[3])
  );
  
  always begin
    #5;
    clk = ~clk;
  end
  initial begin
    clk = 1'b0;
    clear = 1'b0;
    #20
    clear = 1'b1;
    #400
    $finish;
  end

  initial $dumpvars(0, testbench);
  initial $dumpfile("dump.vcd");

endmodule

