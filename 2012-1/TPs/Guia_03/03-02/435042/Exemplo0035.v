// -------------------------
// Exemplo0034 - OR/NOR e XOR/XNOR - 4 bits - Selecionável
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída será a tabela verdade de todas as operações pedidas no
// guia (not, or, and, nand, xor, xnor).
// Teste 1:
// Entradas: [a = 0011], [b = 0101], [primeiro: chave = 0, depois: chave = 1].
// Observações da saída:
// A saída são quatro linhas, uma para cada operação com 2 bits,
// como esperado.

module subcircuito(output s,
                   input chave0, input chave1, input chave2, input a, input b);
	wire s_not_a;
	wire s_not_b;
	wire s_or;
	wire s_nor;
	wire s_and;
	wire s_nand;
	wire s_xor;
	wire s_xnor;
	wire chave0_negado;
	wire chave1_negado;
	wire chave2_negado;
	wire s_not_a_filtrado;
	wire s_not_b_filtrado;
	wire s_or_filtrado;
	wire s_nor_filtrado;
	wire s_and_filtrado;
	wire s_nand_filtrado;
	wire s_xor_filtrado;
	wire s_xnor_filtrado;

	not N0 (s_not_a, a);
	not N1 (s_not_b, b);
	or N2 (s_or, a, b);
	nor N3 (s_nor, a, b);
	and N4 (s_and, a, b);
	nand N5 (s_nand, a, b);
	xor N6 (s_xor, a, b);
	xnor N7 (s_xnor, a, b);
	
	not N8 (chave0_negado, chave0);
	not N9 (chave1_negado, chave1);
	not N10 (chave2_negado, chave2);
	
	and N11 (s_not_a_filtrado, s_not_a, chave0_negado, chave1_negado, chave2_negado);
	and N12 (s_not_b_filtrado, s_not_b, chave0_negado, chave1_negado, chave2);
	and N13 (s_or_filtrado, s_or, chave0_negado, chave1, chave2_negado);
	and N14 (s_nor_filtrado, s_nor, chave0_negado, chave1, chave2);
	and N15 (s_and_filtrado, s_and, chave0, chave1_negado, chave2_negado);
	and N16 (s_nand_filtrado, s_nand, chave0, chave1_negado, chave2);
	and N17 (s_xor_filtrado, s_xor, chave0, chave1, chave2_negado);
	and N18 (s_xnor_filtrado, s_xnor, chave0, chave1, chave2);

	or N19 (s, s_not_a_filtrado, s_not_b_filtrado, s_or_filtrado, s_nor_filtrado, s_and_filtrado, s_nand_filtrado, s_xor_filtrado, s_xnor_filtrado);
endmodule // subcircuito

module test_subcircuito;
	// ------------------------- definir dados
	wire s;
	reg c0;
	reg c1;
	reg c2;
	reg x;
	reg y;
	subcircuito modulo (s, c0, c1, c2, x, y);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0034 - Daniel Telles McGinnis - 435042");
		$display("Test LU's module");

		$display("\n");
		
		c0 = 1'b0; c1 = 1'b0; c2 = 1'b0;
		$display("chave = 000, op = not a");
		x = 1'b0; y = 1'b0;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b0; y = 1'b1;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b1; y = 1'b0;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b1; y = 1'b1;
		#1 $display("(%b, %b) -> %b", x, y, s);

		$display("\n");
		
		c0 = 1'b0; c1 = 1'b0; c2 = 1'b1;
		$display("chave = 001, op = not b");
		x = 1'b0; y = 1'b0;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b0; y = 1'b1;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b1; y = 1'b0;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b1; y = 1'b1;
		#1 $display("(%b, %b) -> %b", x, y, s);

		$display("\n");
		
		c0 = 1'b0; c1 = 1'b1; c2 = 1'b0;
		$display("chave = 010, op = or");
		x = 1'b0; y = 1'b0;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b0; y = 1'b1;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b1; y = 1'b0;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b1; y = 1'b1;
		#1 $display("(%b, %b) -> %b", x, y, s);

		$display("\n");
		
		c0 = 1'b0; c1 = 1'b1; c2 = 1'b1;
		$display("chave = 011, op = nor");
		x = 1'b0; y = 1'b0;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b0; y = 1'b1;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b1; y = 1'b0;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b1; y = 1'b1;
		#1 $display("(%b, %b) -> %b", x, y, s);

		$display("\n");
		
		c0 = 1'b1; c1 = 1'b0; c2 = 1'b0;
		$display("chave = 100, op = and");
		x = 1'b0; y = 1'b0;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b0; y = 1'b1;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b1; y = 1'b0;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b1; y = 1'b1;
		#1 $display("(%b, %b) -> %b", x, y, s);

		$display("\n");
		
		c0 = 1'b1; c1 = 1'b0; c2 = 1'b1;
		$display("chave = 101, op = nand");
		x = 1'b0; y = 1'b0;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b0; y = 1'b1;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b1; y = 1'b0;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b1; y = 1'b1;
		#1 $display("(%b, %b) -> %b", x, y, s);

		$display("\n");
		
		c0 = 1'b1; c1 = 1'b1; c2 = 1'b0;
		$display("chave = 110, op = xor");
		x = 1'b0; y = 1'b0;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b0; y = 1'b1;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b1; y = 1'b0;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b1; y = 1'b1;
		#1 $display("(%b, %b) -> %b", x, y, s);

		$display("\n");
		
		c0 = 1'b1; c1 = 1'b1; c2 = 1'b1;
		$display("chave = 111, op = xnor");
		x = 1'b0; y = 1'b0;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b0; y = 1'b1;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b1; y = 1'b0;
		#1 $display("(%b, %b) -> %b", x, y, s);
		x = 1'b1; y = 1'b1;
		#1 $display("(%b, %b) -> %b", x, y, s);
	end
endmodule // test_subcircuito