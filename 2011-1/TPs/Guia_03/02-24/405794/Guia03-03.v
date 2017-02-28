//-----------------------------
// Nome: Caio Ragacci Pimentel
// Matrícula: 405794
//-----------------------------

//-----------------------------
//------ GUIA 03 - 03----------
//-----------------------------

 module testeexercicio03;
 reg   a, b;
 wire  n0, c0, s, s0, s1, s2, nand4, nand5, notA, notB, snot, sand, cnot;
 
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
 nand NAND0 (n0, cnot, b);  
 nand NANDX (cnot, a, a);
 nand NAND1 (c0, n0, n0);  
          
         
 initial begin
 
      $display("Guia03 - 03 - Caio Ragacci Pimentel - 405794");
      $display(" MEIO SUBTRATOR.");
      $display("\nA  -  B  =  C  S");
		
      a=0; b=0;
		 
  	#1	 $monitor(" %b  -  %b  =  %b  %b", a, b, c0, s);
   #1  a=0; b=1;
   #1  a=1; b=0;
   #1  a=1; b=1;
 
 end

endmodule // testexercicio03



