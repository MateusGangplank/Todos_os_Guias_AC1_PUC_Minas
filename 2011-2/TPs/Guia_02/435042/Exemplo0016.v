// -------------------------
// Exemplo0016 - Opera��es Aritm�ticas
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previs�o:
// A sa�da ser�o os resultados das express�es
// aritm�ticas pedidas no guia 02
// Teste 1:
// Entradas: (a = 2 + 14), (b = 3 * 7), (c = 34 / 3), (d = 19 - 11) e (e = 2 * 4 + 6 - 1)
// Observa��es da sa�da:
// Os valores exibidos s�o a=16, b=21, c=11, d=8 e e=13 (todos em bin�rio),
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
		a = 2 + 14;
		b = 3 * 7;
		c = 34 / 3;
		d = 19 - 11;
		e = 2 * 4 + 6 - 1;
		$display("a = 2 + 14        = %b", a);
		$display("b = 3 * 7         = %b", b);
		$display("c = 34 / 3        = %b", c);
		$display("d = 19 - 11       = %b", d);
		$display("e = 2 * 4 + 6 - 1 = %b", e);
	end

endmodule // operacoesAritmeticas