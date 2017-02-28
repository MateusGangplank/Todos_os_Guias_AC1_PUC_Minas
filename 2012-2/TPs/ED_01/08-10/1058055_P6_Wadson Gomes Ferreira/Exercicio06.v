// Exercicio 06
// Wadson Gomes Ferreira
// 460631
// Tabela-Verdade XOR usando a'*b + a*b'

module tabelaXOR(output s, input x, input y);
       assign s = (~x & y) + (x * ~y);
endmodule

module teste;
       reg a,b;
       wire s;
       tabelaXOR T1(s,a,b);
       initial begin
               #1
                 a=0;
                 b=0;
               #1
                 $display("Exercicio06 - Wadson Gomes Ferreira - 460631");
                 $display("Tabela-Verdade XOR usando propriedade");
                 $monitor("a=%b , b=%b => %b",a,b,s);
               #1
                 a=0;
                 b=1;
               #1
                 a=1;
                 b=0;
               #1
                 a=1;
                 b=1;
       end
endmodule