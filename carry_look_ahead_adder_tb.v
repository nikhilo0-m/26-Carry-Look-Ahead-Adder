`timescale 1ns/1ps

// Testbench for 4-Bit Carry Look Ahead Adder
module carry_look_ahead_adder_tb;

    // Testbench signals
    reg  [3:0] A;
    reg  [3:0] B;
    reg        Cin;
    wire [3:0] Sum;
    wire       Cout;

    // Instantiate CLA module
    carry_look_ahead_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Apply test vectors
    initial begin

        $display("A\tB\tCin\tSum\tCout");
        $monitor("%b\t%b\t%b\t%b\t%b",
                 A, B, Cin, Sum, Cout); // Monitor values during simulation

        // Test Case 1
        A = 4'b0000; B = 4'b0000; Cin = 0; #10;

        // Test Case 2
        A = 4'b0011; B = 4'b0101; Cin = 0; #10;

        // Test Case 3
        A = 4'b0110; B = 4'b0011; Cin = 1; #10;

        // Test Case 4
        A = 4'b1111; B = 4'b0001; Cin = 0; #10;

        // Test Case 5
        A = 4'b1010; B = 4'b0101; Cin = 1; #10;

        // Test Case 6
        A = 4'b1111; B = 4'b1111; Cin = 1; #10;

        // End simulation
        $finish;
    
    end

endmodule