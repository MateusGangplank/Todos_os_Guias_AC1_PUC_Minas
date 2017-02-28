// -------------------------------------------------------------------
// Guia 07 - ALU de 4 bits
// Nome: Mariana Ramos de Brito
// Matricula: 405820
// -------------------------------------------------------------------


// ---------------------
// -- meia_soma
// ---------------------

module meia_soma (s0, s1, a, b);
	
	input   a, b;
	output s0, s1;
	
		// instancia	
	xor XOR1(s0,a, b);
	and AND1(s1, a, b);
	
endmodule // meia_soma


// --------------------------
// -- soma completa de 1 bit
// --------------------------

module soma_completa_1bit (s0, s1, a, b, c);
	
		// operador de soma completa de 1 bit
	
	input   a, b, c;
	output s0, s1;
	
	wire sa1, sa2, sa3;
	
		// instancia	
	meia_soma MEIA1 (sa1, sa2, a, b);
	meia_soma MEIA2 (s0, sa3, sa1, c);
	or OR1 (s1, sa2, sa3);
	
endmodule // soma_completa_1bit


// ----------------------------
// -- soma completa de 4 bits
// ----------------------------

module soma_completa_4bit (s0, s1, s2, s3, auxCR, auxOVR, a0, a1, a2, a3, b0, b1, b2, b3);
	
		// operador de soma completa de 4 bits
	
	input   a0, a1, a2, a3, b0, b1, b2, b3;
	output s0, s1, s2, s3, auxCR, auxOVR;
	
	wire sa1, sa2, sa3;
	
		// instancia	
	soma_completa_1bit SC1(s0, sa1, a0, b0, 0);
	soma_completa_1bit SC2(s1, sa2, a1, b1, sa1);
	soma_completa_1bit SC3(s2, sa3, a2, b2, sa2);
	soma_completa_1bit SC4(s3, auxCR, a3, b3, sa3);
	
	not NOT1(auxOVR, sa3);
	
endmodule // soma_completa_4bit


// -----------------------------
// -- soma 4bits, overflow, carry
// -----------------------------

module soma_ovr_cr (s0, s1, s2, s3, CR, OVR, a0, a1, a2, a3, b0, b1, b2, b3);
	
		// operador de soma completa de 4 bits, detector de carry e de overflow
	
	input   a0, a1, a2, a3, b0, b1, b2, b3;
	output s0, s1, s2, s3, OVR, CR;
	
	wire auxOVR;
	
		// instancia	
	soma_completa_4bit SOMA (s0, s1, s2, s3, CR, auxOVR, a0, a1, a2, a3, b0, b1, b2, b3);
	
	and AND1(OVR, auxOVR, CR);
	
endmodule // soma_ovr_cr


// ---------------------
// -- comparador logico
// ---------------------

module comparador_log (s, a0, a1, a2, a3, b0, b1, b2, b3);
	
		input a0, a1, a2, a3, b0, b1, b2, b3;
		output s;
		
		wire sa1, sa2, sa3, sa4;
		
		xor XOR1(sa1, a0, b0);
		xor XOR2(sa2, a1, b1);
		xor XOR3(sa3, a2, b2);
		xor XOR4(sa4, a3, b3);
		
		or OR1(s, sa1, sa2, sa3, sa4);
	
endmodule // comparador_log


// ---------------------
// -- complemento de 1
// ---------------------

module complemento_1 (s0, s1, s2, s3, a0, a1, a2, a3);
	
		input a0, a1, a2, a3;
		output s0, s1, s2, s3;
		
		not NOT1(s0, a0);
		not NOT2(s1, a1);
		not NOT3(s2, a2);
		not NOT4(s3, a3);
	
endmodule // complemento_1


// ---------------------
// -- complemento de 2
// ---------------------

module complemento_2 (s0, s1, s2, s3, a0, a1, a2, a3);
	
		input a0, a1, a2, a3;
		output s0, s1, s2, s3;
		
		wire sa0, sa1, sa2, sa3, CR, OVR;
		
		complemento_1 COMP1 (sa0, sa1, sa2, sa3, a0, a1, a2, a3);
		soma_ovr_cr SOMA1 (s0, s1, s2, s3, CR, OVR, sa0, sa1, sa2, sa3, 1, 0, 0, 0);
		
	
endmodule // complemento_2


// --------------
// -- teste de 0
// --------------

module zero (s, a, b);
	
		input [3:0] a, b;
		output s;

		nor N1(s, a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0]);
	
endmodule // zero


//----- meia diferenca
module meiaDiferenca(s0, s1, a, b);

	input a,b;
	output s0, s1;
	
	wire sa1;

	xor XOR1(s0, a, b);
	
	not NOT1(sa1, a);
	
	and AND1(s1, sa1, b);

endmodule //meiaDiferenca


//------ diferenca completa
module diferencaCompleta(s3, s5, a, b, c);

	input a, b, c;
	output s3, s5;
	wire s1, s0;

	meiaDiferenca MEIASUB1(s0, s1, a, b);
	meiaDiferenca MEIASUB2(s3, s4, s0, c);
	or OR1(s5, s1, s4);

endmodule //diferencaCompleta


// --------------
// -- subtrator
// --------------

module subtrator (s, a, b);
	
		input [3:0] a, b;
		output [4:0] s;

		wire st1, st2, st3;

	diferencaCompleta D1(s[0], st1, a[0], b[0], 0);
	diferencaCompleta D2(s[1], st2, a[1], b[1], st1);
	diferencaCompleta D3(s[2], st3, a[2], b[2], st2);
	diferencaCompleta D4(s[3], s[4], a[3], b[3], st3);
	
endmodule // subtrator


// ---------------------
// -- decremento de 1
// ---------------------

module decremento (s, a);
	
		input [3:0] a;
		output [4:0] s;

		reg [3:0] b;
		
		initial begin:start
			b=1;
		end
		
		subtrator SUB1 (s, a, b);
		
	
endmodule // decremento


// ---------------------
// -- incremento de 1
// ---------------------

module incremento (s0, s1, s2, s3, a0, a1, a2, a3);
	
		input a0, a1, a2, a3;
		output s0, s1, s2, s3;
		
		wire CR, OVR;
		
		soma_ovr_cr SOMA1 (s0, s1, s2, s3, CR, OVR, a0, a1, a2, a3, 1, 0, 0, 0);
		
	
endmodule // incremento


// ---------------------
// -- produto por 2
// ---------------------

module produto (s, erro, x);
	
		input [3:0] x;
		output [3:0] s;
		output erro;

			assign s[0] = 0;
			assign s[1] = x[0];
			assign s[2] = x[1];
			assign s[3] = x[2];
		
		xor XOR1 (erro, x[3], x[2]);
		
	
endmodule // produto


// ---------------------
// -- guia 06 teste
// ---------------------


module teste_guia_07;

	reg [3:0] a, b;
	
	wire [3:0] s, sA, sB, comp2A, comp2B, increA, increB, prodA, prodB;
	wire [4:0] sS, decreA, decreB;
	wire cr, ovr, sL, zero, zeroSoma, zeroSub, erroA, erroB;
	
	
		// instancia	
	soma_ovr_cr SOMA (s[0], s[1], s[2], s[3], cr, ovr, a[0], a[1], a[2], a[3], b[0], b[1], b[2], b[3]);
	
	comparador_log COMPA1 (sL, a[0], a[1], a[2], a[3], b[0], b[1], b[2], b[3]);
	
	complemento_1 COMP1 (sA[0], sA[1], sA[2], sA[3], a[0], a[1], a[2], a[3]);
	complemento_1 COMP2 (sB[0], sB[1], sB[2], sB[3], b[0], b[1], b[2], b[3]);
	
	zero ZERO1 (zero, a, b);
	
	subtrator SUB (sS, a, b);
	
	complemento_2 COMPA (comp2A[0], comp2A[1], comp2A[2], comp2A[3], a[0], a[1], a[2], a[3]);
	complemento_2 COMPB (comp2B[0], comp2B[1], comp2B[2], comp2B[3], b[0], b[1], b[2], b[3]);
	
	decremento DECA (decreA, a);
	decremento DECB (decreB, b);
	
	incremento INCA(increA[0], increA[1], increA[2], increA[3], a[0], a[1], a[2], a[3]);
	incremento INCB(increB[0], increB[1], increB[2], increB[3], b[0], b[1], b[2], b[3]);
	
	produto PRODA (prodA, erroA, a);
	produto PRODB (prodB, erroB, b);
	
	nor ZEROSOMA (zeroSoma, s[0], s[1], s[2], s[3]);
	nor ZEROSUB (zeroSub, sS[0], sS[1], sS[2], sS[3]);

	initial begin:start
		a=0; b=0;
	end
	

		// parte principal
	initial begin:main
	
		$display("Guia 07 - Mariana Ramos de Brito - 405820");
		$monitor("\n\nA = %4b\nB = %4b \nDiferente: %b\nSomado: %b%b%b%b\nA ou B zero: %b\nZero na soma: %b\nZero na subtracao: %b\nOverFlow: %b\nCarry: %b\nComplemento de 1 de A: %4b\nComplemento de 1 de B: %4b\nSubtraido: %b%b%b%b\nA < B: %b\nComplemento de 2 de A: %b\nComplemento de 2 de B: %b\nIncremento de 1 de A: %b\nIncremento de 1 de B: %b\nDecremento de 1 de A: %b%b%b%b\nDecremento de 1 de B: %b%b%b%b\nProduto por 2 de A: %b\tErro do produto de A: %b\nProduto por 2 de B: %b\tErro do produto de B: %b",a , b, sL, s[3], s[2], s[1], s[0], zero, zeroSoma, zeroSub, ovr, cr, sA, sB, sS[3], sS[2], sS[1], sS[0], sS[4], comp2A, comp2B, increA, increB, decreA[3], decreA[2], decreA[1], decreA[0], decreB[3], decreB[2], decreB[1], decreB[0], prodA, erroA, prodB, erroB);


		#1 a=1; b=0;
		#1 a=2; b=0;
		#1 a=3; b=0;
		#1 a=4; b=0;
		#1 a=5; b=0;
		#1 a=6; b=0;
		#1 a=7; b=0;
		#1 a=-1; b=0;
		#1 a=-2; b=0;
		#1 a=-3; b=0;
		#1 a=-4; b=0;
		#1 a=-5; b=0;
		#1 a=-6; b=0;
		#1 a=-7; b=0;
		#1 a=-8; b=0;

		#1 a=0; b=1;
		#1 a=1; b=1;
		#1 a=2; b=1;
		#1 a=3; b=1;
		#1 a=4; b=1;
		#1 a=5; b=1;
		#1 a=6; b=1;
		#1 a=7; b=1;
		#1 a=-1; b=1;
		#1 a=-2; b=1;
		#1 a=-3; b=1;
		#1 a=-4; b=1;
		#1 a=-5; b=1;
		#1 a=-6; b=1;
		#1 a=-7; b=1;
		#1 a=-8; b=1;

		#1 a=0; b=2;
		#1 a=1; b=2;
		#1 a=2; b=2;
		#1 a=3; b=2;
		#1 a=4; b=2;
		#1 a=5; b=2;
		#1 a=6; b=2;
		#1 a=7; b=2;
		#1 a=-1; b=2;
		#1 a=-2; b=2;
		#1 a=-3; b=2;
		#1 a=-4; b=2;
		#1 a=-5; b=2;
		#1 a=-6; b=2;
		#1 a=-7; b=2;
		#1 a=-8; b=2;
		
		#1 a=0; b=3;
		#1 a=1; b=3;
		#1 a=2; b=3;
		#1 a=3; b=3;
		#1 a=4; b=3;
		#1 a=5; b=3;
		#1 a=6; b=3;
		#1 a=7; b=3;
		#1 a=-1; b=3;
		#1 a=-2; b=3;
		#1 a=-3; b=3;
		#1 a=-4; b=3;
		#1 a=-5; b=3;
		#1 a=-6; b=3;
		#1 a=-7; b=3;
		#1 a=-8; b=3;
		
		//----e assim por diante, ate b=7
		
		#1 a=0; b=-1;
		#1 a=1; b=-1;
		#1 a=2; b=-1;
		#1 a=3; b=-1;
		#1 a=4; b=-1;
		#1 a=5; b=-1;
		#1 a=6; b=-1;
		#1 a=7; b=-1;
		#1 a=-1; b=-1;
		#1 a=-2; b=-1;
		#1 a=-3; b=-1;
		#1 a=-4; b=-1;
		#1 a=-5; b=-1;
		#1 a=-6; b=-1;
		#1 a=-7; b=-1;
		#1 a=-8; b=-1;
		
		//----e assim por diante, ate b=-8
				
	end

endmodule // guia_06
