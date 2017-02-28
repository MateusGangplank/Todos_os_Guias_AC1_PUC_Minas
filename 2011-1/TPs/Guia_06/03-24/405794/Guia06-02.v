//----------------------------
// Nome: Caio Ragacci Pimentel
// Matrícula: 405794
//----------------------------


//----------------------------
//------ Guia 06 - 02---------
//----------------------------

// --- Meia Diferenca ---

module meiadiferenca (s, s1, a, b);
output s, s1;
input a, b;
xor XOR1(s, a, b);
not NOT1(s2, a);
and AND1(s1, s2, b);

endmodule //  fim meiadiferenca

// --- Diferenca Completa --- 

module diferencacompleta (s, s1, a, b, vem1);
output s, s1;
input a, b, vem1;
wire s2, s3, s4;

meiadiferenca M1(s2, s3, a, b);
meiadiferenca M2(s, s4, s2, vem1);
or OR1(s1, s3, s4);

endmodule // fim diferencacompleta

// --- Diferenca ---

module diferenca (S, Cout, Overflow, A, B);
input [3:0]A;
input [3:0]B;
output [3:0]S;
output Cout, Overflow;
wire [2:0]W;

meiadiferenca M1(S[0], W[0], A[0], B[0]);
diferencacompleta D1(S[1], W[1], A[1], B[1], W[0]);
diferencacompleta D2(S[2], W[2], A[2], B[2], W[1]);
diferencacompleta D3(S[3], Cout, A[3], B[3], W[2]);
xor XOR1(Overflow, Cout, W[2]);

endmodule // fim diferenca

// ---Comparador Logico ---

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

endmodule //  fim comparador


// --- Comparador Aritmetico ---

module compradorAritimetico (iG, am, S[3], A, B);
input [3:0]A,B;
output [3:0]S;
output iG, am;

comparador C1(iG, A, B);
diferenca DIF1(S, Cout, Overflow, A, B);
nor NOR1(am, iG, S[3]);

endmodule // fim compradorAritimetico

// ---Module alu2 ---

module alu2 (S, Cout, Overflow, iG, am, S[3], A, B);
input [3:0]A,B;
output [3:0]S;
output Cout, Overflow, iG, am;

diferenca DIF(S, Cout, Overflow, A, B);
compradorAritimetico COMPARADOR(iG, am, S[3], A, B);

endmodule // fim alu2

// --- Teste ---

module teste;
reg [3:0]A;
reg [3:0]B;
wire [3:0]Dif;
wire Cout2,Overflow2, Comp, iG, am;


alu2 ALU21(Dif, Cout2, Overflow2, iG, am, Dif[3], A, B);

// parte principal
   initial begin
	   $display("Guia 06- 02");
		$display("Caio Ragacci Pimentel - 405794");
      $display("~~~~ALU~~~~");
      $display(" a - b = s / Cout / Overflow / Iguais / a > b / a < b  ");

		A = 0;
		B = 0;
  		while(A != 15)
		  begin
		    A = (B == 0)? A : A + 1;
			 B = 0;
  #1      $display("%b - %b = %b / %b / %b / %b / %b / %b ",A, B, Dif, Cout2, Overflow2, iG, am, Dif[3]);
			 while(B != 15)
			   begin
				  B = B + 1;
  #1              $display("%b - %b = %b / %b / %b / %b / %b / %b ",A, B, Dif, Cout2, Overflow2, iG, am, Dif[3]);
		      end
		  end
  end



endmodule // fim teste