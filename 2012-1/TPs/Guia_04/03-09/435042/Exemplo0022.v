// -------------------------
// Exemplo0022 - Subtrator
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída será um valor de 4 bits
// igual à diferença dos dois
// operandos de 4 bits cada.
// Teste 1:
// Entradas: [a = 0000 e b = 0000], [a = 1111 e b = 1111],
// [a = 1010 e b = 1111], [a = 1010 e b = 1001] e [a = 1110 e b = 1111]
// Observações da saída:
// Estes testes não são exaustivos pois não
// são testados todas as possíveis combinações
// de entrada, mas os testes que foram feitos
// deram certo.
// -------------------------
// subtrator
// -------------------------
module halfDiff (output s0, output s1,
                  input a, input b);
	wire aNegado;
	not N0 (aNegado, a);
	xor N1 (s0, a, b);
	and N2 (s1, aNegado, b);
endmodule // halfDiff

module fullDiff (output s0, output s1,
                  input a, input b, input c);
	wire intermediario1;
	wire intermediario1negado;
	wire intermediario2;
	wire intermediario3;
	halfDiff N0 (intermediario1, intermediario2, a, b);
	xor N1 (s0, intermediario1, c);
	not N2 (intermediario1negado, intermediario1);
	and N3 (intermediario3, intermediario1negado, c);
	or N4 (s1, intermediario3, intermediario2);
endmodule // fullDiff

module circuito4bitDiff(output [3:0] s,
                 input [3:0] a, input [3:0] b);
	wire carry1;
	wire carry2;
	wire carry3;
	wire jogaFora;
	fullDiff N0 (s[0], carry1, a[0], b[0], 1'b0);
	fullDiff N1 (s[1], carry2, a[1], b[1], carry1);
	fullDiff N2 (s[2], carry3, a[2], b[2], carry2);
	fullDiff N3 (s[3], jogaFora, a[3], b[3], carry3);
endmodule // circuito4bitDiff

module test_4bitDiff;
	// ------------------------- definir dados
	reg [3:0] x;
	reg [3:0] y;
	wire [3:0] s;
	circuito4bitDiff modulo (s, x, y);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0022 - Daniel Telles McGinnis - 435042");
		$display("Test AU's module");
		
		x = 4'b0000; y = 4'b0000;
		#1 $display("%b - %b = %b", x, y, s);
		
		x = 4'b1111; y = 4'b1111;
		#1 $display("%b - %b = %b", x, y, s);

		x = 4'b1010; y = 4'b1111;
		#1 $display("%b - %b = %b", x, y, s);

		x = 4'b1010; y = 4'b1001;
		#1 $display("%b - %b = %b", x, y, s);

		x = 4'b1110; y = 4'b1111;
		#1 $display("%b - %b = %b", x, y, s);
	end
endmodule // test_4bitDiff