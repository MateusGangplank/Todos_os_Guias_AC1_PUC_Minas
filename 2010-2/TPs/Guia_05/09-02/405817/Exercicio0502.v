// ---------------------
// Guia 05_02 - FAZER um circuito lógico para realizar 
//     uma diferença completa de dois valores binários 
//     com dois bits cada, usando subcircuitos 
// Nome: Luiz Felipe Fonseca
// Matricula: 405817
// ---------------------

// ---------------------
// -- module
// ---------------------

module half_difference(hso0, hso1, hsi0, hsi1);
   output hso0, hso1;
   input hsi0, hsi1;
   wire hsw0, hsw1;
 
   xor XOR1(hso0, hsi0, hsi1);
   not NOT1(hsw0, hsi0);
   and AND1(hso1, hsw0, hsi1); 

endmodule // half_difference

module full_difference(s, fso1, fsi0, fsi1, fsi2);
  output s, fso1;
  input fsi0, fsi1, fsi2;
  wire w0, w1, w2;
 
 half_difference HALFSUB1(w0, w1, fsi0, fsi1);
 half_difference HALFSUB2(fso0, w2, w0, fsi2);
 or OR1(fso1, w1, w2);

endmodule // full_difference
 



// ---------------------
// -- exercicio 05_02
// ---------------------
module Exercicio0502;
 reg   [1:0]A, B;
 wire  [2:0]S;
 wire  W;
  full_difference FULLSUB1(S[0], W, A[0], B[0], 0);
 full_difference FULLSUB2(S[1], S[2], A[1], B[1], W);
 
 
 // Parte principal
 initial begin
		$display("Guia 05_02 - Luiz Felipe Fonseca - 405817");
      $display("");


     	$display("// A  - B  =  S");		
 	A = 0;
 	B = 0;
 	while (A != 3)
 	begin
 		A = (B == 0) ? A : A + 1;
 		B = 0;
   #1 $display("// %b - %b = %b", A, B, S);
 		while (B != 3)
 		  begin
 			 B = B + 1;
   #1     $display("// %b - %b = %b", A, B, S);
 		  end
 	end

 end

endmodule // Exercicio0502