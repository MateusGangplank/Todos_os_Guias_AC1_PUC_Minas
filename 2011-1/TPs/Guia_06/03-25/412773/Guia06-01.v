//----------------------------
// Nome: Silvino Henrique Santos de Souza
// Matrícula: 412773
//----------------------------


//----------------------------
//------ Guia 06 - 01---------
//----------------------------

// --- Meia Soma ---
module meiasoma (s, s1, a, b);
output s, s1;
input a, b;
xor XOR1(s, a, b);
and AND1(s1, a, b);

endmodule // fim meiasoma

//--- Soma Completa ---

module somacompleta (s, s1, a, b, vai1);
output s, s1;
input a, b, vai1;
wire s2, s3, s4;

meiasoma MS1(s2, s3, a, b);
meiasoma MS2(s, s4, s2, vai1);
or OR1(s1, s3, s4);

endmodule // fim somacompleta

//---- Somador ----

module somador (S, Cout, Overflow, A, B);
input [3:0]A;
input [3:0]B;
output [3:0]S;
output Cout, Overflow;
wire [2:0]C;

meiasoma MS1(S[0], C[0], A[0], B[0]);
somacompleta S1(S[1], C[1], A[1], B[1], C[0]);
somacompleta S2(S[2], C[2], A[2], B[2], C[1]);
somacompleta S3(S[3], Cout, A[3], B[3], C[2]);
xor XOR1(Overflow, Cout, C[2]);

endmodule // fim somador

//  ---ALU ---

module alu (S, Cout, Overflow, Complemento, A, B);
input [3:0]A,B;
output [3:0]S;
output Cout, Overflow, Complemento;

somador SOMA(S, Cout, Overflow, A, B);
comparador C1(Complemento, A, B);

endmodule // fim alu

//--- Comparador ---

module comparador (Complemento, A, B);
input [3:0]A;
input [3:0]B;
output Complemento;
wire [3:0]C;

xnor XNOR1 (C[0], A[0], B[0]);
xnor XNOR1 (C[1], A[1], B[1]);
xnor XNOR1 (C[2], A[2], B[2]);
xnor XNOR1 (C[3], A[3], B[3]);
and (Complemento, C[0], C[1], C[2], C[3]);

endmodule // fim comparador

// --- Teste ---

module teste;
reg [3:0]A;
reg [3:0]B;
wire [3:0]Soma;
wire Cout, Overflofw, Complemento;


alu ALU1(Soma, Cout, Overflow, Complemento, A, B);

// parte principal
   initial begin
	   $display("Guia 06- 01");
		$display("Silvino Henrique Santos de Souza - 412773");
      $display(" a   +   b =   s / Cout / Overflow / Complemento ");

		A = 0;
		B = 0;
  		while(A != 15)
		  begin
		    A = (B == 0)? A : A + 1;
			 B = 0;
  #1      $display("%b + %b = %b / %b / %b / %b ; ", A, B, Soma, Cout, Overflow, Complemento);
			 while(B != 15)
			   begin
				  B = B + 1;
  #1              $display("%b + %b = %b / %b / %b / %b ; ", A, B, Soma, Cout, Overflow, Complemento);
		      end
		  end
  end



endmodule // fim teste