// ---------------------
// Guia 05_02 - Diferenca completa de dois valores binarios
// Nome: Heitor Terozendi	
// Matricula: 396698
// ---------------------

//--- Module Meia Diferença---

module meiadiferenca (s, s1, a, b);
output s, s1;
input a, b;
xor XOR1(s, a, b);
not NOT1(s2, a);
and AND1(s1, s2, b);

endmodule // meiadiferenca

module diferencacompleta (s, s1, a, b, vemum);
output s, s1;
input a, b, vemum;
wire s2, s3, s4;

meiadiferenca M1(s2, s3, a, b);
meiadiferenca M2(s, s4, s2, vemum);
or OR1(s1, s3, s4);

endmodule // diferencacompleta

//--- Module Teste ---

module testediferenca2binarios;
reg [2:0]A;
reg [2:0]B;
wire [3:0]S;
wire [1:0]W;

meiadiferenca M1(S[0], W[0], A[0], B[0]);
diferencacompleta S1(S[1], W[1], A[1], B[1], W[0]);
diferencacompleta S2(S[2], S[3], A[2], B[2], W[1]); 

// parte principal
   initial begin
	   $display("Guia 05_02 - Diferenca completa de dois valores binarios");
		$display("Nome: Heitor Terozendi - Matricula: 396698");
      $display("\n a - b = s \n");
		A = 0;
		B = 0;
  		while(A != 7)
		  begin
		    A = (B == 0)? A : A + 1;
			 B = 0;
  #1      $display("%b - %b = %b", A, B, S);
			 while(B != 7)
			   begin
				  B = B + 1;
  #1              $display("%b - %b = %b", A, B, S);
		      end
		  end
  end

endmodule // testediferenca2binarios