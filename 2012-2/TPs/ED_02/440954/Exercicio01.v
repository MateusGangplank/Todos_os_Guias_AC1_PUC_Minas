// -------------------------
// Exercicio01 - Operacoes
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- Operacoes
// -------------------------
module operacoes;
// ------------------------- definir dados
	reg [4:0]a;
	reg [4:0]b;
	reg [2:0]c;
	reg [3:0]d;
	reg [4:0]e;
// ------------------------- parte principal
	initial begin
		$display("Exercicio01 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test operacoes");

		a = 2 + 14;
		b = 3 * 9;
		c = 32 / 5;
		d = 24 - 11;
		e = 2 * 6 + 7 - 1;

		$display("\nOperacoes");
		$display("a = 2 + 14 = %d = %b", a, a);
		$display("b = 3 * 9 = %d = %b", b, b);
		$display("c = 32 / 5 = %d = %b", c, c);
		$display("d = 24 - 11 = %d = %b", d, d);
		$display("e = 2 * 6 + 7 -1 = %d = %b", e, e);
	end

endmodule // Operacoes