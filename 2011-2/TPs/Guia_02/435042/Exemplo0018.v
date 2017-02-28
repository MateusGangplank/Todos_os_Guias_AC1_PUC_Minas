// -------------------------
// Exemplo0018 - Complemento de 2
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída serão os complementos de 2 de cada valor armazenado em registrador
// Teste 1:
// Entradas: [a = 100111(2)], [b = 54(8)], [c = 13],
// [d = 1B(16)] e [e = 25 - 36]
// Observações da saída:

module ComplementoDe2;

	reg [5:0] a;
	reg [6:0] b;
	reg [4:0] c;
	reg [5:0] d;
	reg [6:0] e;

	initial begin
		$display("Exemplo0018 - Daniel Telles McGinnis - 435042");
		$display("Complemento de 2");
		a = ~6'b100111 + 1;
		b = ~7'o54 + 1;
		c = ~5'd13 + 1;
		d = ~6'h1B + 1;
		e = ~(7'd25 - 7'd36) + 1;
		$display("a = %b", a);
		$display("b = %b", b);
		$display("c = %b", c);
		$display("d = %b", d);
		$display("e = %b", e);
	end

endmodule // ComplementoDe2