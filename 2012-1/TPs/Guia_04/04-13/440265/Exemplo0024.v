// ---------------------------
// -- Exemplo0024 DIFERENCA
// -- Alexandre Palmieri Sad
// -- 440265
// ---------------------------

// ----------------------------------------------
// -- Exemplo0024 DIFERENCA
// ----------------------------------------------

// ----------------------------------------------
// -- COMPARADOR DE 2 BITS
// ----------------------------------------------
module comparador2Bits(s, a, b, c, d);
	output s;
	input  a;
	input  b;
	input  c;
	input  d;
	
	wire x0, x1, x2, x3, x4, x5;
	wire y0, y1;
	wire s0, s1;

	xor 	A(x0, c, d);
	xnor 	B(x1, a, b);
	xnor 	C(x2, c, d);
	xor 	D(x3, a, b);
	xor 	E(x4, a, c);
	xor 	F(x5, b, d);
	and 	G(y0, x0, x1);
	and 	H(y1, x2, x3);
	and 	I(s0, x4, x5);
	or 	J(s1, y0, y1);
	or 	K(s, s1, s0);
endmodule

// ----------------------------------------------
// -- COMPARADOR DE 4 BITS
// ----------------------------------------------
module comparador4Bits(s, a, b);
	output s;
	input  [3:0]a;
	input  [3:0]b;
	
	wire s0, s1;
	
	comparador2Bits A(s0, a[3], a[2], b[3], b[2]);
	comparador2Bits B(s1, a[1], a[0], b[1], b[0]);
	or					 C(s, s0, s1);
endmodule

// ----------------------------------------------
// -- MODULO DE TESTES
// ----------------------------------------------
module testeDiferenca4Bits;
	reg  [3:0]a;
	reg  [3:0]b;
	wire s;
	
	comparador4Bits C(s, a, b);
	
	initial begin:start
		a = 4'b0000;
		b = 4'b0000;
	end
	
	initial begin
		$display("Comaparador de Bits Diferentes");
		$display("Alexandre Palmieri Sad - 440265");
		$display("Legenda:");
		$display("1 - Diferentes");
		$display("0 - Iguais");
		$display("-------------------------");
		
		$monitor("%4b == %4b -> %b", a, b, s);
		
	#1
		a = 4'b0001; b = 4'b0001;
	#1
		a = 4'b0001; b = 4'b0000;	
	#1
		a = 4'b0001; b = 4'b0010;
	#1
		a = 4'b0001; b = 4'b0011;
	#1
		a = 4'b0001; b = 4'b0100;
	#1
		a = 4'b0001; b = 4'b0101;
	#1
		a = 4'b0001; b = 4'b0110;
	#1
		a = 4'b0001; b = 4'b0111;
	#1
		a = 4'b0001; b = 4'b1000;
// -- 8		
	#1
		a = 4'b0010; b = 4'b0001;
	#1
		a = 4'b0010; b = 4'b0000;	
	#1
		a = 4'b0010; b = 4'b0010;
	#1
		a = 4'b0010; b = 4'b0011;
	#1
		a = 4'b0010; b = 4'b0100;
	#1
		a = 4'b0010; b = 4'b0101;
	#1
		a = 4'b0010; b = 4'b0110;
	#1
		a = 4'b0010; b = 4'b0111;
	#1
		a = 4'b0010; b = 4'b1000;
// -- 16		
	#1
		a = 4'b0011; b = 4'b0001;
	#1
		a = 4'b0011; b = 4'b0000;	
	#1
		a = 4'b0011; b = 4'b0010;
	#1
		a = 4'b0011; b = 4'b0011;
	#1
		a = 4'b0011; b = 4'b0100;
	#1
		a = 4'b0011; b = 4'b0101;
	#1
		a = 4'b0011; b = 4'b0110;
	#1
		a = 4'b0011; b = 4'b0111;
	#1
		a = 4'b0011; b = 4'b1000;
// -- 32		
	#1
		a = 4'b0100; b = 4'b0001;
	#1
		a = 4'b0100; b = 4'b0000;	
	#1
		a = 4'b0100; b = 4'b0010;
	#1
		a = 4'b0100; b = 4'b0011;
	#1
		a = 4'b0100; b = 4'b0100;
	#1
		a = 4'b0100; b = 4'b0101;
	#1
		a = 4'b0100; b = 4'b0110;
	#1
		a = 4'b0100; b = 4'b0111;
	#1
		a = 4'b0100; b = 4'b1000;
	#1
		a = 4'b1111; b = 4'b1111;		
	end
endmodule


