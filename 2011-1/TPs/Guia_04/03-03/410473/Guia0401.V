// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-04 Exercicio 01
// Data de entrega: 21-25/02/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------


// ---------------------
// -- ex 01
// ---------------------

 module ex01 (a,b,c,s);
 output c, s;
 input  a, b;
 wire  notA, notB, s1, s2, s0;
 
 assign s = ~(s0 | s0);              // EVITAR EXPRESSOES, SE POSSIVEL
 assign c = ~(notA | notB);          // PROCURAR USAR APENAS PORTAS
 
 nor NOR0 (notA, a, a);
 nor NOR1 (notB, b, b);
 nor NOR2 (s1, a, notB);
 nor NOR3 (s2, notA, b);
 nor NOR4 (s0, s1, s2);
          
endmodule  // ex 01

// ---------------------
// -- test ex 01
// ---------------------
   
 module testex01;
 reg a, b;
 wire c, s;
 ex01 testex(a,b,c,s);
 
 initial begin
      $display("Exercicio 01 - Pedro Tronbin - 410473");
      $display("Half Adder Test.");
      $display("A  +  B  =  C  S");
      a=0; b=0;
		
  	 #1 $monitor("%b  +  %b  =  %b  %b", a, b, c, s);
    #1 a=0; b=1;
    #1 a=1; b=0;
    #1 a=1; b=1;
 
 end

 endmodule // testex01 
 
 /* SAIDA
 
 Exercicio 01 - Pedro Tronbin - 410473
    Half Adder Test.
    A  +  B  =  C  S
    0  +  0  =  0  0
    0  +  1  =  0  1
    1  +  0  =  0  1
    1  +  1  =  1  0
 */
 