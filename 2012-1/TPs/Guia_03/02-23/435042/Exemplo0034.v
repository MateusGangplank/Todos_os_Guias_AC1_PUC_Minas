// -------------------------
// Exemplo0034 - OR/NOR e XOR/XNOR - 4 bits - Selecionável
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída serão a disjunção (OR) e a negação da disjunção (NOR) de cada bit dos
// dois operandos de 2 bits que servirem de entrada para subcircuito, e depois a
// disjunção exclusiva (XOR) e a negação da disjunção exclusiva (XNOR).
// Teste 1:
// Entradas: [a = 00 e b = 01], [a = 11 e b = 01], [primeiro: chave = 0, depois: chave = 1].
// Observações da saída:
// A saída são oito linhas, duas para a disjunção feita bit a bit,
// duas para a negação da disjunção feita bit a bit, duas linhas
// para a disjunção exclusiva (XOR) e duas linhas para a negação
// da disjunção exclusiva (XNOR), como esperado.

module or_nor(output [1:0] s_or, output [1:0] s_nor,
              input [1:0] a, input [1:0] b);

	or D0 (s_or[0], a[0], b[0]);
	or D1 (s_or[1], a[1], b[1]);

	nor A0 (s_nor[0], a[0], b[0]);
	nor A1 (s_nor[1], a[1], b[1]);

endmodule // or_nor

module xor_xnor(output [1:0] s_xor, output [1:0] s_xnor,
                input [1:0] a, input [1:0] b);

	xor ND0 (s_xor[0], a[0], b[0]);
	xor ND1 (s_xor[1], a[1], b[1]);

	xnor NA0 (s_xnor[0], a[0], b[0]);
	xnor NA1 (s_xnor[1], a[1], b[1]);

endmodule // xor_xnor

module subcircuito(output [1:0] s1, output [1:0] s2,
                   input chave, input [1:0] a, input [1:0] b);
	wire [1:0] s_or_nor_OR;
	wire [1:0] s_or_nor_NOR;
	wire [1:0] s_xor_xnor_XOR;
	wire [1:0] s_xor_xnor_XNOR;
	wire chaveNegada;
	wire [1:0] intermedio1;
	wire [1:0] intermedio2;
	wire [1:0] intermedio1b;
	wire [1:0] intermedio2b;

	or_nor N1 (s_or_nor_OR, s_or_nor_NOR, a, b);
	xor_xnor N2 (s_xor_xnor_XOR, s_xor_xnor_XNOR, a, b);
	
	// primeiro vamos decidir qual é o valor de s1, OR ou XOR
	// para depois decidir qual é o valor de s2, NOR ou XNOR.

	// OR ou XOR

	not S0 (chaveNegada, chave);

	and S1 (intermedio1[0], s_or_nor_OR[0], chaveNegada);
	and S2 (intermedio2[0], s_xor_xnor_XOR[0], chave);
	or S3 (s1[0], intermedio1[0], intermedio2[0]);

	and S4 (intermedio1[1], s_or_nor_OR[1], chaveNegada);
	and S5 (intermedio2[1], s_xor_xnor_XOR[1], chave);
	or S6 (s1[1], intermedio1[1], intermedio2[1]);

	// NOR ou XNOR

	and S13 (intermedio1b[0], s_or_nor_NOR[0], chaveNegada);
	and S14 (intermedio2b[0], s_xor_xnor_XNOR[0], chave);
	or S15 (s2[0], intermedio1b[0], intermedio2b[0]);

	and S16 (intermedio1b[1], s_or_nor_NOR[1], chaveNegada);
	and S17 (intermedio2b[1], s_xor_xnor_XNOR[1], chave);
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
		$display("Exemplo0034 - Daniel Telles McGinnis - 435042");
		$display("Test LU's module");
		chave = 0;
		x = 2'b00;
		y = 2'b01;
		#1 $display("chave = 0,   or(%b, %b) = %b", x, y, s1);
		x = 2'b11;
		y = 2'b01;
		#1 $display("chave = 0,   or(%b, %b) = %b\n", x, y, s1);
		x = 2'b00;
		y = 2'b01;
		#1 $display("chave = 0,  nor(%b, %b) = %b", x, y, s2);
		x = 2'b11;
		y = 2'b01;
		#1 $display("chave = 0,  nor(%b, %b) = %b\n", x, y, s2);
		chave = 1;
		x = 2'b00;
		y = 2'b01;
		#1 $display("chave = 1,  xor(%b, %b) = %b", x, y, s1);
		x = 2'b11;
		y = 2'b01;
		#1 $display("chave = 1,  xor(%b, %b) = %b\n", x, y, s1);
		x = 2'b00;
		y = 2'b01;
		#1 $display("chave = 1, xnor(%b, %b) = %b", x, y, s2);
		x = 2'b11;
		y = 2'b01;
		#1 $display("chave = 1, xnor(%b, %b) = %b", x, y, s2);
	end
endmodule // test_subcircuito