`include "mux_4to1_assign.v"
`default_nettype none

module tb_mux_4to1_assign;
reg [3:0] a, b, c, d;
reg [1:0] sel;
reg clk;
wire [3:0] out;
mux_4to1_assign uut
(
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .sel(sel),
    .out(out)
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("tb_mux_4to1_assign.vcd");
    $dumpvars(0, tb_mux_4to1_assign);
end

initial begin
    clk <= 1'b0;
    a <= 4'b0000;
    b <= 4'b0101;
    c <= 4'b1010;
    d <= 4'b1111;
    sel <= 2'b00;
    #(CLK_PERIOD * 2) sel <= 2'b01;
    #(CLK_PERIOD * 2) sel <= 2'b10;
    #(CLK_PERIOD * 2) sel <= 2'b11;
    repeat(5) #(CLK_PERIOD);
    $finish(2);
end

endmodule
`default_nettype wire
