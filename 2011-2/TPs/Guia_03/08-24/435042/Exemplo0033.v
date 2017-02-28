// -------------------------
// Exemplo0033 - OR/AND e NOR/NAND - 4 bits - Selecionável
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída serão as conjunções (AND) e as disjunções (OR) de cada bit dos
// dois operandos de 4 bits que servirem de entrada para subcircuito,
// e depois a negação da disjunção (NOR) e a negação da conjunção (NAND).
// Teste 1:
// Entradas: [a = 0011], [b = 0101], [primeiro: chave = 0, depois: chave = 1].
// Observações da saída:
// A saída são duas linhas, uma para a conjunção feita bit a bit
// e outra para a disjunção feita bit a bit, e depois mais duas
// linhas para a negação da disjunção (NOR) e a negação da conjunção
// (NAND), como esperado.

module or_and(output [3:0] s_or, output [3:0] s_and,
              input [3:0] a, input [3:0] b);

	or D0 (s_or[0], a[0], b[0]);
	or D1 (s_or[1], a[1], b[1]);
	or D2 (s_or[2], a[2], b[2]);
	or D3 (s_or[3], a[3], b[3]);

	and A0 (s_and[0], a[0], b[0]);
	and A1 (s_and[1], a[1], b[1]);
	and A2 (s_and[2], a[2], b[2]);
	and A3 (s_and[3], a[3], b[3]);

endmodule // or_and

module nor_nand(output [3:0] s_nor, output [3:0] s_nand,
                input [3:0] a, input [3:0] b);

	nor ND0 (s_nor[0], a[0], b[0]);
	nor ND1 (s_nor[1], a[1], b[1]);
	nor ND2 (s_nor[2], a[2], b[2]);
	nor ND3 (s_nor[3], a[3], b[3]);

	nand NA0 (s_nand[0], a[0], b[0]);
	nand NA1 (s_nand[1], a[1], b[1]);
	nand NA2 (s_nand[2], a[2], b[2]);
	nand NA3 (s_nand[3], a[3], b[3]);

endmodule // nor_nand

module subcircuito(output [3:0] s1, output [3:0] s2,
                   input chave, input [3:0] a, input [3:0] b);
	wire [3:0] s_or_and_OR;
	wire [3:0] s_or_and_AND;
	wire [3:0] s_nor_nand_NOR;
	wire [3:0] s_nor_nand_NAND;
	wire chaveNegada;
	wire [3:0] intermedio1;
	wire [3:0] intermedio2;
	wire [3:0] intermedio1b;
	wire [3:0] intermedio2b;

	or_and N1 (s_or_and_OR, s_or_and_AND, a, b);
	nor_nand N2 (s_nor_nand_NOR, s_nor_nand_NAND, a, b);
	
	// primeiro vamos decidir qual é o valor de s1, OR ou NOR
	// para depois decidir qual é o valor de s2, AND ou NAND.

	// OR ou NOR

	not S0 (chaveNegada, chave);

	and S1 (intermedio1[0], s_or_and_OR[0], chaveNegada);
	and S2 (intermedio2[0], s_nor_nand_NOR[0], chave);
	or S3 (s1[0], intermedio1[0], intermedio2[0]);

	and S4 (intermedio1[1], s_or_and_OR[1], chaveNegada);
	and S5 (intermedio2[1], s_nor_nand_NOR[1], chave);
	or S6 (s1[1], intermedio1[1], intermedio2[1]);

	and S7 (intermedio1[2], s_or_and_OR[2], chaveNegada);
	and S8 (intermedio2[2], s_nor_nand_NOR[2], chave);
	or S9 (s1[2], intermedio1[2], intermedio2[2]);

	and S10 (intermedio1[3], s_or_and_OR[3], chaveNegada);
	and S11 (intermedio2[3], s_nor_nand_NOR[3], chave);
	or S12 (s1[3], intermedio1[3], intermedio2[3]);

	// AND ou NAND

	and S13 (intermedio1b[0], s_or_and_AND[0], chaveNegada);
	and S14 (intermedio2b[0], s_nor_nand_NAND[0], chave);
	or S15 (s2[0], intermedio1b[0], intermedio2b[0]);

	and S16 (intermedio1b[1], s_or_and_AND[1], chaveNegada);
	and S17 (intermedio2b[1], s_nor_nand_NAND[1], chave);
	or S18 (s2[1], intermedio1b[1], intermedio2b[1]);

	and S19 (intermedio1b[2], s_or_and_AND[2], chaveNegada);
	and S20 (intermedio2b[2], s_nor_nand_NAND[2], chave);
	or S21 (s2[2], intermedio1b[2], intermedio2b[2]);

	and S22 (intermedio1b[3], s_or_and_AND[3], chaveNegada);
	and S23 (intermedio2b[3], s_nor_nand_NAND[3], chave);
	or S24 (s2[3], intermedio1b[3], intermedio2b[3]);

endmodule // subcircuito

module test_subcircuito;
	// ------------------------- definir dados
	reg chave;
	reg [3:0] x;
	reg [3:0] y;
	wire [3:0] s1;
	wire [3:0] s2;
	subcircuito modulo (s1, s2, chave, x, y);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0033 - Daniel Telles McGinnis - 435042");
		$display("Test LU's module");
		x = 4'b0011;
		y = 4'b0101;
		chave = 0;
		#1 $display("chave = 0,  or(%3b, %3b) = %3b", x, y, s1);
		$display("chave = 0,  and(%3b, %3b) = %3b", x, y, s2);
		chave = 1;
		#1 $display("chave = 1,  nor(%3b, %3b) = %3b", x, y, s1);
		$display("chave = 1,  nand(%3b, %3b) = %3b", x, y, s2);
	end
endmodule // test_subcircuito