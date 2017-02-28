// ---------------------
// Nome: Caio Ragacci Pimentel
// Matricula: 405794
// ---------------------


// ---------------------
// -- Guia03 - 02
// ---------------------

 module testeexercicio02;
 reg   a, b;
 wire  n0, c1, s, s0, s1, s2, nand4, nand5, notA, notB, snot, sand;
 
 nand NAND2 (notA, a, a); 
 nand NAND3 (notB, b, b); 
 nand NAND4 (sand, a, notB); 
 nand NAND5 (snot, notA, b);  
 nand NAND6 (nand4, sand, sand);  
 nand NAND7 (nand5, snot, snot);  
 nand NAND8 (s2, nand4, nand5);      
 nand NAND9 (s1, nand4, s2);         
 nand NAND10(s0, nand5, s2);        
 nand NAND11(s, s0, s1);            
 nand NAND0 (n0, a, b);  
 nand NAND1 (c1, n0, n0);  
         
        
 initial begin
 
      $display("Guia03-02 - Caio Ragacci Pimentel - 405794");
      $display("  MEIA SOMA.");
      $display("A  +  B  =  C  S");
       
	   a=0; b=0;
		
  	#1	 $monitor("%b  +  %b  =  %b  %b", a, b, c1, s);
   #1  a=0; b=1;
   #1  a=1; b=0;
   #1  a=1; b=1;

 end

endmodule // testeexercicio02
