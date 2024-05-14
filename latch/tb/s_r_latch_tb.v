`timescale 1ns/1ps
`include "../s_r_latch.v"
module testbench;
    reg R, S;
    wire Q, Q_bar;

s_r_latch uut(
    .R(R),
    .S(S),
    .Q(Q),
    .Q_bar(Q_bar)
);

initial begin
    R = 1'b0;
    S = 1'b1;
    #10
    R = 1'b1;
    S = 1'b0;
    #10
    R = 1'b0;
    S = 1'b0;
    #10
    R = 1'b1;
    S = 1'b1;
    #10
    // Logically, it is uncertaion for 11 -> 00 state, 
    // below lines block the dumping...
    // comment out to make run, make show
    // R = 1'b0; 
    // S = 1'b0;
    // #10
    $finish;
end

initial $dumpfile("s_r_latch_tb.vcd");

initial $dumpvars(0, testbench);

endmodule
