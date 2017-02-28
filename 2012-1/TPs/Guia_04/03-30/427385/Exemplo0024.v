// ------------------------- 
// Exemplo0024 - COMPARADOR
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// ------------------------- 

// ------------------------- 
// --- diferenca
// ------------------------- 
module diferenca (output saida, input [3:0]a, input [3:0]b);
	
	wire [3:0]s;
	
	xor XOR1 (s[0], a[0], b[0]);
	xor XOR2 (s[1], a[1], b[1]);
	xor XOR3 (s[2], a[2], b[2]);
	xor XOR4 (s[3], a[3], b[3]);
	
	or OR1 (saida, s[0], s[1], s[2], s[3]);

endmodule // -- diferenca

// ------------------------- 
// --- modulo de teste
// ------------------------- 
module test_diferenca;
	
	reg  [3:0] x;
	reg  [3:0] y;
	
	wire z;
	
	diferenca modulo (z, x, y);
	
	// --- parte principal
	initial begin
		$display("Exemplo0024 - Ana Cristina Pereira Teixeira(427385)");
		$display("Test ALU's comparador para diferença \n");
		
		$display("x =! y --->  saida \n");
		#1 x = 4'b0001; y = 4'b0010;
		$monitor("%4b =! %4b ---> %4b", x, y, z);
		
		#1 x = 4'b1010; y = 4'b1100;
		
		#1 x = 4'b1110; y = 4'b1110;
		#1 x = 4'b0100; y = 4'b0011;
		#1 x = 4'b0011; y = 4'b0101;
		#1 x = 4'b0000; y = 4'b1111;
		#1 x = 4'b1010; y = 4'b1010;
		
	end
	
endmodule // -- diferenca
// --- previsao de testes
// -- x =! y --->  saida
// --
// -- 0001 =! 0010 --->    1
// -- 1010 =! 1100 --->    1
// -- 1110 =! 1110 --->    0
// -- 0100 =! 0011 --->    1
// -- 0011 =! 0101 --->    1
// -- 0000 =! 1111 --->    1
// -- 1010 =! 1010 --->    0