// ---------------------------
// -- Exemplo0022 FULL SUBTRACTOR
// -- Alexandre Palmieri Sad
// -- 440265
// ---------------------------

// -------------------------------------------------
// -- Exemplo0022 Subtrator de 4 bits
// -------------------------------------------------

// -------------------------------------------------
// -- HALF SUBTRACTOR
// -------------------------------------------------
module halfSubtractor(co, s0, a, c);
	output co;
	output s0;
	input   a;
	input   c;
	wire x1;
	xor A(s0, a, c);
	not N1(x1, a);
	and B(co, x1, c);
endmodule

// -------------------------------------------------
// -- FULL SUBTRACTOR
// -------------------------------------------------
module fullSubtractor(co, s0, a, b, c);
	output s0;
	output co;
	input   a;
	input   b;
	input   c;
	
	wire x1, x2, x3;
	halfSubtractor A(x2, x1, a, b);
	halfSubtractor B(x3, s0, x1, c);
	or 				C(co, x3, x2);
endmodule


// -------------------------------------------------
// -- FULL SUBTRACTOR 4Bits
// -------------------------------------------------
module fullSubtractor4B(co, s, a, b, c);
	output [3:0]s;
	output co;
	input  [3:0]a;
	input  [3:0]b;
	input  c;
	
	wire	x1, x2, x3;
	fullSubtractor A(x1, s[0], a[0], b[0], c);
	fullSubtractor B(x2, s[1], a[1], b[1], x1);
	fullSubtractor C(x3, s[2], a[2], b[2], x2);
	fullSubtractor D(co, s[3], a[3], b[3], x3);
endmodule

// -------------------------------------------------
// -- teste
// -------------------------------------------------
module testemodules();
	reg 	[3:0]a;
	reg 	[3:0]b;
	reg 	c;
	wire	[3:0]s;
	wire	co;
	
	fullSubtractor4B A(co, s, a, b, c);
	
	initial begin:start
		a = 4'b0000;
		b = 4'b0000;
		c = 0;
	end
	
	initial begin
		$display("Subtrator completo");
		$monitor("%4b - %4b = %4b", 
					 a, b, s);			 
		a = 4'b0001; b = 4'b0001; c = 0;
	#1
		a = 4'b0010; b = 4'b0001; c = 0;
	#1
		a = 4'b1000; b = 4'b0001; c = 0;
	#1
		a = 4'b1000; b = 4'b0010; c = 0;
	#1
		a = 4'b1000; b = 4'b0011; c = 0;
	#1
		a = 4'b0000; b = 4'b0001; c = 0;	
	end
	
endmodule