// -------------------------
// Exercicio03 - Operacoes
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- Operacoes
// -------------------------
module operacoes;
// ------------------------- definir dados
	reg [4:0]a;
	reg [3:0]b;
	reg [2:0]c;
	reg [4:0]d;
	reg [3:0]e;
// ------------------------- parte principal
	initial begin
		$display("Exercicio03 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test operacoes");

		a = ~(6'b100110) + 1;
		
		b = ~(5'o24) + 1;
		
		c = ~(25) + 1;
		
		d = ~(6'h2d) + 1;
		
		e = ~(27-37) + 1;

		$display("\nComplementar de 2\n");
		$display("a = 100110(2) = %d = %b", a, a);
		$display("b = 24(8) = %d = %b", b, b);
		$display("c = 25(10) = %d = %b", c, c);
		$display("d = 2D(16) = %d = %b", d, d);
		$display("e = 27 - 37 = %d = %b", e, e);
	end

endmodule // Operacoes