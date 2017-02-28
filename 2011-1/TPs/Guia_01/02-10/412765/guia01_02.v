//	Arquitetura de computador
//	guia 01 - exercicio 02
//	Nome: Paulo Henrique de Almeida Amorim
//	Matricula: 412765

// -- not or gate

module norgate (s, p, q, r);
	output s;
	input p, q, r;

assign s = ~(p | q | r);

endmodule

// -- test not or gate

module testnorgate;
	reg a, b, c;
	wire s;

//instancia
norgate NOR1(s, a, b, c);

//parte principal
initial begin
	$display("Exemplo 01_02 - Paulo Henrique - 412765");
	$display("Teste NOR gate");
	$display("\n~(a | b | c) = s \n");
	a = 0; b = 0; c = 0;
#1  $display("~(%b | %b | %b) = %b", a, b, c, s);
	a = 0; b = 0; c = 1;
#1  $display("~(%b | %b | %b) = %b", a, b, c, s);
	a = 0; b = 1; c = 0;
#1  $display("~(%b | %b | %b) = %b", a, b, c, s);
	a = 1; b = 0; c = 0;
#1  $display("~(%b | %b | %b) = %b", a, b, c, s);
	a = 1; b = 1; c = 0;
#1  $display("~(%b | %b | %b) = %b", a, b, c, s);
	a = 1; b = 0; c = 1;
#1  $display("~(%b | %b | %b) = %b", a, b, c, s);
	a = 0; b = 1; c = 1;
#1  $display("~(%b | %b | %b) = %b", a, b, c, s);
	a = 1; b = 1; c = 1;
#1  $display("~(%b | %b | %b) = %b", a, b, c, s);
end

endmodule //testnorgate