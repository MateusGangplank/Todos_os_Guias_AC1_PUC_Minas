// ---------------------------
// -- Exemplo0025 COMPLEMENTO DE 2
// -- Alexandre Palmieri Sad
// -- 440265
// ---------------------------

// ----------------------------------------------
// -- Exemplo0024 DIFERENCA
// ----------------------------------------------

// ----------------------------------------------
// -- COMPLEMENTO DE 1 COM 4 BITS
// ----------------------------------------------
module complemento1_4Bits(s, a);
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
module complemento2_4Bits(s, co, a);
	 output [3:0]s;
	 output  	co;
	 input  [3:0]a;
	 
	 wire [3:0]x;
	 wire [2:0]c;
	 complemento1_4Bits COMP1(x, a);
	 somadorDe1 		  ADD  (s[0], c[0], x[0]);
	 halfAdder					A(s[1], c[1], x[1], c[0]);
	 halfAdder					B(s[2], c[2], x[2], c[1]);
	 halfAdder					C(s[3],   co, x[3], c[2]);
endmodule

// ----------------------------------------------
// -- MODULO DE TESTES
// ----------------------------------------------
module testeComplemento2_4Bits;
	reg  [3:0]a;
	wire 		co;
	wire [3:0]s;
	
	complemento2_4Bits C(s, co, a);
	
	initial begin:start
		a = 4'b0000;
	end
	
	initial begin
		$display("Complemento de 2");
		$display("Alexandre Palmieri Sad - 440265");
		$display("-------------------------");
		
		$monitor("%4b comp2 %4b", a, s);
		
	#1
		a = 4'b0001; 
	#1
		a = 4'b0010; 	
	#1
		a = 4'b0011; 
	#1
		a = 4'b0100;
	#1
		a = 4'b0101;
	#1
		a = 4'b0110;
	#1
		a = 4'b0111; 
	#1
		a = 4'b1000; 
	#1
		a = 4'b1001; 	
	#1
		a = 4'b1010; 
	#1
		a = 4'b1011; 	
	#1
		a = 4'b1100;
	#1
		a = 4'b1101; 
	#1
		a = 4'b1110;
	#1
		a = 4'b1111; 		
	end
endmodule


