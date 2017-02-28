module exercicio03;
    reg A;
    reg B;
    reg C;
    reg D;
    wire S;
    
    // Conecta a saida as entradas
    assign S = ~(A ^ B ^ C ^ D);
    
    // Realiza os testes
    initial begin
        $display("A B C D S");
        A = 0; B = 0; C = 0; D = 0; // 0
        #1 $display("%b %b %b %b %b", A, B, C, D, S);
        A = 0; B = 0; C = 0; D = 1; // 1
        #1 $display("%b %b %b %b %b", A, B, C, D, S);
        A = 0; B = 0; C = 1; D = 0; // 2
        #1 $display("%b %b %b %b %b", A, B, C, D, S);
        A = 0; B = 0; C = 1; D = 1; // 3
        #1 $display("%b %b %b %b %b", A, B, C, D, S);
        A = 0; B = 1; C = 0; D = 0; // 4
        #1 $display("%b %b %b %b %b", A, B, C, D, S);
        A = 0; B = 1; C = 0; D = 1; // 5
        #1 $display("%b %b %b %b %b", A, B, C, D, S);
        A = 0; B = 1; C = 1; D = 0; // 6
        #1 $display("%b %b %b %b %b", A, B, C, D, S);
        A = 0; B = 1; C = 1; D = 1; // 7
        #1 $display("%b %b %b %b %b", A, B, C, D, S);
        A = 1; B = 0; C = 0; D = 0; // 8
        #1 $display("%b %b %b %b %b", A, B, C, D, S);
        A = 1; B = 0; C = 0; D = 1; // 9
        #1 $display("%b %b %b %b %b", A, B, C, D, S);
        A = 1; B = 0; C = 1; D = 0; // 10
        #1 $display("%b %b %b %b %b", A, B, C, D, S);
        A = 1; B = 0; C = 1; D = 1; // 11
        #1 $display("%b %b %b %b %b", A, B, C, D, S);
        A = 1; B = 1; C = 0; D = 0; // 12
        #1 $display("%b %b %b %b %b", A, B, C, D, S);
        A = 1; B = 1; C = 0; D = 1; // 13
        #1 $display("%b %b %b %b %b", A, B, C, D, S);
        A = 1; B = 1; C = 1; D = 0; // 14
        #1 $display("%b %b %b %b %b", A, B, C, D, S);
        A = 1; B = 1; C = 1; D = 1; // 15
        #1 $display("%b %b %b %b %b", A, B, C, D, S);
    end
endmodule