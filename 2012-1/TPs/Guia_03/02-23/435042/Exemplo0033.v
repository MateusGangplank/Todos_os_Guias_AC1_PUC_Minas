// -------------------------
// Exemplo0033 - OR/AND e NOR/NAND - 4 bits - Selecionável
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída serão as conjunções (AND) e as disjunções (OR) de cada bit dos
// dois operandos de 2 bits que servirem de entrada para subcircuito,
// e depois a negação da disjunção (NOR) e a negação da conjunção (NAND).
// Teste 1:
// Entradas: [a = 00 e b = 01], [a = 11 e b = 01], [primeiro: chave = 0, depois: chave = 1].
// Observações da saída:
// A saída são oito linhas, duas para a conjunção feita bit a bit,
// duas para a disjunção feita bit a bit, duas linhas para a negação
// da disjunção (NOR) e duas linhas para a negação da conjunção (NAND),
// como esperado.

module or_and(output [1:0] s_or, output [1:0] s_and,
              input [1:0] a, input [1:0] b);

	or D0 (s_or[0], a[0], b[0]);
	or D1 (s_or[1], a[1], b[1]);

	and A0 (s_and[0], a[0], b[0]);
	and A1 (s_and[1], a[1], b[1]);

endmodule // or_and

module nor_nand(output [1:0] s_nor, output [1:0] s_nand,
                input [1:0] a, input [1:0] b);

	nor ND0 (s_nor[0], a[0], b[0]);
	nor ND1 (s_nor[1], a[1], b[1]);

	nand NA0 (s_nand[0], a[0], b[0]);
	nand NA1 (s_nand[1], a[1], b[1]);

endmodule // nor_nand

module subcircuito(output [1:0] s1, output [1:0] s2,
                   input chave, input [1:0] a, input [1:0] b);
	wire [1:0] s_or_and_OR;
	wire [1:0] s_or_and_AND;
	wire [1:0] s_nor_nand_NOR;
	wire [1:0] s_nor_nand_NAND;
	wire chaveNegada;
	wire [1:0] intermedio1;
	wire [1:0] intermedio2;
	wire [1:0] intermedio1b;
	wire [1:0] intermedio2b;

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

	// AND ou NAND

	and S13 (intermedio1b[0], s_or_and_AND[0], chaveNegada);
	and S14 (intermedio2b[0], s_nor_nand_NAND[0], chave);
	or S15 (s2[0], intermedio1b[0], intermedio2b[0]);

	and S16 (intermedio1b[1], s_or_and_AND[1], chaveNegada);
	and S17 (intermedio2b[1], s_nor_nand_NAND[1], chave);
	or S18 (s2[1], intermedio1b[1], intermedio2b[1]);

endmodule // subcircuito

module test_subcircuito;
	// ------------------------- definir dados
	reg chave;
	reg [1:0] x;
	reg [1:0] y;
	wire [1:0] s1;
	wire [1:0] s2;
	subcircuito modulo (s1, s2, chave, x, y);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0033 - Daniel Telles McGinnis - 435042");
		$display("Test LU's module\n");
		chave = 0;
		x = 2'b00;
		y = 2'b01;
		#1 $display("chave = 0,   or(%b, %b) = %b", x, y, s1);
		x = 2'b11;
		y = 2'b01;
		#1 $display("chave = 0,   or(%b, %b) = %b\n", x, y, s1);
		x = 2'b00;
		y = 2'b01;
		#1 $display("chave = 0,  and(%b, %b) = %b", x, y, s2);
		x = 2'b11;
		y = 2'b01;
		#1 $display("chave = 0,  and(%b, %b) = %b\n", x, y, s2);
		chave = 1;
		x = 2'b00;
		y = 2'b01;
		#1 $display("chave = 1,  nor(%b, %b) = %b", x, y, s1);
		x = 2'b11;
		y = 2'b01;
		#1 $display("chave = 1,  nor(%b, %b) = %b\n", x, y, s1);
		x = 2'b00;
		y = 2'b01;
		#1 $display("chave = 1, nand(%b, %b) = %b", x, y, s2);
		x = 2'b11;
		y = 2'b01;
		#1 $display("chave = 1, nand(%b, %b) = %b", x, y, s2);
	end
endmodule // test_subcircuito