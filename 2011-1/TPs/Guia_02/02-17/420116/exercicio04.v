// Modulo da porta NAND
module NAND(input A, input B,
            output S);
    assign S = ~(A & B);
endmodule

// Modulo da porta NOR, usando apenas NANDs
module NOR(input A, input B,
        output S);
    wire S1, S2, S3;
    NAND NAND1(A, A, S1);
    NAND NAND2(B, B, S2);
    NAND NAND3(S1, S2, S3);
    NAND NAND4(S3, S3, S);
endmodule

// Modulo de testes
module teste();
    reg A, B;
    wire S;
    NOR NOR1(A, B, S);
    
    initial begin
        $display("A B S");
        $monitor("%b %b %b", A, B, S);
        A = 0; B = 0; // 0
        #1 A = 0; B = 1; // 1
        #1 A = 1; B = 0; // 2
        #1 A = 1; B = 1; // 3
    end
endmodule