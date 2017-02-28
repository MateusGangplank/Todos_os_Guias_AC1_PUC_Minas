// ---------------------
// Guia 05_04 - Soma completa de valores binarios com 3 bits
// Nome: Heitor Terozendi  
// Matricula: 396698
// --------------------

//--- Module Meia Soma Nand --

module meiasoma (s, s1, a, b);
output s, s1;
input a, b;
wire s2, s3, s4, s5, s6;

nand NAND1(s2, a, b);
nand NAND2(s3, b, b);
nand NAND3(s4, s2, b);
nand NAND4(s5, a, s3);
nand NAND5(s, s4, s5);
nand NAND6(s6, a, b);
nand NAND7(s1, s6, s6);

endmodule // meiasoma

// ----- Module Soma Completa NAND ---

module somacompleta (s, s1, a, b, vaium);
output s, s1;
input a, b, vaium;
wire s2, s3, s4, s5, s6;

meiasoma M1(s2, s3, a, b);
meiasoma M2(s, s4, s2, vaium);
nand NAND1(s5, s3, s3);
nand NAND2(s6, s4, s4);
nand NAND3(s1, s5, s6);

endmodule // somacompleta

//--- Module Teste ---

module testesoma3bits;
reg [2:0]A;
reg [2:0]B;
wire [3:0]S;
wire [1:0]W;

meiasoma M1(S[0], W[0], A[0], B[0]);
somacompleta S1(S[1], W[1], A[1], B[1], W[0]);
somacompleta S2(S[2], S[3], A[2], B[2], W[1]); 

// parte principal
   initial begin
	   $display("Guia 05_04 - Soma completa de valores binarios com 3 bits");
		$display("Nome: Heitor Terozendi - Matricula: 396698");
      $display("\n a + b = s \n");
		A = 0;
		B = 0;
  		while(A != 7)
		  begin
		    A = (B == 0)? A : A + 1;
			 B = 0;
  #1      $display("%b + %b = %b", A, B, S);
			 while(B != 7)
			   begin
				  B = B + 1;
  #1              $display("%b + %b = %b", A, B, S);
		      end
		  end
  end

endmodule // testesoma3bits