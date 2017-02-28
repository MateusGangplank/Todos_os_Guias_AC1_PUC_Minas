// ------------------------- 
// Exemplo0033 - ALU
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// ------------------------- 

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
module fullAdder (output saida, output carryOut,
						input a, input b, input carryIn);

	wire [2:0]s;
	
	halfAdder HA1 (s[0], s[1], a, b);
	halfAdder HA2 (saida, s[2], s[0], carryIn);
	
	or OR1 (carryOut, s[1], s[2]);
	
endmodule // -- fullAdder

// -------------------------
// --- somador algebrico
// -------------------------
module somadorAlgebrico (output [3:0]saida, output carryOut,
								input [3:0]a, input [3:0]b, input carryIn);

	wire [3:0]s;
	wire [3:0]s1;
	wire x;
	
	xor XOR1 ( s[0], b[0], carryIn);
	xor XOR2 ( s[1], b[1], carryIn);
	xor XOR3 ( s[2], b[2], carryIn);
	xor XOR4 ( s[3], b[3], carryIn);
	
	fullAdder FA1 (saida[0], s1[0], a[0], s[0], 1);
	fullAdder FA2 (saida[1], s1[1], a[1], s[1], s1[0]);
	fullAdder FA3 (saida[2], s1[2], a[2], s[2], s1[1]);
	fullAdder FA4 (saida[3], s1[3], a[3], s[3], s1[2]);
	
	xor XOR1 (carryOut, carryIn, s1[3]);
	
endmodule // -- somadorAlgebrico

// -------------------------
// --- modulo de teste
// -------------------------
module test_somadorAlgebrico;
	
	reg  [3:0] x;
	reg  [3:0] y;
	reg  cIn;
	
	wire [3:0] z;
	wire cOut;
	
	somadorAlgebrico modulo (z, cOut, x, y, cIn);
	
	// --- parte principal
	initial begin
		$display("Exemplo0033 - Ana Cristina Pereira Teixeira(427385)");
		$display("Test ALU Somador Algebrico \n");
		
		$display("Soma = carryIn = 0; Subtração = carryIn = 1 \n");
		$display("x  y  +1 ----> carryIn = carryOut  saida \n");
		
		#1 x = 4'b0001; y = 4'b0010; cIn = 0;
		$monitor("%4b  %4b ----> %b = %b %4b ", x, y, cIn, cOut, z);
		
		#1 x = 4'b0001; y = 4'b0010; cIn = 1;
		#1 x = 4'b1010; y = 4'b1100; cIn = 0;
		#1 x = 4'b1010; y = 4'b1100; cIn = 1;
		#1 x = 4'b1110; y = 4'b0110; cIn = 0;
		#1 x = 4'b1110; y = 4'b0110; cIn = 1;
		#1 x = 4'b0001; y = 4'b0001; cIn = 0;
		#1 x = 4'b0001; y = 4'b0001; cIn = 1;
	
	end
	
endmodule // -- test_somadorAlgebrico
// --- previsao de testes
// -- Soma = carryIn = 0; Subtração = carryIn = 1
// --
// -- x  y  +1 ----> carryIn = carryOut  saida
// --
// -- 0001  0010 ----> 0 = 0 0100
// -- 0001  0010 ----> 1 = 1 1111
// -- 1010  1100 ----> 0 = 1 0111
// -- 1010  1100 ----> 1 = 1 1110
// -- 1110  0110 ----> 0 = 1 0101
// -- 1110  0110 ----> 1 = 0 1000
// -- 0001  0001 ----> 0 = 0 0011
// -- 0001  0001 ----> 1 = 0 0000