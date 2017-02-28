// ------------------------- 
// Exemplo0025 - COMPLEMENTO DE 2
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// ------------------------- 

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
module C2 (output [3:0]saida, output carryOut, input [3:0]a, input carryIn);

	wire [3:0]saida_not;
	wire [2:0]s;
	
	not NOT1 (saida_not[0], a[0]);
	not NOT2 (saida_not[1], a[1]);
	not NOT3 (saida_not[2], a[2]);
	not NOT4 (saida_not[3], a[3]);
	
	halfAdder HA1 (saida[0], s[0], saida_not[0], carryIn);
	halfAdder HA2 (saida[1], s[1], saida_not[1], s[0]);
	halfAdder HA3 (saida[2], s[2], saida_not[2], s[1]);
	halfAdder HA4 (saida[3], carryOut, saida_not[3], s[2]);
	
endmodule // -- C2

// ------------------------- 
// --- modulo de teste
// ------------------------- 
module test_C2;
	
	reg  [3:0]x;
	reg cIn;
	
	wire [3:0]z;
	wire cOut;
	
	C2 modulo (z, cOut, x, cIn);
	
	// --- parte principal
	initial begin
		$display("Exemplo0025 - Ana Cristina Pereira Teixeira(427385)");
		$display("Test ALU's complemento de 2 \n");
		
		$display("x  --->  saida \n");
		#1 x = 4'b0001; cIn = 1;
		$monitor("%4b  ---> %b %4b", x, cOut, z);
		
		#1 x = 4'b1010;
		#1 x = 4'b1110;
		#1 x = 4'b0100;
		#1 x = 4'b0011;
		#1 x = 4'b0000;
		#1 x = 4'b1011;
	
	end
	
endmodule // -- C2
// --- previsao de testes
// -- x  --->  saida
// --
// -- 0001  ---> 0 1111
// -- 1010  ---> 0 0110
// -- 1110  ---> 0 0010
// -- 0100  ---> 0 1100
// -- 0011  ---> 0 1101
// -- 0000  ---> 1 0000
// -- 1011  ---> 0 0101