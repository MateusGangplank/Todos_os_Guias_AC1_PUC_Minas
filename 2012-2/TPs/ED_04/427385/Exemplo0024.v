// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0024 - Comparador
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// ------------------------- 
// --- diferenca
// ------------------------- 
module diferenca (output saida, input [2:0]a, input [2:0]b);
	
	wire [3:0]s;
	
	xor XOR1 (s[0], a[0], b[0]);
	xor XOR2 (s[1], a[1], b[1]);
	xor XOR3 (s[2], a[2], b[2]);
	
	or OR1 (saida, s[0], s[1], s[2]);

endmodule // -- diferenca

// ------------------------- 
// --- modulo de teste
// ------------------------- 
module test_diferenca;
	
	reg  [2:0] x;
	reg  [2:0] y;
	
	wire z;
	
	diferenca modulo (z, x, y);
	
	// --- parte principal
	initial begin
		$display("Exemplo0024 - Guia04 - Ana Cristina - 427385");
		$display("Test ALU's comparador para diferença \n");
		
		$display("x =! y -->  saida \n");
		#1 x = 3'b001; y = 3'b010;
		$monitor("%3b =! %3b --> %3b", x, y, z);
		
		#1 x = 3'b101; y = 3'b110;
		
		#1 x = 3'b111; y = 3'b111;
		#1 x = 3'b010; y = 3'b011;
		#1 x = 3'b011; y = 3'b101;
		#1 x = 3'b000; y = 3'b111;
		#1 x = 3'b101; y = 3'b101;
		
	end
	
endmodule // -- diferenca
// --- previsao de testes
// -- x =! y -->  saida
// -- 
// -- 001 =! 010 -->   1
// -- 101 =! 110 -->   1
// -- 111 =! 111 -->   0
// -- 010 =! 011 -->   1
// -- 011 =! 101 -->   1
// -- 000 =! 111 -->   1
// -- 101 =! 101 -->   0