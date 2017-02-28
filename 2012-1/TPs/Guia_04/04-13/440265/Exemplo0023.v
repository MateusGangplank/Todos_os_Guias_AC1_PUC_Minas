// ---------------------------
// -- Exemplo0023 IGUALDADE
// -- Alexandre Palmieri Sad
// -- 440265
// ---------------------------

// ----------------------------------------------
// -- Exemplo0023 IGUALDADE
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
// -- MODULO TESTADOR
// ----------------------------------------------
module testeBitsIguais;
	reg  [3:0]a;
	reg  [3:0]b;
	wire s;
	
	comparador4BitsIguais C(s, a, b);
	
	initial begin:start
		a = 4'b0000;
		b = 4'b0000;
	end
	
	initial begin
		$display("Comaparador de Bits Iguais");
		$display("Alexandre Palmieri Sad - 440265");
		$display("Legenda:");
		$display("1 - iguais");
		$display("0 - Diferentes");
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
endmodule //-- fim modulo teste