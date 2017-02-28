// ---------------------
// Guia 05 - Exercicio 01
// Nome: Bruno C�sar Lopes Silva
// Matricula: 415985
// --------------------

//--- Module Meia Soma--

module meiasoma (s, s1, p, q);
output s, s1;
input p, q;
xor XOR1(s, p, q);
and AND1(s1, p, q);

endmodule // meiasoma

//--- Module Soma Completa ---

module somacompleta (s, s1, p, q, vaium);
output s, s1;
input p, q, vaium;
wire s2, s3, s4;

meiasoma M1(s2, s3, p, q);
meiasoma M2(s, s4, s2, vaium);
or OR1(s1, s3, s4);

endmodule // somacompleta

//--- Module Teste ---

module testesoma4bits;
reg [3:0]A;
reg [3:0]B;
wire [4:0]S;
wire [2:0]W;

meiasoma M1(S[0], W[0], A[0], B[0]);
somacompleta S1(S[1], W[1], A[1], B[1], W[0]);
somacompleta S2(S[2], W[2], A[2], B[2], W[1]);
somacompleta S3(S[3], S[4], A[3], B[3], W[2]); 

// parte principal
   initial begin
	   $display("Guia 05 - Exercicio 01");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Soma Completa com 4 bits");
      $display("\n a + b = s \n");
		A = 0;
		B = 0;
  		while(A != 15)
		  begin
		    A = (B == 0)? A : A + 1;
			 B = 0;
  #1      $display("%b + %b = %b", A, B, S);
			 while(B != 15)
			   begin
				  B = B + 1;
  #1              $display("%b + %b = %b", A, B, S);
		      end
		  end
  end

endmodule // testesoma4bits

// OBS.: FAVOR NAO DEIXAR ESPACOS EM BRANCO NO NOME DE ARQUIVO.
