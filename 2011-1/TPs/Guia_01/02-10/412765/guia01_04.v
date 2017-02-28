//	Arquitetura de computador
//	guia 01 - exercicio 01
//	Nome: Paulo Henrique de Almeida Amorim
//	Matricula: 412765

//	-- x or gate

module xorgate (s, p, q);
	output s;//saida
	input p, q;//entradas

assign s = (p ^ q);//fazendo a tabela nand

endmodule // fim do modulo xorgate

//	-- test x or gate

module testxorgate;
	reg a, b;
	wire s;

//instancia
xorgate XOR1(s, a, b);

//parte principal
initial begin
	$display("Exemplo 01_04 - Paulo Henrique - 412765");
	$display("Teste XOR gate");
	$display("\n(a ^ b) = s\n");
	a = 0; b = 0;
#1  $display("(%b ^ %b) = %b", a, b, s);
	a = 1; b = 0;
#1  $display("(%b ^ %b) = %b", a, b, s);
	a = 0; b = 1;
#1  $display("(%b ^ %b) = %b", a, b, s);
	a = 1; b = 1;
#1  $display("(%b ^ %b) = %b", a, b, s);
end

endmodule // testxorgate