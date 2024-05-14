`ifndef S_R_LATCH_V
`define S_R_LATCH_V
module s_r_latch(
    input wire R, S,
    output wire Q, Q_bar
);
    assign Q = ~(R | Q_bar);
    assign Q_bar = ~(S | Q);
endmodule

module s_r_latch_neg_or(
    input wire R, S,
    output wire Q, Q_bar
);
    assign Q = ((~R) | (~Q_bar));
    assign Q_bar = ((~S) | (~Q));

endmodule


// set S = 1, R = 0
// reset R = 1, S = 0
`endif
