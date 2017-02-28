// -------------------------
// Exemplo0034 - OR/NOR e XOR/XNOR - 4 bits - Selecion�vel
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previs�o:
// A sa�da ser�o a disjun��o (OR) e a nega��o da disjun��o (NOR) de cada bit dos
// dois operandos de 4 bits que servirem de entrada para subcircuito, e depois a
// disjun��o exclusiva (XOR) e a nega��o da disjun��o exclusiva (XNOR).
// Teste 1:
// Entradas: [a = 0011], [b = 0101], [primeiro: chave = 0, depois: chave = 1].
// Observa��es da sa�da:
// A sa�da s�o duas linhas, uma para a disjun��o feita bit a bit
// e outra para a nega��o da disjun��o feita bit a bit, e depois
// mais duas linhas para a disjun��o exclusiva (XOR) e a nega��o
// da disjun��o exclusiva (XNOR), como esperado.

module subcircuito(output s_not_a, output s_not_b, output s_or, output s_nor, output s_and,
                   output s_nand, output s_xor, output s_xnor, input a, input b);
	not N0 (s_not_a, a);
	not N1 (s_not_b, b);
	or N2 (s_or, a, b);
	nor N3 (s_nor, a, b);
	and N4 (s_and, a, b);
	nand N5 (s_nand, a, b);
	xor N6 (s_xor, a, b);
	xnor N7 (s_xnor, a, b);
endmodule // subcircuito

module test_subcircuito;
	// ------------------------- definir dados
	reg x;
	reg y;
	wire s_not_x;
	wire s_not_y;
	wire s_or;
	wire s_nor;
	wire s_and;
	wire s_nand;
	wire s_xor;
	wire s_xnor;
	subcircuito modulo (s_not_x, s_not_y, s_or, s_nor, s_and, s_nand, s_xor, s_xnor, x, y);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0034 - Daniel Telles McGinnis - 435042");
		$display("Test LU's module");
		$monitor("(%b, %b) -> %b %b %b %b %b %b %b %b", x, y, s_not_x, s_not_y, s_or, s_nor, s_and, s_nand, s_xor, s_xnor);
		x = 1'b0; y = 1'b0;
		#1 x = 1'b0; y = 1'b1;
		#1 x = 1'b1; y = 1'b0;
		#1 x = 1'b1; y = 1'b1;
	end
endmodule // test_subcircuito