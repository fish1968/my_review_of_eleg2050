`ifndef D_LATCH_V
`define D_LATCH_V
module d_latch(
    input wire D, EN,
    output wire Q, Q_bar
);
s_r_latch uut(
    .R (~(D & EN)),
    .S (~((~D) & EN)),
    .Q(Q),
    .Q_bar(Q_bar)
);
endmodule

`endif
