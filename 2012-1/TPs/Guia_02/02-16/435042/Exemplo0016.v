// -------------------------
// Exemplo0016 - Opera��es Aritm�ticas
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previs�o:
// A sa�da ser�o os resultados das express�es
// aritm�ticas pedidas no guia 02
// Teste 1:
// Entradas: (a = 2 + 15), (b = 3 * 8), (c = 32 / 3), (d = 21 - 11) e (e = 2 * 5 + 6 - 1)
// Observa��es da sa�da:
// Os valores exibidos s�o a=17, b=24, c=10, d=10 e e=15 (todos em bin�rio),
// que s�o os resultados corretos das express�es aritm�ticas pedidas, todos
// com o menor n�mero de bits necess�rios.

module operacoesAritmeticas;

	reg [4:0] a;
	reg [4:0] b;
	reg [3:0] c;
	reg [3:0] d;
	reg [3:0] e;

	initial begin
		$display("Exemplo0016 - Daniel Telles McGinnis - 435042");
		$display("Operacoes Aritmeticas");
		a = 2 + 15;
		b = 3 * 8;
		c = 32 / 3;
		d = 21 - 11;
		e = 2 * 5 + 6 - 1;
		$display("a = 2 + 15        = %b", a);
		$display("b = 3 * 8         = %b", b);
		$display("c = 32 / 3        = %b", c);
		$display("d = 21 - 11       = %b", d);
		$display("e = 2 * 5 + 6 - 1 = %b", e);
	end

endmodule // operacoesAritmeticas