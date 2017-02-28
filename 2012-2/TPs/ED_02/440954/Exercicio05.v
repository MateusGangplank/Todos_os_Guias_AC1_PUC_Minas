// -------------------------
// Exercicio05 - Operacoes
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- Operacoes
// -------------------------
module operacoes;
// ------------------------- definir dados
	reg [7:0]a;
	reg [7:0]b;
	reg [7:0]c;
	reg [7:0]d;
	reg [7:0]e;
// ------------------------- parte principal
	initial begin
		$display("Exercicio05 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test operacoes");

		a = 6'b101010 + ~(4'b1001) + 1;
		
		b = 5'b11011 + ~(4'o15) + 1;
		
		c = 5'o34 + ~(4'hc) + 1;
		
		d = 8'hda + ~(8'b10111001) + 1;
		
		e = 27 + ~(5'h1b) + 1;

		$display("\nSubtracoes\n");
		$display("a = 101010(2) – 1001(2) = %d = %b", a, a);
		$display("b = 11011(2) – 15(8) = %d = %b", b, b);
		$display("c = 34(8) –  C(16) = %d = %b", c, c);
		$display("d = DA(16) – 10111001(2) = %d = %b", d, d);
		$display("e = 27 – 1B(16) = %d = %b", e, e);
	end

endmodule // Operacoes