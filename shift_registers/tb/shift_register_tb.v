`timescale 1ps/1ps

`include "shift_register_8_bit.v"
`default_nettype none

module tb_shift_register_8_bit;
reg clk;
reg rst_n;
reg D;
wire [7:0] D_out_s;

shift_register_8_bit uut
(
    .rst_n (rst_n),
    .clk (clk),
    .D_in_s(D),
    .D_out_s(D_out_s)
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("tb_shift_register_8_bit.vcd");
    $dumpvars(0, tb_shift_register_8_bit);
end

initial begin
    #1 rst_n<=1'bx;clk<=1'bx;
    #(CLK_PERIOD*3) rst_n<=1;
    #(CLK_PERIOD*3) rst_n<=0;clk<=0; D <= 1'b0;
    #(CLK_PERIOD) rst_n <= 1;
    repeat(5) @(negedge clk) begin
        D <= (1^D);
    end
    repeat(5) @(negedge clk) begin
        D <= 1;
    end
    repeat(5) @(negedge clk) begin
        D <= 0;
    end
    @(posedge clk);
    repeat(2) @(posedge clk);
    rst_n <= 0;
    #(CLK_PERIOD * 5)
    $finish(2);
end

endmodule
`default_nettype wire
