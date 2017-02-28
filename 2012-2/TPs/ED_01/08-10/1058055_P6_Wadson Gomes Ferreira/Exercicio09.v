/* Exercicio 09
** Wadson Gomes Ferreira
** 460631
** Tabela-verdade AND 4 entradas usando modulos de 2 entradas
*/

module twoAND(output s, input x, input y);
       assign s = x & y;
endmodule

module fourAND(output s, input x, input y, input w, input z);
       wire k,l,m;
       twoAND T1(k,x,y);
       twoAND T2(l,w,z);
       twoAND T3(m,k,l);
       assign s = m;
endmodule

module exercicio;
       reg a,b,c,d;
       wire s;
       fourAND T4(s,a,b,c,d);
       initial begin
               #1 a=0; b=0; c=0; d=0;
               #1
                 $display("Exercicio09 - Wadson Gomes Ferreira - 460631");
                 $display("Tabela-Verdade AND 4 entradas usando modulo de 2 entradas");
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