`timescale 1ns / 1ps

// 4-Bit Carry Look Ahead Adder (CLA)

module carry_look_ahead_adder (
    input  [3:0] A,      // First 4-bit input
    input  [3:0] B,      // Second 4-bit input
    input        Cin,    // Carry input
    output [3:0] Sum,    // 4-bit Sum output
    output       Cout    // Carry output
);

    // Generate and Propagate signals
    wire [3:0] G;  // Generate
    wire [3:0] P;  // Propagate

    // Internal carry signals
    wire C1, C2, C3;

    // Generate and Propagate calculations
    assign G = A & B;
    assign P = A ^ B;

    // Carry calculations using CLA logic
    assign C1 = G[0] | (P[0] & Cin);

    assign C2 = G[1] |
               (P[1] & G[0]) |
               (P[1] & P[0] & Cin);

    assign C3 = G[2] |
               (P[2] & G[1]) |
               (P[2] & P[1] & G[0]) |
               (P[2] & P[1] & P[0] & Cin);

    assign Cout = G[3] |
                 (P[3] & G[2]) |
                 (P[3] & P[2] & G[1]) |
                 (P[3] & P[2] & P[1] & G[0]) |
                 (P[3] & P[2] & P[1] & P[0] & Cin);

    // Sum calculations
    assign Sum[0] = P[0] ^ Cin;
    assign Sum[1] = P[1] ^ C1;
    assign Sum[2] = P[2] ^ C2;
    assign Sum[3] = P[3] ^ C3;

endmodule
