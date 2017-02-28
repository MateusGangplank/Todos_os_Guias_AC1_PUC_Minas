// ----------------------------------------------
// -- Exemplo0026 SOMADOR ALGEBRICO
// -- Alexandre Palmieri Sad
// -- 440265
// ----------------------------------------------

// ----------------------------------------------
// -- COMPARADOR DE 2 BITS IGUAIS
// ----------------------------------------------
module comparador2BitsIguais(s, a, b, c, d);
	output s;
	input a;
	input b;
	input c;
	input d;
	
	wire x0, x1;
	
	xnor A(x0, a, b);
	xnor B(x1, c, d);
	and  C(s, x0, x1);

endmodule // -- fim modulo

// ----------------------------------------------
// -- COMPARADOR DE 4 BITS IGUAIS
// ----------------------------------------------
module comparador4BitsIguais(s, a, b);
	output s;
	input  [3:0]a;
	input  [3:0]b;
	
	wire x0, x1;
	
	comparador2BitsIguais A(x0, b[0], 
										a[0], b[1], a[1]);
	comparador2BitsIguais B(x1, b[2], 
										a[2], b[3], a[3]);
							and C(s, x0, x1);
endmodule // -- fim modulo

// ----------------------------------------------
// -- COMPARADOR DE 2 BITS DIFERENTES
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
endmodule // -- fim modulo

// ----------------------------------------------
// -- COMPARADOR DE 4 BITS DIFERENTES
// ----------------------------------------------
module comparador4BitsDifere(s, a, b);
	output s;
	input  [3:0]a;
	input  [3:0]b;
	
	wire s0, s1;
	
	comparador2Bits A(s0, a[3], a[2], b[3], b[2]);
	comparador2Bits B(s1, a[1], a[0], b[1], b[0]);
	or					 C(s, s0, s1);
endmodule // -- fim modulo

// ----------------------------------------------
// -- SWITCH DE 2 BITS
// ----------------------------------------------
module switch(s, a, b, sw);
	output s;
	input  a;
	input  b;
	input sw;
	
	wire x0, y1, y0;
	
	and A(y1, a, sw);
	not N(x0, sw);
	and B(y0, b, x0);
	or  C(s, y0, y1);
endmodule

// ----------------------------------------------
// -- COMPARADOR DE BITS IGUAIS E DIFERENTES
// ----------------------------------------------
module IgualDiferente(s, a, b, sw);
	output 		s;
	input  [3:0]a;
	input  [3:0]b;
	input      sw;
	
	wire x0, x1;
	comparador4BitsIguais A(x0, a, b);
	comparador4BitsDifere B(x1, a, b);
	switch 				  MUX(s, x1, x0, sw);
endmodule

// ----------------------------------------------
// -- MODULO DE TESTES
// ----------------------------------------------
module teste;
	reg  [3:0]a;
	reg  [3:0]b;
	reg 		sw;
	wire s;
	
	IgualDiferente C(s, a, b, sw);
	
	initial begin:start
		a  = 4'b0000;
		b  = 4'b0000;
		sw = 0;
	end
	
	initial begin
		$display("-------------------------------");
		$display("Comaparador de Bits");
		$display("Alexandre Palmieri Sad - 440265");
		$display("-------------------------------");
		$display("IUGAIS:");
		$monitor("\t%4b == %4b -> %b", a, b, s);
		
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
		
		sw = 1;
		$display("-------------------------------");
		$display("DIFERENTES:");
		$monitor("\t%4b != %4b -> %b", a, b, s);
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