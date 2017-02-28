// Exercicio 07
// Wadson Gomes Ferreira
// 460631
// Tabela-Verdade XNOR usando a'*b' + a*b

module tabelaXNOR(output s, input x, input y);
       assign s = (~x & ~y) | (x & y);
endmodule

module teste;
       reg a,b;
       wire s;
       tabelaXNOR T1(s,a,b);
       initial begin
               #1
                 a=1'b0;
                 b=1'b0;
               #1
                 $display("Exercicio07 - Wadson Gomes Ferreira - 460631");
                 $display("Tabela-Verdade XNOR usando propriedade");
                 $monitor("a=%b , b=%b => %b",a,b,s);
               #1
                 a=1'b1;
                 b=1'b0;
               #1
                 a=1'b0;
                 b=1'b1;
               #1
                 a=1'b1;
                 b=1'b1;
       end
endmodule