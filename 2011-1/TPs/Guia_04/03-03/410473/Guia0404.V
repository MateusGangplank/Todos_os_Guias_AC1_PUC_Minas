// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-04 Exercicio 04
// Data de entrega: 21-25/02/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------

// ---------------------
// -- test ex04
// ---------------------

 module halfSubtractor (a, b, cOut, s);
 output cOut, s;
 input   a, b;
 wire  nOut, cOut, s, s0, s1, s2, nand4, nand5, notA, notB, snotAANDb, saANDnotB, notC;
 nand NAND2 (notA, a, a); // ~ A.
 nand NAND3 (notB, b, b); // ~ B.
 nand NAND4 (saANDnotB, a, notB); // ( A & ~B )
 nand NAND5 (snotAANDb, notA, b);  //( ~A & B )
 nand NAND6 (nand4, saANDnotB, saANDnotB);  
 nand NAND7 (nand5, snotAANDb, snotAANDb); 
 nand NAND8 (s2, nand4, nand5);      
 nand NAND9 (s1, nand4, s2);        
 nand NAND10(s0, nand5, s2);         
 nand NAND11(s, s0, s1);             
 nand NAND0 (nOut, notA, b);  // ~ CarryOut.
 nand NAND1 (cOut, nOut, nOut);  // CarryOut.
 
 endmodule  // halfSubtractor

 module testex04;
 reg a, b;
 wire s, cOut;
 halfSubtractor um (a, b, cOut, s);
 
 initial begin
 
      $display("Exercicio 04 - Pedro Tronbin - 410473");
      $display("Teste Operador Meia Diferenca usando portas NAND.");
      $display("A  -  B  =  C0  S");
      a=0; b=0;
    #1  $monitor("%b  -  %b  =  %b  %b", a, b, cOut, s);
    #1  a=0; b=1;
    #1  a=1; b=0;
    #1  a=1; b=1;

 end

 endmodule // testex04
 
/* SAIDA

Exercicio 04 - Pedro Tronbin - 410473
    Teste Operador Meia Diferenca usando portas NAND.
    A  -  B  =  C0  S
    0  -  0  =  0  0
    0  -  1  =  1  1
    1  -  0  =  0  1
    1  -  1  =  0  0
*/