`ifndef SHIFT_REGISTER_8_BIT_V
`define SHIFT_REGISTER_8_BIT_V
`include "flip_flop.v"

module shift_register_8_bit(
    input wire D_in_s,
    input wire rst_n,
    input wire clk,
    output wire [7:0] D_out_s
);

genvar idx;
flip_flop uut(
    .clk(clk),
    .reset(~rst_n),
    .d(D_in_s),
    .q(D_out_s[0])
);
generate
    for (idx = 0; idx <= 6; idx = idx + 1) begin
        flip_flop uutx(
            .clk(clk),
            .reset(~rst_n),
            .d(D_out_s[idx + 0]),
            .q(D_out_s[idx + 1])
        );
    end
endgenerate

endmodule
`endif
