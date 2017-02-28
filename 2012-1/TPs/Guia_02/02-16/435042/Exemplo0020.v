// -------------------------
// Exemplo0020 - Subtrações
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída serão os resultados das
// subtrações pedidas no guia 02
// Teste 1:
// Entradas: [a = 101010(2) - 1101(2)], [b = 11010(2) - 15(8)], [c = 34(8) - B(16)],
// [d = CA(16) – 10111001(2)] e [e = 25 - 1A(16)]
// Observações da saída:
// Os valores exibidos são a=00011101, b=00001101, c=00010001, d=00010001 e
// e=11111111 (todos em binário), que são os resultados corretos das subtrações
// pedidas, todos com 8 bits.

module subtracoes;

	reg [7:0] a;
	reg [7:0] b;
	reg [7:0] c;
	reg [7:0] d;
	reg [7:0] e;

	initial begin
		$display("Exemplo0020 - Daniel Telles McGinnis - 435042");
		$display("Subtracoes");
		a = 8'b00101010 + (~8'b00001101 + 1);
		b = 8'b11010 + (~8'o15 + 1);
		c = 8'o34 + (~8'hB + 1);
		d = 8'hCA + (~8'b10111001 + 1);
		e = 8'd25 - 8'h1A;
		$display("a = 00101010(2) - 00001101(2) = %b", a);
		$display("b = 00011010(2) - 15(8)       = %b", b);
		$display("c = 34(8) - B(16)             = %b", c);
		$display("d = CA(16) - 10111001(2)      = %b", d);
		$display("e = 25 - 1A(16)               = %b", e);
	end

endmodule // subtracoes