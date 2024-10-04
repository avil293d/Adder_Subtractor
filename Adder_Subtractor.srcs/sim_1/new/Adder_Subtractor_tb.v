`timescale 1ns / 1ps

module Adder_Subtractor_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg M;

    // Outputs
    wire [3:0] S;
    wire cout_1;

    // Instantiate the Unit Under Test (UUT)
    Adder_Subtractor uut (
        .S(S),
        .cout_1(cout_1),
        .M(M),
        .A(A),
        .B(B)
    );

    initial begin
        // Initialize Inputs
        A = 4'b0000;
        B = 4'b0000;
        M = 0;

        // Wait for global reset
        #10;

        // Test 1: Add 3 + 2 (M = 0 -> addition)
        A = 4'b0011;    // A = 3
        B = 4'b0010;    // B = 2
        M = 0;          // M = 0 -> Addition
        #10;
        
        // Test 2: Subtract 7 - 5 (M = 1 -> subtraction)
        A = 4'b0111;    // A = 7
        B = 4'b0101;    // B = 5
        M = 1;          // M = 1 -> Subtraction
        #10;

        // Test 3: Add 8 + 4 (M = 0 -> addition)
        A = 4'b1000;    // A = 8
        B = 4'b0100;    // B = 4
        M = 0;          // M = 0 -> Addition
        #10;

        // Test 4: Subtract 6 - 9 (M = 1 -> subtraction, negative result)
        A = 4'b0110;    // A = 6
        B = 4'b1001;    // B = 9
        M = 1;          // M = 1 -> Subtraction
        #10;

        // Test 5: Add 15 + 1 (M = 0 -> addition, overflow case)
        A = 4'b1111;    // A = 15
        B = 4'b0001;    // B = 1
        M = 0;          // M = 0 -> Addition
        #10;

        // Test 6: Subtract 12 - 8 (M = 1 -> subtraction)
        A = 4'b1100;    // A = 12
        B = 4'b1000;    // B = 8
        M = 1;          // M = 1 -> Subtraction
        #10;
        
        // Test 7: 
        A = 4'b1111;    
        B = 4'b1111;   
        M = 0;          
        #10;
        // End the test
        $finish;
    end

endmodule
