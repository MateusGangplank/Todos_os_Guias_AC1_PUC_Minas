module exercicio02;
    reg A;
    reg B;
    reg C;
    wire S;
    
    // Conecta a saida as entradas
    assign S = ~(A | B | C);
    
    // Realiza os testes
    initial begin
        $display("A B C S");
        A = 0; B = 0; C = 0; // 0
        #1 $display("%b %b %b %b", A, B, C, S);
        A = 0; B = 0; C = 1; // 1
        #1 $display("%b %b %b %b", A, B, C, S);
        A = 0; B = 1; C = 0; // 2
        #1 $display("%b %b %b %b", A, B, C, S);
        A = 0; B = 1; C = 1; // 3
        #1 $display("%b %b %b %b", A, B, C, S);
        A = 1; B = 0; C = 0; // 4
        #1 $display("%b %b %b %b", A, B, C, S);
        A = 1; B = 0; C = 1; // 5
        #1 $display("%b %b %b %b", A, B, C, S);
        A = 1; B = 1; C = 0; // 6
        #1 $display("%b %b %b %b", A, B, C, S);
        A = 1; B = 1; C = 1; // 7
        #1 $display("%b %b %b %b", A, B, C, S);
    end
endmodule