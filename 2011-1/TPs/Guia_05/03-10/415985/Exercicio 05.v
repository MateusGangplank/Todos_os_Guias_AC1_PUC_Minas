// ---------------------
// Guia 05 - Exercicio 05
// Nome: Bruno C�sar Lopes Silva
// Matricula: 415985
// ---------------------

//--- Module Meia Diferen�a Nor ---

module meiadiferenca (s, s1, p, q);
output s, s1;
input p, q;
wire s2, s3, s4, s5;
nor NOR1(s2, p, p);
nor NOR2(s3, q, q);
nor NOR3(s4, s2, q);
nor NOR4(s1, p, s3);
nor NOR5(s5, s4, s1);
nor NOR6(s, s5, s5);

endmodule // meiadiferenca

module diferencacompleta (s, s1, p, q, vemum);
output s, s1;
input p, q, vemum;
wire s2, s3, s4, s5;

meiadiferenca M1(s2, s3, p, q);
meiadiferenca M2(s, s4, s2, vemum);
nor NOR1(s5, s3, s4);
nor NOR2(s1, s5, s5);

endmodule // diferencacompleta

//--- Module Teste ---

module testediferenca3bits;
reg [2:0]A;
reg [2:0]B;
wire [3:0]S;
wire [1:0]W;

meiadiferenca M1(S[0], W[0], A[0], B[0]);
diferencacompleta S1(S[1], W[1], A[1], B[1], W[0]);
diferencacompleta S2(S[2], S[3], A[2], B[2], W[1]); 

// parte principal
   initial begin
	   $display("Guia 05 - Exercicio 05");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Diferenca Completa com 3 bits usando NOR");
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

endmodule // testediferenca3bits