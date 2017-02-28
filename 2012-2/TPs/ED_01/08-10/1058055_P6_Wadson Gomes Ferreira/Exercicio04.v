// Exercicio 04
// Wadson Gomes Ferreira
// 460631
// Tabela-Verdade NAND usando propriedade 'de morgan'
// Representação em decimal

module tabelaNAND(output s, input x, input y);
       assign s = ~x | ~y;
endmodule

module teste;
       reg a,b;
       wire s;
       tabelaNAND T1(s,a,b);

       initial begin
               #1
                 a=0;
                 b=0;
               #1
                 $display("Exercicio04 - Wadson Gomes Ferreira - 460631");
                 $display("Tabela-Verdade NAND usando 'de Morgan'");
                 $monitor("~ ( a=%b ^ b=%b ) => %b",a,b,s);
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