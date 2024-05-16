`timescale 1ps/1ps
`include "carry_look_ahead_adder.v"
`default_nettype none

module tb_carry_look_ahead_adder;
reg clk;
reg [3:0] A;
reg [3:0] B;
reg Cin;
wire [4:0] Out;
carry_look_ahead_adder uut
(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Out(Out)
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("tb_carry_look_ahead_adder.vcd");
    $dumpvars(0, tb_carry_look_ahead_adder);
end

initial begin
    $monitor ("[%0t] A = 0x%0h, B = 0x%0h, Cin = 0x%0h Out = 0x%0h", $time, A, B, Cin, Out);
    A = 4'd0;
    B = 4'd0;
    Cin = 1'd1;
    #(CLK_PERIOD) 
    A = 4'd3;
    B = 4'd2;
    Cin = 1'd1;
    #(CLK_PERIOD) 
    A = 4'd1;
    B = 4'd5;
    Cin = 1'd1;
    #(CLK_PERIOD) 
    A = 4'd2;
    B = 4'd3;
    Cin = 1'd1;
    #(CLK_PERIOD) 
    A = 4'd3;
    B = 4'd2;
    Cin = 1'd0;
    #(CLK_PERIOD) 
    $finish(2);
end

endmodule
`default_nettype wire
