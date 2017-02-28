// Nome: Felipe Augusto Torres da Silva
// Mat.: 415517


// ---------------------
// -- modules
// ---------------------

module meiasubtracao(hso0, hso1, hsi0, hsi1);
 output hso0, hso1;
 input hsi0, hsi1;
 wire hsw0, hsw1, hsw2, hsw3, hsw4;
 
 nor NOR1 (hsw0, hsi0, hsi0);
 nor NOR2 (hsw1, hsi1, hsi1);
 nor NOR3 (hsw2, hsw0, hsw1);
 nor NOR4 (hsw3, hsi0, hsi1);
 nor NOR5 (hso0, hsw2, hsw3);

 nor NOR7 (hso1, hsi0, hsw1);

endmodule // meiasubtracao


module meiasubtracao(fso0, fso1, fsi0, fsi1, fsi2);
 output fso0, fso1;
 input fsi0, fsi1, fsi2;
 wire fsw0, fsw1, fsw2, fsw3;
 
 meiasubtracao HALFSUB1(fsw0, fsw1, fsi0, fsi1);
 meiasubtracao HALFSUB2(fso0, fsw2, fsw0, fsi2);
 nor NOR8 (fsw3, fsw1, fsw2);
 nor NOR9 (fso1, fsw3, fsw3);

endmodule // meiasubtracao

// ---------------------
// -- exercicio 05_05
// ---------------------


module Exercicio0505;
 reg   [2:0]A, B;
 wire  [3:0]S;
 wire  [1:0]W;
 
 
 subtracaocompleta FULLSUB1(S[0], W[0], A[0], B[0], 0);
 subtracaocompleta FULLSUB2(S[1], W[1], A[1], B[1], W[0]);
 subtracaocompleta FULLSUB3(S[2], S[3], A[2], B[2], W[1]);

 
 
 //MAIN
 initial begin
		$display("Guia 05_05 - Felipe Augusto - 415517");
      $display("// Testar Operador Diferenca Completa  de 3 bits utilizando portas NOR\n");


      $display("//  A  -  B  =  S");		
		A = 0;
		B = 0;
		while(A != 7)
		  begin
		    A = (B == 0)? A : A + 1;
			 B = 0;
  #1      $display("// %b - %b = %b", A, B, S);
			 while(B != 7)
			   begin
				  B = B + 1;
  #1          $display("// %b - %b = %b", A, B, S);
		      end
		  end

 end

endmodule // Exercicio0505
