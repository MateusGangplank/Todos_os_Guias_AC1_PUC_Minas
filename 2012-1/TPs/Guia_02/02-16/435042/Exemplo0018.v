// -------------------------
// Exemplo0018 - Complemento de 2
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída serão os complementos de 2 de cada valor armazenado em registrador
// Teste 1:
// Entradas: [a = 100111(2)], [b = 23(8)], [c = 23],
// [d = 2B(16)] e [e = 26 - 36]
// Observações da saída:
// Os valores são computados e exibidos com o menor número de bits necessário.
// Porém, na saída do último número, são usados 7 bits porque esse último número
// é o resultado de uma operação envolvendo 36 (que ocupa 7 bits), apesar de o
// resultado ocupar menos bits.

module ComplementoDe2;

	reg [5:0] a;
	reg [5:0] b;
	reg [5:0] c;
	reg [6:0] d;
	reg [6:0] e;

	initial begin
		$display("Exemplo0018 - Daniel Telles McGinnis - 435042");
		$display("Complemento de 2");
		a = ~6'b100111 + 1;
		b = ~6'o23 + 1;
		c = ~6'd23 + 1;
		d = ~7'h2B + 1;
		e = ~(7'd26 - 7'd36) + 1;
		$display("a = %b", a);
		$display("b = %b", b);
		$display("c = %b", c);
		$display("d = %b", d);
		$display("e = %b", e);
	end

endmodule // ComplementoDe2