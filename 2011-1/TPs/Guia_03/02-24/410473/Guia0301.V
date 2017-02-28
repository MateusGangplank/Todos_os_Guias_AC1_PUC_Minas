// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-03 Exercicio 01
// Data de entrega: 14-18/02/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------


// ---------------------
// -- test ex 01
// ---------------------

 module testex01;
 reg   a, b;
 wire  co, s, s0, s1, x, y;
 
 not NOT1 (x, a);             // TENTE DEFINIR EM OUTRO MODULO
 not NOT2 (y, b);
 and AND1 (s0, x, b);
 and AND2 (s1, a, y);
 or OR1   (s, s0, s1);
 and AND3 (co, a, b);
           
         
 initial begin
 
      $display("Exercicio 01 - Pedro Tronbin - 410473");
      $display("Half Adder Test.");
      $display("A  +  B  =  C  S");
      
		a=0; b=0;
		
  	#1	 $monitor("%b  +  %b  =  %b  %b", a, b, co, s);
   #1  a=0; b=1;
   #1  a=1; b=0;
   #1  a=1; b=1;
 
 end

endmodule // testex01

/* SAIDA

Exercicio 01 - Pedro Tronbin - 410473
    Teste Operador Meia Soma.
    A  +  B  =  C  S
    0  +  0  =  0  0
    0  +  1  =  0  1
    1  +  0  =  0  1
    1  +  1  =  1  0
*/