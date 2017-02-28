// ---------------------
// Guia 05.04 - Operador Soma Completa (Full Adder) de 3 bits usando NAND.
// Nome: Luiz Felipe Fonseca
// Matricula: 405817
// ---------------------

// ---------------------
// -- modules
// ---------------------

module halfadd(hao0, hao1, hai0, hai1);
 output hao0, hao1;
 input hai0, hai1;
 wire haw0, haw1, haw2, haw3, haw4;
 
  // XOR1
 nand NAND1 (haw0, hai0, hai0);
 nand NAND2 (haw1, hai1, hai1);
 nand NAND3 (haw2, haw0, hai1);
 nand NAND4 (haw3, hai0, haw1);
 nand NAND5 (hao0, haw2, haw3);
 // AND1
 nand NAND7 (haw4, hai0, hai1);
 nand NAND8 (hao1, haw4, haw4);

endmodule // halfadd


module fulladd(fao0, fao1, fai0, fai1, fai2);
 output fao0, fao1;
 input fai0, fai1, fai2;
 wire faw0, faw1, faw2, faw3, faw4;
 
 halfadd HALFADD1(faw0, faw1, fai0, fai1);
 halfadd HALFADD2(fao0, faw2, faw0, fai2);
 nand NAND9 (faw3, faw1, faw1);
 nand NAND10 (faw4, faw2, faw2);
 nand NAND11 (fao1, faw3, faw4);

endmodule // fulladd

// ---------------------
// -- exercicio 05_04
// ---------------------

module Exercicio0504;
 reg   [3:0]A, B;
 wire  [3:0]S;
 wire  [1:0]W;
 
 
 fulladd FULLADD1(S[0], W[0], A[0], B[0], 0);
 fulladd FULLADD2(S[1], W[1], A[1], B[1], W[0]);
 fulladd FULLADD3(S[2], S[3], A[2], B[2], W[1]);
 
 
 // Parte principal
 initial begin
      $display("Guia 05_04 - Luiz Felipe Fonseca - 405817");
      $display("// Testar Operador Soma Completa (Full Adder) de 3 bits usando NAND\n");

      $display("//  A  +  B  =  S");		
		A = 0;
		B = 0;
		while(A != 7)
		  begin
		    A = (B == 0)? A : A + 1;
			 B = 0;
  #1      $display("// %b + %b = %b", A, B, S);
			 while(B != 7)
			   begin
				  B = B + 1;
  #1          $display("// %b + %b = %b", A, B, S);
		      end
		  end
  end

endmodule // Exercicio0504

