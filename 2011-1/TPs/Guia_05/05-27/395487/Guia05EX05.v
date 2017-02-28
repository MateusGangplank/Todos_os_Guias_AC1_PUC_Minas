//-- ------------------------------------------------------
//-- Guia 05 Ex05 - Soma completa de dois valores binario
//-- Nome: Alvaro Henrique de Araujo Rungue
//-- Matricula: 395487
//-- ------------------------------------------------------

//----- Module Meia Diferenša Nor ---

module meiadiferenca (s, s1, b, a);
output s, s1;
input a, b;
wire s2, s3, s4, s5;
nor NOR1(s2, a, a);
nor NOR2(s3, b, b);
nor NOR3(s4, s2, b);
nor NOR4(s1, a, s3);
nor NOR5(s5, s4, s1);
nor NOR6(s, s5, s5);

endmodule //-- meiadiferenca

module diferencacompleta (s, s1, a, b, vemum);
output s, s1;
input a, b, vemum;
wire s2, s3, s4, s5;

meiadiferenca M1(s2, s3, a, b);
meiadiferenca M2(s, s4, s2, vemum);
nor NOR1(s5, s3, s4);
nor NOR2(s1, s5, s5);

endmodule //-- diferencacompleta

//----- Module Teste ---

module testediferenca3bits;
reg [2:0]A;
reg [2:0]B;
wire [3:0]S;
wire [1:0]W;

meiadiferenca M1(S[0], W[0], A[0], B[0]);
diferencacompleta S1(S[1], W[1], A[1], B[1], W[0]);
diferencacompleta S2(S[2], S[3], A[2], B[2], W[1]); 

//-- parte principal
   initial begin
	   $display("Guia 05 EX05 - Soma completa de dois valores binarios");
		$display("Nome: Alvaro Henrique de Araujo Rungue - 395487");
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

endmodule //-- testediferenca3bits