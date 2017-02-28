// -------------------------
// Exemplo0023 - Igualdade
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída será um valor lógico indicando
// se as entradas (4 bits cada) são iguais.
// Teste 1:
// Entradas: [a = 0000 e b = 0000], [a = 1111 e b = 1111],
// [a = 0101 e b = 1111] e [a = 1010 e b = 0000]
// Observações da saída:
// Estes testes não são exaustivos pois não
// são testados todas as possíveis combinações
// de entrada, mas os testes que foram feitos
// deram certo.
// -------------------------
// igualdade
// -------------------------
module igualdade (output s,
           input [3:0] a, input [3:0] b);
	wire [3:0] intermediario;
	xnor N0 (intermediario[0], a[0], b[0]);
	xnor N1 (intermediario[1], a[1], b[1]);
	xnor N2 (intermediario[2], a[2], b[2]);
	xnor N3 (intermediario[3], a[3], b[3]);
	and N4 (s, intermediario[0], intermediario[1], intermediario[2], intermediario[3]);
endmodule // igualdade

module test_igualdade;
	// ------------------------- definir dados
	reg [3:0] x;
	reg [3:0] y;
	wire s;
	igualdade modulo (s, x, y);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0023 - Daniel Telles McGinnis - 435042");
		$display("Test LU's module");
		
		x = 4'b0000; y = 4'b0000;
		#1 $display("igualdade(%b, %b) = %b", x, y, s);
		
		x = 4'b1111; y = 4'b1111;
		#1 $display("igualdade(%b, %b) = %b", x, y, s);

		x = 4'b0101; y = 4'b1111;
		#1 $display("igualdade(%b, %b) = %b", x, y, s);

		x = 4'b1010; y = 4'b0000;
		#1 $display("igualdade(%b, %b) = %b", x, y, s);
	end
endmodule // test_igualdade