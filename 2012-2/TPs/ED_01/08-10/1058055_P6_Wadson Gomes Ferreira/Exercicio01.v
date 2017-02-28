// Exercicio 01
// Wadson Gomes Ferreira
// 460631
// Tabela-Verdade NAND e $display
// Representação binário

module tabelaNAND(output s, input x, input y);
       assign s = ~(x & y);
endmodule

module teste;
       reg a,b;
       wire s;
       tabelaNAND T1(s,a,b);

       initial begin
               a=1'b0;
               b=1'b0;
       end

       initial begin
               $display("Exercicio01 - Wadson Gomes Ferreira - 460631");
               $display("Tabela-Verdade NAND e $display");
               #1
                 $display("~(%b & %b) => %b",a,b,s);
                 a=1'b0;
                 b=1'b1;
               #1

                 $display("~(%b & %b) => %b",a,b,s);
                 a=1'b1;
                 b=1'b0;
               #1

                 $display("~(%b & %b) => %b",a,b,s);
                 a=1'b1;
                 b=1'b1;
               #1
                 $display("~(%b & %b) => %b",a,b,s);
       end
endmodule