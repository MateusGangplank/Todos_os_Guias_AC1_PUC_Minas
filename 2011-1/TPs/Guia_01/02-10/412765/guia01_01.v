//	Arquitetura de computador
//	guia 01 - exercicio 01
//	Nome: Paulo Henrique de Almeida Amorim
//	Matricula: 412765

//	-- not and gate

module nandgate (s, p, q, r);
	output s;//saida
	input p, q, r;//entradas

assign s = ~(p & q & r);//fazendo a tabela nand

endmodule // fim do modulo nandgate

//	-- test not and gate

module testnandgate;
	reg a, b, c;
	wire s;

//instancia
nandgate NAND1(s, a, b, c);

//parte principal
initial begin
	$display("Exemplo 01_01 - Paulo Henrique - 412765");
	$display("Teste NAND gate");
	$display("\n~(a & b & c) = s\n");
	a = 0; b = 0; c = 0;
#1  $display("~(%b & %b & %b) = %b", a, b, c, s);
	a = 0; b = 0; c = 1;
#1  $display("~(%b & %b & %b) = %b", a, b, c, s);
	a = 0; b = 1; c = 0;
#1  $display("~(%b & %b & %b) = %b", a, b, c, s);
	a = 1; b = 0; c = 0;
#1  $display("~(%b & %b & %b) = %b", a, b, c, s);
	a = 0; b = 1; c = 1;
#1  $display("~(%b & %b & %b) = %b", a, b, c, s);
	a = 1; b = 0; c = 1;
#1  $display("~(%b & %b & %b) = %b", a, b, c, s);
	a = 1; b = 1; c = 0;
#1  $display("~(%b & %b & %b) = %b", a, b, c, s);
	a = 1; b = 1; c = 1;
#1  $display("~(%b & %b & %b) = %b", a, b, c, s);
end

endmodule // testnandgate