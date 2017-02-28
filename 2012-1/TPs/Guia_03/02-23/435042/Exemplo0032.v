// -------------------------
// Exemplo0032 - OR e AND - 2 bits - Selecionável
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída serão as conjunções e as disjunções de cada bit dos
// dois operandos de 2 bits que servirem de entrada para subcircuito.
// Teste 1:
// Entradas: [a = 00 e b = 01], [a = 11 e b = 01], [primeiro: chave = 0, depois: chave = 1].
// Observações da saída:
// A saída são quatro linhas, duas para a conjunção feita bit a bit
// e outras duas para a disjunção feita bit a bit, como esperado.

module subcircuito (output [1:0] s,
                    input chave, input [1:0] a, input [1:0] b);
	wire [1:0] s_and;
	wire [1:0] s_or;
	wire chaveNegada;
	wire [1:0] intermedio1;
	wire [1:0] intermedio2;

	or D0 (s_or[0], a[0], b[0]);
	or D1 (s_or[1], a[1], b[1]);

	and A0 (s_and[0], a[0], b[0]);
	and A1 (s_and[1], a[1], b[1]);

	not S0 (chaveNegada, chave);

	and S1 (intermedio1[0], s_or[0], chaveNegada);
	and S2 (intermedio2[0], s_and[0], chave);
	or S3 (s[0], intermedio1[0], intermedio2[0]);
	
	and S4 (intermedio1[1], s_or[1], chaveNegada);
	and S5 (intermedio2[1], s_and[1], chave);
	or S6 (s[1], intermedio1[1], intermedio2[1]);

endmodule // subcircuito

module test_subcircuito;
	// ------------------------- definir dados
	reg chave;
	reg [1:0] x;
	reg [1:0] y;
	wire [1:0] s;
	subcircuito modulo (s, chave, x, y);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0032 - Daniel Telles McGinnis - 435042");
		$display("Test LU's module\n");
		chave = 0;
		x = 2'b00;
		y = 2'b01;
		#1 $display("chave = 0,  or(%b, %b) = %b", x, y, s);
		x = 2'b11;
		y = 2'b01;
		#1 $display("chave = 0,  or(%b, %b) = %b\n", x, y, s);
		chave = 1;
		x = 2'b00;
		y = 2'b01;
		#1 $display("chave = 1, and(%b, %b) = %b", x, y, s);
		x = 2'b11;
		y = 2'b01;
		#1 $display("chave = 1, and(%b, %b) = %b", x, y, s);
	end
endmodule // test_subcircuito