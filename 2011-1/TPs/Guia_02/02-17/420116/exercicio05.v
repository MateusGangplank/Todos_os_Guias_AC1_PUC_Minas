// Modulo da porta NOR
module NOR(input A, input B,
        output S);
    assign S = ~(A | B);
endmodule

// Modulo da porta NAND, usando apenas NORs
module NAND(input A, input B,
            output S);
    wire S1, S2, S3;
    NOR NOR1(A, A, S1);
    NOR NOR2(B, B, S2);
    NOR NOR3(S1, S2, S3);
    NOR NOR4(S3, S3, S);
endmodule

// Modulo de testes
module teste();
    reg A, B;
    wire S;
    NAND NAND1(A, B, S);
    
    initial begin
        $display("A B S");
        $monitor("%b %b %b", A, B, S);
        A = 0; B = 0; // 0
        #1 A = 0; B = 1; // 1
        #1 A = 1; B = 0; // 2
        #1 A = 1; B = 1; // 3
    end
endmodule
