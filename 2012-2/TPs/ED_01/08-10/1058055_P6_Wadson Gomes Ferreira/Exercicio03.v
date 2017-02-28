// Exercicio 03
// Wadson Gomes Ferreira
// 460631
// Tabela-Verdade XNOR
// Representação em hexadecimal
module tabelaXNOR(output s, input x, input y);
       assign s = ~(x^y);
endmodule

module teste;
       reg a,b;
       wire s;
       tabelaXNOR T1(s,a,b);

       initial begin
               #1
                 a=1'h0;
                 b=1'h0;
               #1
                 $display("Exercicio03 - Wadson Gomes Ferreira - 460631");
                 $display("Tabela-Verdade XNOR");
                 $monitor("~ ( a=%b ^ b=%b ) => %b",a,b,s);
               #1
                 a=1'h0;
                 b=1'h1;
               #1
                 a=1'h1;
                 b=1'h0;
               #1
                 a=1'h1;
                 b=1'h1;
       end

endmodule