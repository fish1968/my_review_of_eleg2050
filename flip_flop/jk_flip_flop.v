`ifndef JK_FLIP_FLOP_V
`define JK_FLIP_FLOP_V

module jk_flip_flop (
    input wire j,
    input wire k,
    input wire clk,
    input wire neg_clear,
    output reg q
);
initial begin
    q = 1'b0;
end

always @(negedge clk or negedge neg_clear) begin
    if (neg_clear == 0) begin
        q <= 1'b0;
    end else if ((j==1) && (k == 1)) begin
        q <= ~q;
    end else if ( (j==0) && (k == 0)) begin
        q <= q;
    end else begin
        q <= j;
    end
end

endmodule

`endif
