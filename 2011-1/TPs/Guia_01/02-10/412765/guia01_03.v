//	Arquitetura de computador
//	guia 01 - exercicio 03
//	Nome: Paulo Henrique de Almeida Amorim
//	Matricula: 412765

//	-- x not or gate

module xnorgate (s, p, q, r, t);
	output s;//saida
	input p, q, r, t;//entradas

assign s = ~(p ^ q ^ r ^ t);//fazendo a tabela xnor

endmodule // fim do modulo xnorgate

//	-- test x not or gate

module testnandgate;
	reg a, b, c, d;
	wire s;

//instancia
xnorgate XNORD1(s, a, b, c, d);

//parte principal
initial begin
	$display("Exemplo 01_03 - Paulo Henrique - 412765");
	$display("Teste XNOR gate");
	$display("\n~(a ^ b ^ c ^ d) = s \n");
	a = 0; b = 0; c = 0; d = 0;
#1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
	a = 0; b = 0; c = 0; d = 1;
#1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
	a = 0; b = 0; c = 1; d = 0;
#1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
	a = 0; b = 1; c = 0; d = 0;
#1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
	a = 1; b = 0; c = 0; d = 0;
#1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
	a = 1; b = 1; c = 0; d = 0;
#1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
	a = 1; b = 0; c = 1; d = 0;
#1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
	a = 1; b = 0; c = 0; d = 1;
#1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
	a = 0; b = 1; c = 1; d = 0;
#1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
	a = 0; b = 1; c = 0; d = 1;
#1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
	a = 0; b = 0; c = 1; d = 1;
#1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
	a = 0; b = 1; c = 1; d = 1;
#1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
	a = 1; b = 0; c = 1; d = 1;
#1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
	a = 1; b = 1; c = 0; d = 1;
#1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
	a = 1; b = 1; c = 1; d = 0;
#1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
	a = 1; b = 1; c = 1; d = 1;
#1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
end

endmodule // testxnorgate