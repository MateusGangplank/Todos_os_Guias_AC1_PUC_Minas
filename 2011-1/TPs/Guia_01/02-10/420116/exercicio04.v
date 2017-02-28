module exercicio04;
    reg A;
    reg B;
    wire S;
    
    // Conecta a saida as entradas
    assign S = ~(A ^ B);
    
    // Realiza os testes
    initial begin
        $display("A B S");
        A = 0; B = 0; // 0
        #1 $display("%b %b %b", A, B, S);
        A = 0; B = 1; // 1
        #1 $display("%b %b %b", A, B, S);
        A = 1; B = 0; // 2
        #1 $display("%b %b %b", A, B, S);
        A = 1; B = 1; // 3
        #1 $display("%b %b %b", A, B, S);
    end
endmodule