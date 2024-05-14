// `include "d_latch.v"
`default_nettype none

`include "d_latch.v"

module tb_d_latch;
reg D, EN;

d_latch uut
(
    .D(D),
    .EN(EN)
);


initial begin
    $dumpfile("tb_d_latch.vcd");
    $dumpvars(0, tb_d_latch);
end

initial begin
    D = 1'b0;
    EN = 1'b0;
    #10
    EN = 1'b1;
    #10
    D = 1'b1;
    #10
    EN = 1'b0;
    D = 1'b0;
    #10
    EN = 1'b1;
    #10
    $finish(2);
end

endmodule
