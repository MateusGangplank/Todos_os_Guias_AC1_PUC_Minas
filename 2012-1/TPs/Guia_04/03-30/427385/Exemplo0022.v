// ------------------------- 
// Exemplo0022 - SUBTRATOR COMPLETO
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// ------------------------- 

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
module subtrator_completo2 (output [3:0]saida, output carryOut,
									input [3:0]a, input [3:0]b, input carryIn);
	
	wire [2:0]s;
	
	subtrator_completo SC1 (saida[0], s[0], a[0], b[0], carryIn);
	subtrator_completo SC2 (saida[1], s[1], a[1], b[1], s[0]);
	subtrator_completo SC3 (saida[2], s[2], a[2], b[2], s[1]);
	subtrator_completo SC4 (saida[3], carryOut, a[3], b[3], s[2]);
	
endmodule // -- subtrator_completo 2

// -------------------------
// --- modulo de teste
// -------------------------
module test_subtrator_completo2;

	reg  [3:0] x;
	reg  [3:0] y;
	reg  cIn;
	
	wire [3:0] z;
	wire cOut;
	
	subtrator_completo2 modulo (z, cOut, x, y, cIn);
	
	// --- parte principal
	initial begin
		$display("Exemplo0022 - Ana Cristina Pereira Teixeira(427385)");
		$display("Test ALU's subtrator completo \n");
		
		$display("x - y - carryIn\t = carryOut  saida \n");
		
		#1 x = 4'b0001; y = 4'b0010; cIn = 0;
		$monitor("%4b - %4b - %b\t = %b\t %4b", x, y, cIn, cOut, z);
		
		#1 x = 4'b0001; y = 4'b0010; cIn = 1;
		
		#1 x = 4'b1010; y = 4'b1100; cIn = 0;
		#1 x = 4'b1010; y = 4'b1100; cIn = 1;
		
		#1 x = 4'b1110; y = 4'b0110; cIn = 0;
		#1 x = 4'b1110; y = 4'b0110; cIn = 1;
		
		#1 x = 4'b0100; y = 4'b0011; cIn = 0;
		#1 x = 4'b0100; y = 4'b0011; cIn = 1;
		
	end

endmodule // -- test_subtrator_completo2
// --- previsao de testes
// -- x - y - carryIn	 = carryOut  saida
// --
// -- 0001 - 0010 - 0	 = 1	 1111
// -- 0001 - 0010 - 1	 = 1	 1110
// -- 1010 - 1100 - 0	 = 1	 1110
// -- 1010 - 1100 - 1	 = 1	 1101
// -- 1110 - 0110 - 0	 = 0	 1000
// -- 1110 - 0110 - 1	 = 0	 0111
// -- 0100 - 0011 - 0	 = 0	 0001
// -- 0100 - 0011 - 1	 = 0	 0000