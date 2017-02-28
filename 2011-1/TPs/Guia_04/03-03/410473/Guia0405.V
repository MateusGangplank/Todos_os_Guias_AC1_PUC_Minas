// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-04 Exercicio 05
// Data de entrega: 21-25/02/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------

// ---------------------
// -- test ex05
// ---------------------

 module halfSubtractor (a, b, c, s);
 input   a, b;
 output s, c;
 wire  notA, notB, c, s1, s2, s0, s, notC;
 
 nor NOR0 (notA, a, a);
 nor NOR1 (notB, b, b);
 nor NOR7 (notC, notA, notA);
 nor COUT (c, notC, notB);
 nor NOR3 (s1, a, notB);
 nor NOR4 (s2, notA, b);
 nor NOR5 (s0, s1,s2);
 nor NOR6 (s, s0, s0);

endmodule  // halfSubtractor


 module testex05;
 reg a, b, c;
 wire s0, s1, s2, s3, cOut;
 halfSubtractor um (a, b, s1, s0);
 halfSubtractor dois (s0, c, s3, s2);
 assign cOut = s3 | s1;
 
 initial begin
 
      $display("Exercicio 05 - Pedro Tronbin - 410473");
      $display("Teste Operador Diferenca Completa usando Meia Diferenca NOR.");
      $display("A  -  B  -  C  =  C0  S");
      a=0; b=0; c=0;
		
    #1  $monitor("%b  -  %b  -  %b  =  %b  %b", a, b, c, cOut, s2);
    #1  a=0; b=0; c=1;
    #1  a=0; b=1; c=0;
    #1  a=0; b=1; c=1;
    #1  a=1; b=0; c=0;
    #1  a=1; b=0; c=1;
    #1  a=1; b=1; c=0;
    #1  a=1; b=1; c=1;

 end

 endmodule // testex05

/* SAIDA

Exercicio 05 - Pedro Tronbin - 410473
    Teste Operador Diferenca Completa usando Meia Diferenca NOR.
    A  -  B  -  C  =  C0  S
    0  -  0  -  0  =  0  0
    0  -  0  -  1  =  1  1
    0  -  1  -  0  =  1  1
    0  -  1  -  1  =  1  0
    1  -  0  -  0  =  0  1
    1  -  0  -  1  =  0  0
    1  -  1  -  0  =  0  0
    1  -  1  -  1  =  1  1
*/