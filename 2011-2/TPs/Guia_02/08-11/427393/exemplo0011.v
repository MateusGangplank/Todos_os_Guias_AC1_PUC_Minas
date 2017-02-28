// --
// --Exemplo0011 - BASE
// --Nome: Camila Guedes Silveira
// --Matrícula: 427393
// --


module test_base_01;
// -- definir dados
	reg[2:0]a;
	reg[3:0]b;
	reg[4:0]c;
	reg[4:0]d;
	
// -- parte principal
initial begin
	$display("Exercicio0011 - Camilia Guedes Silveira - 427393");
	$display("Test number system");
	
	a = 5;
	b = 10;
	c = 15;
	d = 20;
	
	$display("\nPosistive value");
	$display("a = %d = %3b", a, a); // -- valor 5 em binario(3 casa)
	$display("b = %d = %4b", a, a); // -- valor 5 em binario(4 casas)
	$display("c = %d = %5b", a, a); // -- valor 5 em binario(5 casas)
	
	$display("b = %d = %4b", b, b); // -- valor 10 em binario
	$display("c = %d = %5b", c, c); // -- valor 15 em binario
	$display("d = %d = %5b", d, d); // -- valor 20 em binario
	$display("d = %d = %5o", d, d); // -- valor 20 na base 8
	$display("d = %d = %5h", d, d); // -- valor 20 na base 16
end

endmodule // test_base