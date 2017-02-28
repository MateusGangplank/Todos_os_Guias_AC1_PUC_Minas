// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0023 - Comparador
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385 

// ------------------------- 
// --- igualdade
// ------------------------- 
module igualdade (output saida, input [2:0]a, input [2:0]b);
	
	wire [2:0]s;
	
	xnor XNOR1 (s[0], a[0], b[0]);
	xnor XNOR2 (s[1], a[1], b[1]);
	xnor XNOR3 (s[2], a[2], b[2]);
	and AND1 (saida, s[0], s[1], s[2]);
	
endmodule // -- igualdade

// ------------------------- 
// --- modulo de teste
// ------------------------- 
module test_igualdade;
	
	reg  [2:0] x;
	reg  [2:0] y;
	
	wire z;
	
	igualdade modulo (z, x, y);
	
	// --- parte principal
	initial begin
		$display("Exemplo0023 - Guia04 - Ana Cristina - 427385");
		$display("Test ALU's comparador para igualdade \n");
		
		$display("x == y -->  saida \n");
		#1 x = 3'b001; y = 3'b010;
		$monitor("%3b == %3b --> %3b", x, y, z);

		#1 x = 3'b101; y = 3'b110;
		#1 x = 3'b111; y = 3'b111;
		#1 x = 3'b010; y = 3'b011;
		#1 x = 3'b011; y = 3'b101;
		#1 x = 3'b000; y = 3'b111;
		#1 x = 3'b101; y = 3'b101;
		
	end
	
endmodule // -- igualdade
// --- previsao de testes
// --
// -- x == y -->  saida
// -- 
// -- 001 == 010 -->   0
// -- 101 == 110 -->   0
// -- 111 == 111 -->   1
// -- 010 == 011 -->   0
// -- 011 == 101 -->   0
// -- 000 == 111 -->   0
// -- 101 == 101 -->   1