`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2024 23:49:06
// Design Name: 
// Module Name: Adder_Subtractor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Adder_Subtractor(
    output  cout_1,[3:0] S,
    input M, 
    input [3:0] A, B
);

wire [3:0] G, P, Q, R;
wire cout, t, q;

// Input to first RCA
xor (P[3], M, B[3]);
xor (P[2], M, B[2]);
xor (P[1], M, B[1]);
xor (P[0], M, B[0]);

not (t, cout);
and (q, t, M);

xor (Q[3], q, R[3]);
xor (Q[2], q, R[2]);
xor (Q[1], q, R[1]);
xor (Q[0], q, R[0]);

assign G[0] = 0;
assign G[1] = 0;
assign G[2] = 0;
assign G[3] = 0;

RCA_4bit_2 RCA0(.a(A), .b(P), .sum(R), .cout(cout), .cin(M));
RCA_4bit_2 RCA1(.a(Q), .b(G), .sum(S), .cout(cout_1), .cin(q));

endmodule
