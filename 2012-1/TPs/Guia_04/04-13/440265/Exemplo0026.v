// ----------------------------------------------
// -- Exemplo0026 SOMADOR ALGEBRICO
// -- Alexandre Palmieri Sad
// -- 440265
// ----------------------------------------------
// ----------------------------------------------
// -- COMPLEMENTO DE 1 COM 4 BITS
// ----------------------------------------------
module comp1(s, a);
	output [3:0]s;
	input  [3:0]a;

	not A(s[0], a[0]);
	not B(s[1], a[1]);
	not C(s[2], a[2]);
	not D(s[3], a[3]);
endmodule

// ----------------------------------------------
// -- SOMA 1 A SAIDA DO CIRCUITO
// ----------------------------------------------
module somadorDe1(s, c, a);
	output s;
	output c;
	input  a;
	
	wire x1, x2;
	
	not N(x1, a);
	or  C(x2, x1, a);
	and A(c, x2, a);
	xor B(s, x2, a);
endmodule
// ----------------------------------------------
// -- HALF ADDER CONVENCIONAL
// ----------------------------------------------
module halfAdder(s, c, a, b);
	output s;
	output c;
	input  a;
	input  b;
	
	and A(c, a, b);
	xor B(s, a, b);
endmodule
// ----------------------------------------------
// -- COMPLEMENTO DE 2 COM 4 BITS
// ----------------------------------------------
module comp2(s, co, a);
	 output [3:0]s;
	 output  	co;
	 input  [3:0]a;
	 
	 wire [3:0]x;
	 wire [2:0]c;
	 comp1 COMP1(x, a);
	 somadorDe1 		  ADD  (s[0], c[0], x[0]);
	 halfAdder					A(s[1], c[1], x[1], c[0]);
	 halfAdder					B(s[2], c[2], x[2], c[1]);
	 halfAdder					C(s[3],   co, x[3], c[2]);
endmodule

// ---------------------------
// -- HALF ADDER
// ---------------------------
module halfAdder2(output s,
					  output carryOut,
						input a,
						input carryIn);
	xor A(carryOut, carryIn, a);
	and B(s, a, carryIn);
endmodule

// ---------------------------
// -- FULL ADDER
// ---------------------------
module fullAdder2(output s,
					  output carryOut,
					  input carryIn,
					  input a,
					  input b);
	
	wire c0, s0, s1;
	halfAdder2 A(s0, c0, a, carryIn);
	halfAdder2 B(s1, s, b, c0 );
	or 		 C(carryOut, s0, s1);
endmodule

// ---------------------------
// -- FULL ADDER 4Bits
// ---------------------------
module fullAdder4B(output [3:0]s,
						 output co,
							input[3:0]a,
							input[3:0]b,
							input ci);
	wire [2:0]c;
	fullAdder2 A(s[0], c[0], ci, b[0], a[0]);
	fullAdder2 B(s[1], c[1], c[0], a[1], b[1]);
	fullAdder2 C(s[2], c[2], c[1], a[2], b[2]);
	fullAdder2 D(s[3],   co, c[2], a[3], b[3]);

endmodule

// ----------------------------------------------
// -- Switch_2op_4Bits
// ----------------------------------------------
module switch(s, a , b, sw);
	output [3:0]s;
	input  [3:0]a;
	input  [3:0]b;
	input 	  sw;
	
	wire x0, x1, x2, x3;
	wire y0, y1, y2, y3, y4, y5, y6, y7;
	
	not N0(x0, sw);
	not N1(x1, sw);
	not N2(x2, sw);
	not N3(x3, sw);
	and  A(y0, x0, a[3]);
	and  B(y1, sw, b[3]);
	and  C(y2, x1, a[2]);
	and  D(y3, sw, b[2]);
	and  E(y4, x2, a[1]);
	and  F(y5, sw, b[1]);
	and  G(y6, x3, a[0]);
	and  H(y7, sw, b[0]);
	or	  I(s[3], y0, y1);
	or   J(s[2], y2, y3);
	or   K(s[1], y4, y5);
	or   L(s[0], y6, y7);
endmodule // -- fim modulo

// ----------------------------------------------
// -- ZERADOR DE BITS
// ----------------------------------------------
module zerador(s, a);
	output s;
	input  a;
	
	wire x;
	
	not N(x, a);
	and A(s, x, a);
endmodule // -- fim modulo

// ----------------------------------------------
// -- SOMADOR ALGEBRICO PARA 4 BITS
// ----------------------------------------------
module somadorAlgebrico(s, co, a, b, sw);
// -- Variaveis de entrada do modulo
	output [3:0]s;
	output 	  co;
	input  [3:0]a;
	input  [3:0]b;
	input  	  sw;

// -- conexoes auxiliares
	wire  [3:0]scomp;
	wire  [3:0]smux4;
	wire	bdC2;
	wire  cOut;
	wire  cIn;
	wire 	x;
// -- circuitos do modulo
	comp2 		COMP2(scomp, co, b);
	zerador		ZBIT1(x, bdC2); 	
	switch		MUX4B(smux4, b, scomp, sw);
	zerador		ZBIT2(cIn, sw);
	fullAdder4B ADDER(s, cOut, a, smux4, cIn);	
endmodule // -- fim modulo


// ----------------------------------------------
// -- MODULO DE TESTES
// ----------------------------------------------
module somadorAlegebricoTeste;
	reg  [3:0]a;
	reg  [3:0]b;
	reg 		sw;
	wire 		co;
	wire [3:0]s;
	
	
	somadorAlgebrico A(s, co, a, b, sw);
	
	initial begin:start
		a  = 4'b0000;
		b  = 4'b0000;
		sw = 0;
	end
	
	initial begin
		$display("-------------------------------");
		$display("Exemplo0026 - SOMADOR ALGEBRICO");
		$display("Alexandre Palmieri Sad - 440265");
		$display("-------------------------------");
		
		$monitor("\t%4b + %4b = %4b", a, b, s);
		
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
	#1
		sw = 1;
	$display("-------------------------------");
	$monitor("\t%4b - %4b = %4b", a, b, s);
// -- teste com o switch para subtracao
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


