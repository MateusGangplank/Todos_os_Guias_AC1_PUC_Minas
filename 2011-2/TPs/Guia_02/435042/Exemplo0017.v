// -------------------------
// Exemplo0017 - Operações Aritméticas Com Outras Bases
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída serão os resultados das expressões
// aritméticas pedidas no guia 02
// Teste 1:
// Entradas: [a = 100010(2) + 11010(2)], [b = 11010(2) + 23(8)], [c = 1234(8) / 2D(16)],
// [d = 1A9(16) – 101101001(2)] e [e = 25 * 41(8) + 6B(16)]
// Observações da saída:
// Os valores exibidos são a=16, b=21, c=11, d=8 e e=13 (todos em binário),
// que são os resultados corretos das expressões aritméticas pedidas, todos
// com o menor número de bits necessários.

module operacoesAritmeticasComOutrasBases;

	reg [5:0] a;
	reg [5:0] b;
	reg [3:0] c;
	reg [6:0] d;
	reg [9:0] e;

	initial begin
		$display("Exemplo0017 - Daniel Telles McGinnis - 435042");
		$display("Operacoes Aritmeticas Com Outras Bases");
		a = 6'b100010 + 5'b11010;
		b = 5'b11010 + 5'o23;
		c = 10'o1234 / 6'h2D;
		d = 9'h1A9 - 9'b101101001;
		e = 25 * 6'o41 + 7'h6B;
		$display("a = 100010(2) + 11010(2)   = %b", a);
		$display("b = 11010(2) + 23(8)       = %b", b);
		$display("c = 1234(8) / 2D(16)       = %b", c);
		$display("d = 1A9(16) – 101101001(2) = %b", d);
		$display("e = 25 * 41(8) + 6B(16)    = %b", e);
	end

endmodule // operacoesAritmeticasComOutrasBases