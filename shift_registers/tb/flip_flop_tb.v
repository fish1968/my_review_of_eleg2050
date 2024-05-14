`include "flip_flop.v"
`default_nettype none

module tb_flip_flop;
reg clk;
reg reset;
reg d;
wire q;

flip_flop uut(
    .reset (reset),
    .clk (clk),
    .d(d),
    .q(q)
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("tb_flip_flop.vcd");
    $dumpvars(0, tb_flip_flop);
end

initial begin
    #1 reset=1'b0;clk=1'b0; d = 0;
    #(CLK_PERIOD*3) reset=1;
    #(CLK_PERIOD*3) reset=0;clk=0;
    repeat(5) @(posedge clk);
    @(negedge clk);
    d = 0;
    #(CLK_PERIOD)
    d = 1;
    #(CLK_PERIOD)
    d = 0;
    repeat(10) @(posedge clk);
    $finish(2);
end

endmodule
`default_nettype wire
