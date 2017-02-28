// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0021
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385 

// ------------------------- 
// --- halfAdder
// ------------------------- 
module halfAdder (output saida, output carryOut, input a, input b);
	
	xor XOR1 (saida, a, b);
	and AND1 (carryOut, a, b);
	
endmodule // -- halfAdder

// ------------------------- 
// --- fullAdder
// ------------------------- 
module fullAdder (output saida, output carryOut, input a, input b, input carryIn);
	
	wire [2:0]s;
	
	halfAdder HA1 (s[0], s[1], a, b);
	halfAdder HA2 (saida, s[2], s[0], carryIn);
	
	or OR1 (carryOut, s[1], s[2]);

endmodule // -- fullAdder

// ------------------------- 
// --- fullAdder 2
// ------------------------- 
module fullAdder2 (output [2:0]saida, output carryOut, input [2:0]a, input [2:0]b, input carryIn);
	
	wire [2:0]s;
	
	fullAdder FA1 (saida[0], s[0], a[0], b[0], carryIn);
	fullAdder FA2 (saida[1], s[1], a[1], b[1], s[0]);
	fullAdder FA4 (saida[2], carryOut, a[2], b[2], s[1]);

endmodule // -- fullAdder 2

// ------------------------- 
// --- modulo de teste full adder 2
// -------------------------
module test_fullAdder2;
	
	reg  [2:0] x;
	reg  [2:0] y;
	reg  cIn;
	
	wire [2:0] z;
	wire cOut;
	
	fullAdder2 modulo (z, cOut, x, y, cIn);
	
	// --- parte principal
	initial begin
		$display("Exemplo0021 - Guia04 - Ana Cristina - 427385");
		$display("Test ALU's full adder \n");
		$display("x + y\t + carryIn\t = carryOut\t saida\n");
		
		#1 x = 3'b001; y = 3'b010; cIn = 0;
		$monitor("%3b + %3b + %b = %b %3b", x, y, cIn, cOut, z);
		
		#1 x = 3'b001; y = 3'b010; cIn = 1;
		
		#1 x = 3'b101; y = 3'b110; cIn = 0;
		#1 x = 3'b101; y = 3'b110; cIn = 1;
		
		#1 x = 3'b111; y = 3'b011; cIn = 0;
		#1 x = 3'b111; y = 3'b011; cIn = 1;
		
		#1 x = 3'b011; y = 3'b010; cIn = 0;
		#1 x = 3'b011; y = 3'b010; cIn = 1;
		
	end
	
endmodule // -- test_fullAdder2
// --- previsao de testes
// -- x + y	 + carryIn	 = carryOut	 saida
// --
// -- 001 +  010	 + 0	 = 0	  011
// -- 001 +  010	 + 1	 = 0	  100
// -- 101 +  110	 + 0	 = 1	  011
// -- 101 +  110	 + 1	 = 1	  100
// -- 111 +  011	 + 0	 = 1	  010
// -- 111 +  011	 + 1	 = 1	  011
// -- 011 +  010	 + 0	 = 0	  101
// -- 011 +  010	 + 1	 = 0	  110