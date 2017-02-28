// ------------------------- 
// Exemplo0023 - COMPARADOR
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// ------------------------- 

// ------------------------- 
// --- igualdade
// ------------------------- 
module igualdade (output saida, input [3:0]a, input [3:0]b);
	
	wire [3:0]s;
	
	xnor XNOR1 (s[0], a[0], b[0]);
	xnor XNOR2 (s[1], a[1], b[1]);
	xnor XNOR3 (s[2], a[2], b[2]);
	xnor XNOR4 (s[3], a[3], b[3]);
	
	and AND1 (saida, s[0], s[1], s[2], s[3]);
	
endmodule // -- igualdade

// ------------------------- 
// --- modulo de teste
// ------------------------- 
module test_igualdade;
	
	reg  [3:0] x;
	reg  [3:0] y;
	
	wire z;
	
	igualdade modulo (z, x, y);
	
	// --- parte principal
	initial begin
		$display("Exemplo0023 - Ana Cristina Pereira Teixeira(427385)");
		$display("Test ALU's comparador para igualdade \n");
		
		$display("x == y --->  saida \n");
		#1 x = 4'b0001; y = 4'b0010;
		$monitor("%4b == %4b ---> %4b", x, y, z);

		#1 x = 4'b1010; y = 4'b1100;
		#1 x = 4'b1110; y = 4'b1110;
		#1 x = 4'b0100; y = 4'b0011;
		#1 x = 4'b0011; y = 4'b0101;
		#1 x = 4'b0000; y = 4'b1111;
		#1 x = 4'b1010; y = 4'b1010;
		
	end
	
endmodule // -- igualdade
// --- previsao de testes
// --
// -- x == y --->  saida
// --
// -- 0001 == 0010 --->    0
// -- 1010 == 1100 --->    0
// -- 1110 == 1110 --->    1
// -- 0100 == 0011 --->    0
// -- 0011 == 0101 --->    0
// -- 0000 == 1111 --->    0
// -- 1010 == 1010 --->    1