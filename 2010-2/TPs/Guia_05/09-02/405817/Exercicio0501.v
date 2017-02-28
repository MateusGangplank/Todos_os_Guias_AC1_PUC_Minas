// ---------------------
// Guia 05_01 - FAZER um circuito lógico para realizar 
//     uma soma completa de dois valores binários 
//     com três bits cada, usando subcircuitos 
// Nome: Luiz Felipe Fonseca
// Matricula: 405817
// ---------------------

// ---------------------
// -- modules
// ---------------------

module half_adder(s, hso1, hsi0, hsi1);
 output s, hso1;
 input hsi0, hsi1;
 wire hsw0, hsw1;
 
 xor XOR1(hso0, hsi0, hsi1);
 and AND1(hso1, hsi0, hsi1); 

endmodule // half_adder


module full_adder(s, fao1, fai0, a, b);
 output s, fao1;
 input fai0, a, b;
 wire w0, w1, w2;
 
 half_adder HALFADD1(w0, w1, fai0, a);
 half_adder HALFADD2(fao0, w2, w0, b);
 or OR1(fao1, w1, w2);

endmodule // full_adder
 

// ---------------------
// -- exercicio 05_01
// ---------------------

module Exercicio0501;
reg   [2:0]A, B;
 wire  [3:0]S;
 wire  [1:0]W;
 

 full_adder FULLADD1(S[0], W[0], A[0], B[0], 0);
 full_adder FULLADD2(S[1], W[1], A[1], B[1], W[0]);
 full_adder FULLADD3(S[2], S[3], A[2], B[2], W[1]);
 
 
 initial begin

		$display("Guia 05_01 - Luiz Felipe Fonseca - 405817");
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
  #1              $display("// %b + %b = %b", A, B, S);
		      end
		  end
  end

endmodule // Exercicio0501