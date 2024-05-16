`ifndef CARRY_LOOK_AHEAD_ADDER_V
`define CARRY_LOOK_AHEAD_ADDER_V
module pg_generator(
    input wire A,
    input wire B,
    output wire P,
    output wire G
);
assign G = A * B; // generate cout
assign P = A ^ B; // propagated last generated cout if any

endmodule

module carry_look_ahead_adder (
    input wire [3:0] A,
    input wire [3:0] B,
    input Cin,
    output wire [4:0] Out
);

    wire[3:0] P;
    wire[3:0] G;
    wire [4:0] C;
genvar i;
generate
for (i = 0; i < 4; i = i+1) begin
    pg_generator uut(
        .A(A[i]),
        .B(B[i]),
        .P(P[i]),
        .G(G[i])
    );
end
endgenerate
assign C[0] = Cin;
assign C[1] = C[0]*P[0]+ 
                G[0];
assign C[2] = C[0]*P[0]*P[1] +
                G[0]*P[1] +
                G[1];
assign C[3] = C[0]*P[0]*P[1]*P[2]+
                G[0]*P[1]*P[2]+
                G[1]*P[2]+
                G[2];
assign C[4] = C[0]*P[0]*P[1]*P[2]*P[3] +
                G[0]*P[1]*P[2]*P[3]+
                G[1]*P[2]*P[3]+
                G[2]*P[3] +
                G[3];

assign Out[0] = P[0] ^ C[0];
assign Out[1] = P[1] ^ C[1];
assign Out[2] = P[2] ^ C[2];
assign Out[3] = P[3] ^ C[3];
assign Out[4] = C[4];
endmodule //carry_look_ahead_adder
`endif 
