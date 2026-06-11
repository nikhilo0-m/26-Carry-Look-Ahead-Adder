# 26-Carry-Look-Ahead-Adder

## Verilog Module Description

The Carry Look Ahead Adder (CLA) is a high-speed adder that reduces propagation delay by calculating carry signals in advance using Generate (G) and Propagate (P) signals. Unlike Ripple Carry Adders, the CLA does not wait for each carry to propagate through every stage, resulting in faster arithmetic operations.

### Inputs

* **A[3:0]** : First 4-bit binary number
* **B[3:0]** : Second 4-bit binary number
* **Cin** : Carry input

### Outputs

* **Sum[3:0]** : 4-bit sum output
* **Cout** : Final carry output

### Working Principle

1. Generate signals:

   * G = A & B

2. Propagate signals:

   * P = A ^ B

3. Carry signals are computed using look-ahead logic:

   * C1 = G0 + P0Cin
   * C2 = G1 + P1G0 + P1P0Cin
   * C3 = G2 + P2G1 + P2P1G0 + P2P1P0Cin
   * Cout = G3 + P3G2 + P3P2G1 + P3P2P1G0 + P3P2P1P0Cin

4. Sum outputs:

   * Sum0 = P0 ^ Cin
   * Sum1 = P1 ^ C1
   * Sum2 = P2 ^ C2
   * Sum3 = P3 ^ C3

## Testbench Description

The testbench verifies the functionality of the 4-bit CLA by applying different combinations of inputs A, B, and Cin. The resulting Sum and Cout values are observed through simulation to ensure correct operation.

### Test Cases

1. 0000 + 0000
2. 0011 + 0101
3. 0110 + 0011 + Cin
4. 1111 + 0001
5. 1010 + 0101 + Cin
6. 1111 + 1111 + Cin

### Expected Result

The Carry Look Ahead Adder correctly performs binary addition while generating carry outputs with minimal propagation delay, making it suitable for high-speed digital systems and processor arithmetic units.
