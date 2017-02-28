// -------------------------
// Exercicio04 - Operacoes
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- Operacoes
// -------------------------
module operacoes;
// ------------------------- definir dados
	reg [7:0]a;
	reg [6:0]b;
	reg [5:0]c;
	reg [4:0]d;
	reg [7:0]e;
// ------------------------- parte principal
	initial begin
		$display("Exercicio04 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test operacoes");

		a = ~(6'b101011) + 1;
		
		b = ~(57) + 1;
		
		c = ~(27) + 1;
		
		d = ~(4'hc) + 1;
		
		e = ~(5'o21) + 1;

		$display("\nComplementar de 2\n");
		$display("a = 101011(2) = %d = %b", a, a);
		$display("b = 321(4) = %d = %b", b, b);
		$display("c = 27(10) = %d = %b", c, c);
		$display("d = C(16) = %d = %b", d, d);
		$display("e = 21(8) = %d = %b", e, e);
	end

endmodule // Operacoes