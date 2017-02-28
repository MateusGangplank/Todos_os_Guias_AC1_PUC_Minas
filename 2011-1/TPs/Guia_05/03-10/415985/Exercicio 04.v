// ---------------------
// Guia 05 - Exercicio 04
// Nome: Bruno C�sar Lopes Silva
// Matricula: 415985
// --------------------

//--- Module Meia Soma Nand --

module meiasoma (s, s1, p, q);
output s, s1;
input p, q;
wire s2, s3, s4, s5, s6;

nand NAND1(s2, p, p);
nand NAND2(s3, q, q);
nand NAND3(s4, s2, q);
nand NAND4(s5, p, s3);
nand NAND5(s, s4, s5);
nand NAND6(s6, p, q);
nand NAND7(s1, s6, s6);

endmodule // meiasoma

//--- Module Soma Completa Nand ---

module somacompleta (s, s1, p, q, vaium);
output s, s1;
input p, q, vaium;
wire s2, s3, s4, s5, s6;

meiasoma M1(s2, s3, p, q);
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
	   $display("Guia 05 - Exercicio 04");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Soma Completa com 3 bits usando NAND");
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