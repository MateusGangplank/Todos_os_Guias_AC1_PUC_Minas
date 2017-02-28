//Nome: Gabriel Benjamim de Carvalho
//Matrícula: 396690

 module teste2;
 reg   a, b;
 wire  nOut, cOut, s, s0, s1, s2, nand4, nand5, notA, notB, snotAANDb, saANDnotB;
 
 nand NAND2 (notA, a, a); 
 nand NAND3 (notB, b, b); 
 nand NAND4 (saANDnotB, a, notB); 
 nand NAND5 (snotAANDb, notA, b);  
 nand NAND6 (nand4, saANDnotB, saANDnotB); 
 nand NAND7 (nand5, snotAANDb, snotAANDb);  
 nand NAND8 (s2, nand4, nand5);      
 nand NAND9 (s1, nand4, s2);         
 nand NAND10(s0, nand5, s2);        
 nand NAND11(s, s0, s1);            
 nand NAND0 (nOut, a, b);  
 nand NAND1 (cOut, nOut, nOut); 
         
        
 initial begin
 
      $display("Teste 02 - Operador Meia Soma Portas Nand.");
      $display("A  +  B  =  C  S");
       
	   a=0; b=0;
		
  	#1	 $monitor("%b  +  %b  =  %b  %b", a, b, cOut, s);
	#1  a=0; b=1;
   #1  a=1; b=0;
   #1  a=1; b=1;

 end

endmodule 

/* TESTE

Teste 02 - Operador Meia Soma Portas Nand.
    A  +  B  =  C  S
    0  +  0  =  0  0
    0  +  1  =  0  1
    1  +  0  =  0  1
    1  +  1  =  1  0
*/