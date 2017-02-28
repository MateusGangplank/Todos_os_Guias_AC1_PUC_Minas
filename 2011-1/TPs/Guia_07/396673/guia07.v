// ---------------------
// Guia 07
// Nome: Anderson Belchior de Carvalho
// Matricula: 396673
// ---------------------

// ---------------------
// -- meia soma
// ---------------------

module meiasoma (s, s1, p, q);
output s, s1;
input p, q;
xor XOR1(s, p, q);
and AND1(s1, p, q);

endmodule //fim 

// ---------------------
// -- soma completa
// ---------------------

module somacompleta (s, s1, p, q, vaium);
output s, s1;
input p, q, vaium;
wire s2, s3, s4;

meiasoma M1(s2, s3, p, q);
meiasoma M2(s, s4, s2, vaium);
or OR1(s1, s3, s4);

endmodule //fim 

// ---------------------
// -- somador
// ---------------------

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

endmodule //fim 

// ---------------------
// -- Comparador Logico
// ---------------------

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

endmodule //fim 

// ---------------------
// -- ALU
// ---------------------

module alu (S, COut, Ovfw, Comp, A, B);
input [3:0]A,B;
output [3:0]S;
output COut, Ovfw, Comp;

somador SOMA(S, COut, Ovfw, A, B);
comparador COMPAR(Comp, A, B);

endmodule //fim 

// ---------------------
// -- meia diferenca
// ---------------------

module meiadiferenca (s, s1, p, q);
output s, s1;
input p, q;
xor XOR1(s, p, q);
not NOT1(s2, p);
and AND1(s1, s2, q);

endmodule //fim 

// ---------------------
// -- diferenca
// ---------------------

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

endmodule //fim 

// ---------------------
// -- diferenca completa
// ---------------------

module diferencacompleta (s, s1, p, q, vemum);
output s, s1;
input p, q, vemum;
wire s2, s3, s4;

meiadiferenca M1(s2, s3, p, q);
meiadiferenca M2(s, s4, s2, vemum);
or OR1(s1, s3, s4);

endmodule //fim 

// ---------------------
// -- Comparador Aritmetico
// ---------------------

module comparadorArit (IG, AMAB, AMEB, A, B);
input [3:0]A,B;
output [3:0]S;
output IG, AMAB, AMEB;

comparador C1(IG, A, B);
diferenca DIF1(S, COut, Ovfw, A, B);
nor NOR1(AMAB, IG, S[3]);
and A(AMEB, S[3], S[3]);

endmodule //fim 

// ---------------------
// -- Alu2
// ---------------------

module alu2 (S, COut, Ovfw, IG, AMAB, S[3], A, B);
input [3:0]A,B;
output [3:0]S;
output COut, Ovfw, IG, AMAB, AMEB;

diferenca DIF1(S, COut, Ovfw, A, B);
comparadorArit COMPAR(IG, AMAB, AMEB, A, B);

endmodule //fim 

// ---------------------
// -- complemento de 1
// ---------------------

module complemento (S, A);
input [3:0]A;
output [3:0]S;

not NOT1 (S[0], A[0]);
not NOT1 (S[1], A[1]);
not NOT1 (S[2], A[2]);
not NOT1 (S[3], A[3]);

endmodule //fim 

// ---------------------
// -- complemento de 2
// ---------------------

module complemento2 (S, carry, A);
input [3:0]A;
output [3:0]S;
output carry;
wire [3:0]W;
wire [2:0]W2;

not NOT1 (W[0], A[0]);
not NOT1 (W[1], A[1]);
not NOT1 (W[2], A[2]);
not NOT1 (W[3], A[3]);
meiasoma M1(S[0],W2[0],W[0],1);
meiasoma M2(S[1],W2[1],W[1],W2[0]);
meiasoma M3(S[2],W2[2],W[2],W2[1]);
meiasoma M4(S[3],carry,W[3],W2[2]);

endmodule //fim 

// ---------------------
// -- decremento
// ---------------------

module decremento (S, carry, A);
input [3:0]A;
output [3:0]S;
output carry;
wire [2:0]W2;

meiadiferenca M1(S[0],W2[0],A[0],1);
meiadiferenca M2(S[1],W2[1],A[1],W2[0]);
meiadiferenca M3(S[2],W2[2],A[2],W2[1]);
meiadiferenca M4(S[3],carry,A[3],W2[2]);

endmodule //fim 

// ---------------------
// -- incremento
// ---------------------

module incremento (S, carry, A);
input [3:0]A;
output [3:0]S;
output carry;
wire [2:0]W2;

meiasoma M1(S[0],W2[0],A[0],1);
meiasoma M2(S[1],W2[1],A[1],W2[0]);
meiasoma M3(S[2],W2[2],A[2],W2[1]);
meiasoma M4(S[3],carry,A[3],W2[2]);

endmodule //fim 


// ---------------------
// -- Produto por 2
// ---------------------

module produtoPor2 (S, A);
input [3:0]A;
output [4:0]S;

and AND0(S[0], 0, 0);
and AND1(S[1],A[0],1);
and AND2(S[2],A[1],1);
and AND3(S[3],A[2],1);
and AND4(S[4],A[3],1);


endmodule //fim 


module test;
reg [3:0]A;
reg [3:0]B;
wire [3:0]Soma,Dif,Complem,C2, INC, DEC;
wire [4:0]P2;
wire COut, COut2, Ovfw, Ovfw2, Comp, IG, AMAB, Carry, Carry2, Carry3;

alu ALU1(Soma, COut, Ovfw, Comp, A, B);
alu2 ALU21(Dif, COut2, Ovfw2, IG, AMAB, AMEB, A, B);
complemento C1(Complem, A);
complemento2 COMP(C2, Carry, A);
incremento I(INC, Carry2, A);
decremento D(DEC, Carry3, A);
produtoPor2 P(P2, A);

// parte principal
   initial begin
		$display("Guia 07_- Anderson Belchior de Carvalho - 396673");
      $display("ALU");
      $display("\n a   +   b =   s / Cout / Ovfw / Comp ; a - b = s / Cout / Ovfw / Iguais / a>b / a<b / ComplementoA / Complemento2 A / IncrementoA / DecrementoA / Produto2 A\n");
		A = 0;
		B = 0;
  		while(A != 15)
		  begin
		    A = (B == 0)? A : A + 1;
			 B = 0;
  #1      $display("%b + %b = %b / %b / %b / %b ; %b - %b = %b / %b / %b / %b / %b / %b / %b / %b %b / %b %b / %b %b / %b", A, B, Soma, COut, Ovfw, Comp, A, B, Dif, COut2, Ovfw2, IG, AMAB, AMEB, Complem, Carry, C2, Carry2, INC, Carry3, DEC, P2);
			 while(B != 15)
			   begin
				  B = B + 1;
  #1              $display("%b + %b = %b / %b / %b / %b ; %b - %b = %b / %b / %b / %b / %b / %b / %b / %b %b / %b %b / %b %b / %b", A, B, Soma, COut, Ovfw, Comp, A, B, Dif, COut2, Ovfw2, IG, AMAB, AMEB, Complem, Carry, C2, Carry2, INC, Carry3, DEC, P2);
		      end
		  end
  end

endmodule //fim guia_07
