// Exercicio 05
// Wadson Gomes Ferreira
// 460631
// Tabela-Verdade NOR usando 'de morgan'
// Usando divisão em modulos

module tabelaNOR(output s,input x,input y);
       assign s = ~x & ~y;
endmodule

module teste;
       reg a,b;
       wire s;
       tabelaNOR T1(s,a,b);
       initial begin
               a=1'b0;
               b=1'b0;
       end
       
       initial begin
               $display("Exercicio05 - Wadson Gomes Ferreira - 460631");
               $display("Tabela-Verdade NOR usando 'de Morgan'");
               $monitor("~ ( a=%b | b=%b ) => %b",a,b,s);
               #1
                 a=1'b0;
                 b=1'b1;
               #1
                 a=1'b1;
                 b=1'b0;
               #1
                 a=1'b1;
                 b=1'b1;
       end

endmodule