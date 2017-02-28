// -------------------------
// Exemplo0032 - OR e AND - 4 bits - Selecionável
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída serão as conjunções e as disjunções de cada bit dos
// dois operandos de 4 bits que servirem de entrada para subcircuito,
// lembrando que desta vez cada operação é feita uma de cada vez, não
// simultaneamente.
// Teste 1:
// Entradas: [a = 0011], [b = 0101], [primeiro: chave = 0, depois: chave = 1].
// Observações da saída:
// A saída são duas linhas, uma para a conjunção feita bit a bit
// e outra para a disjunção feita bit a bit, como esperado.

module subcircuito (output [3:0] s,
                    input chave, input [3:0] a, input [3:0] b);
	wire [3:0] s_and;
	wire [3:0] s_or;
	wire chaveNegada;
	wire [3:0] intermedio1;
	wire [3:0] intermedio2;

	or D0 (s_or[0], a[0], b[0]);
	or D1 (s_or[1], a[1], b[1]);
	or D2 (s_or[2], a[2], b[2]);
	or D3 (s_or[3], a[3], b[3]);

	and A0 (s_and[0], a[0], b[0]);
	and A1 (s_and[1], a[1], b[1]);
	and A2 (s_and[2], a[2], b[2]);
	and A3 (s_and[3], a[3], b[3]);

	not S0 (chaveNegada, chave);

	and S1 (intermedio1[0], s_or[0], chaveNegada);
	and S2 (intermedio2[0], s_and[0], chave);
	or S3 (s[0], intermedio1[0], intermedio2[0]);
	
	and S4 (intermedio1[1], s_or[1], chaveNegada);
	and S5 (intermedio2[1], s_and[1], chave);
	or S6 (s[1], intermedio1[1], intermedio2[1]);
	
	and S7 (intermedio1[2], s_or[2], chaveNegada);
	and S8 (intermedio2[2], s_and[2], chave);
	or S9 (s[2], intermedio1[2], intermedio2[2]);

	and S10 (intermedio1[3], s_or[3], chaveNegada);
	and S11 (intermedio2[3], s_and[3], chave);
	or S12 (s[3], intermedio1[3], intermedio2[3]);

endmodule // subcircuito

module test_subcircuito;
	// ------------------------- definir dados
	reg chave;
	reg [3:0] x;
	reg [3:0] y;
	wire [3:0] s;
	subcircuito modulo (s, chave, x, y);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0032 - Daniel Telles McGinnis - 435042");
		$display("Test LU's module");
		x = 4'b0011;
		y = 4'b0101;
		chave = 0;
		#1 $display("chave = 0,  or(%3b, %3b) = %3b", x, y, s);
		chave = 1;
		#1 $display("chave = 1, and(%3b, %3b) = %3b", x, y, s);
	end
endmodule // test_subcircuito