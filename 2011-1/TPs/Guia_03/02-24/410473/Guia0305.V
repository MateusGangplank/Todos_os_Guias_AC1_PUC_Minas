// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-03 Exercicio 05
// Data de entrega: 14-18/02/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------


// ---------------------
// -- test ex 05
// ---------------------

 module testex05;
 reg   a, b;
 wire  notA, notB, c, s1, s2, s0, s, notC;
 
 nor NOR0 (notA, a, a);
 nor NOR1 (notB, b, b);
 nor NOR7 (notC, notA, notA);
 nor COUT (c, notC, notB);
 nor NOR3 (s1, a, notB);
 nor NOR4 (s2, notA, b);
 nor NOR5 (s0, s1,s2);
 nor NOR6 (s, s0, s0);
       
       
 initial begin
 
      $display("Exercicio 05 - Pedro Tronbin - 410473");
      $display("Half Subtractor Test.");
      $display("A  -  B  =  C  S");
		
      a=0; b=0;
		
  	#1	 $monitor("%b  -  %b  =  %b  %b", a, b, c, s);
   #1  a=0; b=1;
   #1  a=1; b=0;
   #1  a=1; b=1;
 
 end

endmodule // testex05

/* SAIDA

Exercicio 05 - Pedro Tronbin - 410473
    Half Subtractor Test.
    A  -  B  =  C  S
    0  -  0  =  0  0
    0  -  1  =  1  1
    1  -  0  =  0  1
    1  -  1  =  0  0
*/