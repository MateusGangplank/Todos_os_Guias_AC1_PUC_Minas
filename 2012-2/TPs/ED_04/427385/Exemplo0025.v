// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0025 - Complemento de 2
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// -------------------------
// --- HalfAdder
// -------------------------
module halfAdder (output saida, output carryOut, input a, input b);
	
	xor XOR1 (saida, a, b);
	and AND1 (carryOut, a, b);

endmodule // halfAdder

// -------------------------
// --- Complemento de 2
// -------------------------
module C2 (output [2:0]saida, output carryOut, input [2:0]a, input carryIn);

	wire [2:0]saida_not;
	wire [2:0]s;
	
	not NOT1 (saida_not[0], a[0]);
	not NOT2 (saida_not[1], a[1]);
	not NOT3 (saida_not[2], a[2]);

	halfAdder HA1 (saida[0], s[0], saida_not[0], carryIn);
	halfAdder HA2 (saida[1], s[1], saida_not[1], s[0]);
	halfAdder HA4 (saida[2], carryOut, saida_not[2], s[1]);
	
endmodule // -- C2

// ------------------------- 
// --- modulo de teste
// ------------------------- 
module test_C2;
	
	reg  [2:0]x;
	reg cIn;
	
	wire [2:0]z;
	wire cOut;
	
	C2 modulo (z, cOut, x, cIn);
	
	// --- parte principal
	initial begin
		$display("Exemplo0025 - Guia04 - Ana Cristina - 427385");
		$display("Test ALU's complemento de 2 \n");
		
		$display("x  -->  saida \n");
		#1 x = 3'b001; cIn = 1;
		$monitor("%3b  --> %b %3b", x, cOut, z);
		
		#1 x = 3'b101;
		#1 x = 3'b111;
		#1 x = 3'b010;
		#1 x = 3'b011;
		#1 x = 3'b000;
		#1 x = 3'b100;
	
	end
	
endmodule // -- C2
// --- previsao de testes
// -- x  -->  saida
// -- 
// -- 001  --> 0 111
// -- 101  --> 0 011
// -- 111  --> 0 001
// -- 010  --> 0 110
// -- 011  --> 0 101
// -- 000  --> 1 000
// -- 100  --> 0 100