// Modulo da porta NAND
module NAND(input A, input B,
            output S);
    assign S = ~(A & B);
endmodule

// Modulo da porta OU, usando apenas portas nand
module OR(input A, input B,
        output S);
    wire S1, S2;
    NAND NAND1(A, A, S1);
    NAND NAND2(B, B, S2);
    NAND NAND3(S1, S2, S);
endmodule

// Modulo de testes
module teste();
    reg A, B;
    wire S;
    OR OR1(A, B, S);
    
    initial begin
        $display("A B S");
        $monitor("%b %b %b", A, B, S);
        A = 0; B = 0; // 0
        #1 A = 0; B = 1; // 1
        #1 A = 1; B = 0; // 2
        #1 A = 1; B = 1; // 3
    end
endmodule

// OBS.: SE POSSIVEL, COLOCAR NOME E MATRICULA.
