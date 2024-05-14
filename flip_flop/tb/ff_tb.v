`timescale 1ps/1ps
`include "jk_flip_flop.v"
module testbench;

  reg j;
  reg k;
  reg clk;
  reg neg_clear;
  wire q;

  jk_flip_flop uut (
    .j(j),
    .k(k),
    .clk(clk),
    .neg_clear(neg_clear),
    .q(q)
  );
  initial begin
    $dumpfile("dump.vcd");
  end
  initial begin
    clk = 1'b0;
    neg_clear = 1'b1;
    j = 1'b0;
    k = 1'b0;

    #10;
    neg_clear = 1'b0;

    #20;
    neg_clear = 1'b1;

    #10;
    j = 1'b1;

    #10;
    j = 1'b0;

    #10;
    k = 1'b1;

    #10;
    k = 1'b0;
    #10
    k = 1'b1;
    j = 1'b1;
    #30
    #10;
    $finish;
  end

  always begin

    #5;
    clk = ~clk;
  end
initial $dumpvars(0, testbench);
endmodule
