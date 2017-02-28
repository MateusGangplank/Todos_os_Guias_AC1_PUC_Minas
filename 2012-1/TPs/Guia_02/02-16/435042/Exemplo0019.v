// -------------------------
// Exemplo0019 - Complemento de 2
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída serão os complementos de 2 de cada valor armazenado em registrador
// Teste 1:
// Entradas: [a = 101010(2)], [b = 123(4)], [c = 23],
// [d = E(16)] e [e = 26(8)]
// Observações da saída:

module ComplementoDe2;

	reg [7:0] a;
	reg [6:0] b;
	reg [5:0] c;
	reg [4:0] d;
	reg [7:0] e;

	initial begin
		$display("Exemplo0019 - Daniel Telles McGinnis - 435042");
		$display("Complemento de 2");
		a = ~8'b101010 + 1;
		b = ~7'b011011 + 1;
		c = ~6'd23 + 1;
		d = ~5'hE + 1;
		e = ~8'o26 + 1;
		$display("a = %b", a);
		$display("b = %b", b);
		$display("c = %b", c);
		$display("d = %b", d);
		$display("e = %b", e);
	end

endmodule // ComplementoDe2