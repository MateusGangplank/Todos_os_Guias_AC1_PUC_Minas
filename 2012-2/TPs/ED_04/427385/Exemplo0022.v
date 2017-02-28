// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0022 - Subtrator Completo
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385 

// -------------------------
// --- meio subtrator
// -------------------------
module meio_subtrator (output saida, output carryOut, input a, input b);
	
	wire saida_not;
	
	not NOT1 (saida_not, a);
	
	xor XOR1 (saida, a, b);
	
	and AND1 (carryOut, saida_not, b);

endmodule // -- meio_subtrator

// -------------------------
// --- subtrator completo
// -------------------------
module subtrator_completo (output saida, output carryOut, input a, input b, input carryIn);
	
	wire [2:0]s;
	
	meio_subtrator MS1 (s[0], s[1], a, b);
	meio_subtrator MS2 (saida, s[2], s[0], carryIn);
	
	or OR1 (carryOut, s[1], s[2]);

endmodule // -- subtrator_completo

// -------------------------
// --- subtrator completo 2
// -------------------------
module subtrator_completo2 (output [2:0]saida, output carryOut, input [2:0]a, input [2:0]b, input carryIn);
	
	wire [2:0]s;
	
	subtrator_completo SC1 (saida[0], s[0], a[0], b[0], carryIn);
	subtrator_completo SC2 (saida[1], s[1], a[1], b[1], s[0]);
	subtrator_completo SC4 (saida[2], carryOut, a[2], b[2], s[1]);
	
endmodule // -- subtrator_completo 2

// -------------------------
// --- modulo de teste
// -------------------------
module test_subtrator_completo2;

	reg  [2:0] x;
	reg  [2:0] y;
	reg  cIn;
	
	wire [2:0] z;
	wire cOut;
	
	subtrator_completo2 modulo (z, cOut, x, y, cIn);
	
	// --- parte principal
	initial begin
		$display("Exemplo0022 - Guia04 - Ana Cristina - 427385");
		$display("Test ALU's subtrator completo \n");
		
		$display("x - y - carryIn\t = carryOut  saida \n");
		
		#1 x = 3'b001; y = 3'b010; cIn = 0;
		$monitor("%3b - %3b - %b = %b %3b", x, y, cIn, cOut, z);
		
		#1 x = 3'b001; y = 3'b010; cIn = 1;
		
		#1 x = 3'b101; y = 3'b110; cIn = 0;
		#1 x = 3'b101; y = 3'b110; cIn = 1;
		
		#1 x = 3'b111; y = 3'b110; cIn = 0;
		#1 x = 3'b111; y = 3'b110; cIn = 1;
		
		#1 x = 3'b100; y = 3'b011; cIn = 0;
		#1 x = 3'b100; y = 3'b011; cIn = 1;
		
	end

endmodule // -- test_subtrator_completo2
// --- previsao de testes
// -- x - y - carryIn	 = carryOut  saida
// -- 
// -- 001 - 010 - 0 = 1 111
// -- 001 - 010 - 1 = 1 110
// -- 101 - 110 - 0 = 1 111
// -- 101 - 110 - 1 = 1 110
// -- 111 - 110 - 0 = 0 001
// -- 111 - 110 - 1 = 0 000
// -- 100 - 011 - 0 = 0 001
// -- 100 - 011 - 1 = 0 000