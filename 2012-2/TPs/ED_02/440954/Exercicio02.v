// -------------------------
// Exercicio02 - Operacoes
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- Operacoes
// -------------------------
module operacoes;
// ------------------------- definir dados
	reg [6:0]a;
	reg [5:0]b;
	reg [3:0]c;
	reg [6:0]d;
	reg [9:0]e;
// ------------------------- parte principal
	initial begin
		$display("Exercicio02 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test operacoes");

		a = 6'b101010 + 5'b11011;
		b = 5'b11011 + 5'o25;
		c = 10'o1234 / 6'h3c;
		d = 9'h1ba - 9'b101110001;
		e = 25 * 5'o32 + 7'h7a;

		$display("\nOperacoes");
		$display("a = 101010(2) + 11011(2) = %d = %b", a, a);
		$display("b = 11011(2) + 25(8) = %d = %b", b, b);
		$display("c = 1234(8) / 3C(16) = %d = %b", c, c);
		$display("d = 1BA(16) – 101110001(2) = %d = %b", d, d);
		$display("e = 25 * 32(8) + 7A(16) = %d = %b", e, e);
	end

endmodule // Operacoes