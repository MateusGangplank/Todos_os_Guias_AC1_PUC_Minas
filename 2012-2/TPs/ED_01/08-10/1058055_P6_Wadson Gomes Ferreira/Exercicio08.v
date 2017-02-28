/* Exercicio 08
** Wadson Gomes Ferreira
** 460631
** Tabela-verdade AND 4 entradas
*/

module fourAND(output s, input x, input y, input w, input z);
       assign s = x & y & w & z;
endmodule

module teste;
       reg a,b,c,d;
       wire s;
       fourAND T1(s,a,b,c,d);
       initial begin
         #1 a=0; b=0; c=0; d=0;
         #1
           $display("Exercicio08 - Wadson Gomes Ferreira - 460631");
           $display("Tabela-Verdade AND de 4 entradas");
           $monitor("a=%b , b=%b, c=%b, d=%b => %b",a,b,c,d,s);
         #1 a=0; b=0; c=0; d=1;
         #1 a=0; b=0; c=1; d=0;
         #1 a=0; b=0; c=1; d=0;
         #1 a=0; b=1; c=0; d=0;
         #1 a=0; b=1; c=0; d=1;
         #1 a=0; b=1; c=1; d=0;
         #1 a=0; b=1; c=1; d=1;
         #1 a=1; b=0; c=0; d=0;
         #1 a=1; b=0; c=0; d=1;
         #1 a=1; b=0; c=1; d=0;
         #1 a=1; b=0; c=1; d=1;
         #1 a=1; b=1; c=0; d=0;
         #1 a=1; b=1; c=0; d=1;
         #1 a=1; b=1; c=1; d=0;
         #1 a=1; b=1; c=1; d=1;
       end
endmodule