// -------------------------
// Exemplo0031 - F4
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previs�o:
// A sa�da ser�o as conjun��es e as disjun��es de cada bit dos
// dois operandos de 4 bits que servirem de entrada para f4.
// Teste 1:
// Entradas: [a = 0011], [b = 0101]
// Observa��es da sa�da:
// A sa�da s�o duas linhas, uma para a conjun��o feita bit a bit
// e outra para a disjun��o feita bit a bit, como esperado.
// -------------------------
// f4_gate
// -------------------------
module f4 (output [3:0] s_and, output [3:0] s_or,
           input [3:0] a, input [3:0] b);
	and A0 (s_and[0], a[0], b[0]);
	and A1 (s_and[1], a[1], b[1]);
	and A2 (s_and[2], a[2], b[2]);
	and A3 (s_and[3], a[3], b[3]);

	or D0 (s_or[0], a[0], b[0]);
	or D1 (s_or[1], a[1], b[1]);
	or D2 (s_or[2], a[2], b[2]);
	or D3 (s_or[3], a[3], b[3]);
endmodule // f4

module test_f4;
	// ------------------------- definir dados
	reg [3:0] x;
	reg [3:0] y;
	wire [3:0] z_and;
	wire [3:0] z_or;
	f4 modulo (z_and, z_or, x, y);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0031 - Daniel Telles McGinnis - 435042");
		$display("Test LU's module");
		x = 4'b0011; y = 4'b0101;
		#1 $display("and(%3b, %3b) = %3b", x, y, z_and);
		#1 $display(" or(%3b, %3b) = %3b", x, y, z_or);
	end
endmodule // test_f4