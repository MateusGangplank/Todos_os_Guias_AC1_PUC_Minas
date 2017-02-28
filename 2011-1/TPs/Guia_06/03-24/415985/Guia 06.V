// ---------------------
// Guia 06
// Nome: Bruno César Lopes Silva
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

// --- Module Somador ----

module somador (S, COut, Ovfw, A, B);
input [3:0]A;
input [3:0]B;
output [3:0]S;
output COut, Ovfw;
wire [2:0]W;

meiasoma M1(S[0], W[0], A[0], B[0]);
somacompleta S1(S[1], W[1], A[1], B[1], W[0]);
somacompleta S2(S[2], W[2], A[2], B[2], W[1]);
somacompleta S3(S[3], COut, A[3], B[3], W[2]);
xor XOR1(Ovfw, COut, W[2]);

endmodule // somador

// --- Module Comparador Logico ---

module comparador (Comp, A, B);
input [3:0]A;
input [3:0]B;
output Comp;
wire [3:0]W;

xnor XNOR1 (W[0], A[0], B[0]);
xnor XNOR1 (W[1], A[1], B[1]);
xnor XNOR1 (W[2], A[2], B[2]);
xnor XNOR1 (W[3], A[3], B[3]);
and (Comp, W[0], W[1], W[2], W[3]);

endmodule // comparador

// --- Module ALU ---

module alu (S, COut, Ovfw, Comp, A, B);
input [3:0]A,B;
output [3:0]S;
output COut, Ovfw, Comp;

somador SOMA(S, COut, Ovfw, A, B);
comparador COMPAR(Comp, A, B);

endmodule // alu

// --- Module Meia Diferenca ---

module meiadiferenca (s, s1, p, q);
output s, s1;
input p, q;
xor XOR1(s, p, q);
not NOT1(s2, p);
and AND1(s1, s2, q);

endmodule // meiadiferenca

// --- Module Diferenca Completa --- 

module diferencacompleta (s, s1, p, q, vemum);
output s, s1;
input p, q, vemum;
wire s2, s3, s4;

meiadiferenca M1(s2, s3, p, q);
meiadiferenca M2(s, s4, s2, vemum);
or OR1(s1, s3, s4);

endmodule // diferencacompleta

// --- Module Diferenca ---

module diferenca (S, COut, Ovfw, A, B);
input [3:0]A;
input [3:0]B;
output [3:0]S;
output COut, Ovfw;
wire [2:0]W;

meiadiferenca M1(S[0], W[0], A[0], B[0]);
diferencacompleta D1(S[1], W[1], A[1], B[1], W[0]);
diferencacompleta D2(S[2], W[2], A[2], B[2], W[1]);
diferencacompleta D3(S[3], COut, A[3], B[3], W[2]);
xor XOR1(Ovfw, COut, W[2]);

endmodule // diferenca

// --- Module Comparador Aritmetico ---

module comparadorArit (IG, AMAB, S[3], A, B);
input [3:0]A,B;
output [3:0]S;
output IG, AMAB;

comparador C1(IG, A, B);
diferenca DIF1(S, COut, Ovfw, A, B);
nor NOR1(AMAB, IG, S[3]);

endmodule // compradorArit

// --- Module alu2 ---

module alu2 (S, COut, Ovfw, IG, AMAB, S[3], A, B);
input [3:0]A,B;
output [3:0]S;
output COut, Ovfw, IG, AMAB;

diferenca DIF1(S, COut, Ovfw, A, B);
comparadorArit COMPAR(IG, AMAB, S[3], A, B);

endmodule // alu2

// --- Module Complemento de 1 ---

module complemento (S, A);
input [3:0]A;
output [3:0]S;

not NOT1 (S[0], A[0]);
not NOT1 (S[1], A[1]);
not NOT1 (S[2], A[2]);
not NOT1 (S[3], A[3]);

endmodule // complemento

// --- Teste ALU Final ---

module testealufinal;
reg [3:0]A;
reg [3:0]B;
wire [3:0]Soma,Dif,Complem;
wire COut, COut2, Ovfw, Ovfw2, Comp, IG, AMAB;


alu ALU1(Soma, COut, Ovfw, Comp, A, B);
alu2 ALU21(Dif, COut2, Ovfw2, IG, AMAB, Dif[3], A, B);
complemento C1(Complem, A);

// parte principal
   initial begin
	   $display("Guia 06");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("ALU");
      $display("\n a   +   b =   s / Cout / Ovfw / Comp ; a - b = s / Cout / Ovfw / Iguais / a>b / a<b ; ComplementoA\n");
		A = 0;
		B = 0;
  		while(A != 15)
		  begin
		    A = (B == 0)? A : A + 1;
			 B = 0;
  #1      $display("%b + %b = %b / %b / %b / %b ; %b - %b = %b / %b / %b / %b / %b / %b ; %b", A, B, Soma, COut, Ovfw, Comp, A, B, Dif, COut2, Ovfw2, IG, AMAB, Dif[3], Complem);
			 while(B != 15)
			   begin
				  B = B + 1;
  #1              $display("%b + %b = %b / %b / %b / %b ; %b - %b = %b / %b / %b / %b / %b / %b ; %b", A, B, Soma, COut, Ovfw, Comp, A, B, Dif, COut2, Ovfw2, IG, AMAB, Dif[3], Complem);
		      end
		  end
  end

endmodule // testealufinal
