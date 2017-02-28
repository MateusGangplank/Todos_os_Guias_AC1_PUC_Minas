// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0031 - ALU
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
// --- somadorAlgebrico
// -------------------------
module somadorAlgebrico (output [2:0]saida, output carryOut, input [2:0]a, input [2:0]b, input carryIn);
	
	wire [2:0]s;
	wire [2:0]s1;
	
	xor XOR1 ( s[0], b[0], carryIn);
	xor XOR2 ( s[1], b[1], carryIn);
	xor XOR3 ( s[2], b[2], carryIn);
	
	fullAdder FA1 (saida[0], s1[0], a[0], s[0], carryIn);
	fullAdder FA2 (saida[1], s1[1], a[1], s[1], s1[0]);
	fullAdder FA3 (saida[2], s1[2], a[2], s[2], s1[1]);
	
	xor XOR1 (carryOut, carryIn, s1[2]);
	
endmodule // -- somadorAlgebrico

// -------------------------
// --- modelo de teste
// -------------------------
module test_somadorAlgebrico;
	
	reg  [2:0] x;
	reg  [2:0] y;
	reg  cIn;
	
	wire [2:0] z;
	wire cOut;
	
	somadorAlgebrico modulo (z, cOut, x, y, cIn);
	
	// --- parte principal
	initial begin
		$display("Exemplo 0031 - Ana Cristina - 427385");
		$display("Test ALU Somador Algebrico \n");
		
		$display("Soma = carryIn = 0; Subtração = carryIn = 1 \n");
		
		$display("x  y ----> carryIn = carryOut  saida \n");
		#1 x = 3'b001; y = 3'b010; cIn = 0;
		$monitor("%3b	%3b ----> %b = %b %4b", x, y, cIn, cOut, z);
		
		#1 x = 3'b001; y = 3'b001; cIn = 1;
		#1 x = 3'b101; y = 3'b100; cIn = 0;
		#1 x = 3'b010; y = 3'b110; cIn = 1;
		#1 x = 3'b111; y = 3'b110; cIn = 0;
		#1 x = 3'b110; y = 3'b011; cIn = 1;
		#1 x = 3'b001; y = 3'b010; cIn = 0;
		#1 x = 3'b011; y = 3'b100; cIn = 1;
	end
endmodule
// -- test_somadorAlgebrico
// -- previsao de testes
// --
// -- Soma = carryIn = 0; Subtração = carryIn = 1
// --
// -- x  y ----> carryIn = carryOut  saida
// --
// -- 001	010 ----> 0 = 0  011
// -- 001	001 ----> 1 = 0  000
// -- 101	100 ----> 0 = 1  001
// -- 010	110 ----> 1 = 1  100
// -- 111	110 ----> 0 = 1  101
// -- 110	011 ----> 1 = 0  011
// -- 001	010 ----> 0 = 0  011
// -- 011	100 ----> 1 = 1  111