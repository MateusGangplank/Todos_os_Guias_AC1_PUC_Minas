/* Exercicio 10
** Wadson Gomes Ferreira
** 460631
** Tabela-verdade OR 4 entradas usando modulos de 2 entradas
*/

module twoOR(output s, input x, input y);
       assign s = x | y;
endmodule

module fourOR(output s, input x, input y, input w, input z);
       wire k,l,m;
       twoOR T1(k,x,y);
       twoOR T2(l,w,z);
       twoOR T3(m,k,l);
       assign s = m;
endmodule

module exercicio;
       reg a,b,c,d;
       wire s;
       fourOR T4(s,a,b,c,d);
       initial begin
               #1 a=0; b=0; c=0; d=0;
               #1
                 $display("Exercicio10 - Wadson Gomes Ferreira - 460631");
                 $display("Tabela-Verdade OR 4 entradas usando modulo de 2 entradas");
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