// -------------------------
// Exemplo0017 - Operações Aritméticas Com Outras Bases
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída serão os resultados das expressões
// aritméticas pedidas no guia 02
// Teste 1:
// Entradas: [a = 101010(2) + 11010(2)], [b = 11010(2) + 25(8)], [c = 1234(8) / 2B(16)],
// [d = 1CA(16) – 101110001(2)] e [e = 25 * 31(8) + 7A(16)]
// Observações da saída:
// Os valores exibidos são a=68, b=47, c=15, d=89 e e=747 (todos em binário),
// que são os resultados corretos das expressões aritméticas pedidas, todos
// com o menor número de bits necessários.

module operacoesAritmeticasComOutrasBases;

	reg [6:0] a;
	reg [5:0] b;
	reg [3:0] c;
	reg [6:0] d;
	reg [9:0] e;

	initial begin
		$display("Exemplo0017 - Daniel Telles McGinnis - 435042");
		$display("Operacoes Aritmeticas Com Outras Bases");
		a = 6'b101010 + 5'b11010;
		b = 5'b11010 + 5'o25;
		c = 10'o1234 / 6'h2B;
		d = 9'h1CA - 9'b101110001;
		e = 25 * 5'o31 + 7'h7A;
		$display("a = 101010(2) + 11010(2)   = %b", a);
		$display("b = 11010(2) + 25(8)       = %b", b);
		$display("c = 1234(8) / 2B(16)       = %b", c);
		$display("d = 1CA(16) – 101110001(2) = %b", d);
		$display("e = 25 * 31(8) + 7A(16)    = %b", e);
	end

endmodule // operacoesAritmeticasComOutrasBases