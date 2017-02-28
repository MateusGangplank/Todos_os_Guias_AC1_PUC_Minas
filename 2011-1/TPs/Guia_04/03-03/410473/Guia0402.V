// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-04 Exercicio 02
// Data de entrega: 21-25/02/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------

// ---------------------
// -- test ex02
// ---------------------

 module halfAdder (a, b, s0, s1);
 output s0, s1;
 input  a, b;
 assign s1 = a & b;
 
 xor XOR (s0, a, b);
         
endmodule  // halfAdder


 module testex02;
 reg a, b, c;
 wire s0, s1, s2, s3, cOut;
 halfAdder um (a, b, s0, s1);
 halfAdder dois (s0, c, s2, s3);
 assign cOut = s3 | s1;
 
 initial begin
 
      $display("Exercicio 02 - Pedro Tronbin - 410473");
      $display("Teste Operador Soma Completa usando 2 Meia-Somas.");
      $display("A  +  B  +  C  =  C0  S");
       a=0; b=0; c=0;
		 
    #1  $monitor("%b  +  %b  +  %b  =  %b  %b", a, b, c, cOut, s2);
    #1  a=0; b=0; c=1;
    #1  a=0; b=1; c=0;
    #1  a=0; b=1; c=1;
    #1  a=1; b=0; c=0;
    #1  a=1; b=0; c=1;
    #1  a=1; b=1; c=0;
    #1  a=1; b=1; c=1;

 end

endmodule // testex02

/* SAIDA

Exercicio 02 - Pedro Tronbin - 410473
    Teste Operador Soma Completa usando 2 Meia-Somas.
    A  +  B  +  C  =  C0  S
    0  +  0  +  0  =  0  0
    0  +  0  +  1  =  0  1
    0  +  1  +  0  =  0  1
    0  +  1  +  1  =  1  0
    1  +  0  +  0  =  0  1
    1  +  0  +  1  =  1  0
    1  +  1  +  0  =  1  0
    1  +  1  +  1  =  1  1
*/