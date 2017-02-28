// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0035 - ALU
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// ------------------------- 
// -- comparador
// -------------------------
module comparador (output saida0, output saida1, input entrada1, input entrada2, input c0, input c1);

	wire a, b;
	wire [3:0] s0;
	
	not NOT1 (a, entrada1);
	not NOT2 (b, entrada2);
	
	and AND1 (s0[0], b, entrada1, c1);
	and AND2 (s0[1], b, a, c1);
	and AND3 (s0[2], entrada2, entrada1, c1);
	and AND4 (s0[3], c0, c1);
	
	or OR1 (saida0, c0, s0[0]);
	or OR2 (saida1, s0[1], s0[2], s0[3]);
	
endmodule // -- comparador

// ------------------------- 
// -- comparadorAlgebrico
// -------------------------
module comparadorAlgebrico (output maior, output menor, output igual, input [2:0]entrada1, input [2:0]entrada2);
	
	wire [2:0]s0;
	wire [2:0]s1;
	wire sinal_A, sinal_B;
	
	not NOT1 (sinal_A, entrada1[2]);
	not NOT2 (sinal_B, entrada2[2]);
	
	comparador COM1 ( s0[0], s1[0], sinal_A, sinal_B, 0, 1);
	comparador COM2 ( s0[1], s1[1], entrada1[2], entrada2[2], s0[0], s1[0]);
	comparador COM3 ( s0[2], s1[2], entrada1[1], entrada2[1], s0[1], s1[1]);
	comparador COM4 ( maior, igual, entrada1[0], entrada2[0], s0[2], s1[2]);
	
	xnor XOR1 (menor, maior, igual);
	
endmodule // --- comparadorAlgebrico

// -------------------------
// -- modulo de teste
// -------------------------
module test_comparadorAlgebrico;
	
	reg  [2:0] x;
	reg  [2:0] y;
	
	wire maior;
	wire menor;
	wire igual;
	
	comparadorAlgebrico modulo (maior, menor, igual, x, y);
	
	// --- parte principal
	initial begin
		$display("Exemplo 0035 - Ana Cristina - 427385");
		$display("Test ALU Comparador Algebrico \n");
		
		$display("x  y  ----> maior menor igual\n");
		
		#1 x = 3'b001; y = 3'b010;
		$monitor("%3b  %3b ----> %b  %b %b ", x, y, maior, menor, igual);
		#1 x = 3'b011; y = 3'b010;
		
		#1 x = 3'b010; y = 3'b110;
		#1 x = 3'b100; y = 3'b100;
		#1 x = 3'b110; y = 3'b011;
		#1 x = 3'b110; y = 3'b111;
	end
endmodule
// -- test_comparadorAlgebrico
// --- previsao de testes
// -- x  y  ----> maior menor igual
// --
// -- 001  010 ----> 0  1 0
// -- 011  010 ----> 1  0 0
// -- 010  110 ----> 1  0 0
// -- 100  100 ----> 0  0 1
// -- 110  011 ----> 0  1 0
// -- 110  111 ----> 0  1 0