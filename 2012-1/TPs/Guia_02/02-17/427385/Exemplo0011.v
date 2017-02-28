// ------------------------- 
// Exemplo0011 - BASE
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// -------------------------

// -------------------------
//  test number system
// -------------------------

module test_base_01;
// ------------------------- definir dados
	reg [2:0] a; // pos 0 1 2 - 3 valores binarios
	reg [3:0] b; // pos 0 1 2 3 - 4 valores binarios
	reg [4:0] c; // pos 0 1 2 3 4 - 5 valores binarios
	reg [4:0] d; // pos 0 1 2 3 4 - 5 valores binarios
	
// ------------------------- parte principal
initial begin
	$display("Exemplo0011 - Ana Cristina Pereira Teixeira - 427385");
	$display("Test number system");
	
	a =   5;
	b =  10;
	c =  15;
	d =  20;
	
	$display("\nPositive value");
	$display("a = %d = %3b", a, a); // mostrar valor atribuido para reg a = 5, em decimal, e depois em 3 bits
	$display("b = %d = %4b", a, a); // mostrar b recebendo reg a = 5, em decimal, e depois em 4 bits, base 2
	$display("c = %d = %5b", a, a); // mostrar c recebendo reg a = 5, em decimal, e depois em 5 bits, base 2
	$display("b = %d = %4b", b, b); // mostrar reg b = 10, em decimal, e depois em 4 bits, base 2
	$display("c = %d = %5b", c, c); // mostrar reg c = 10, em decimal, e depois em 5 bits, base 2
	$display("d = %d = %5b", d, d); // mostrar reg d = 20, em deciaml, e depois em 5 bits, base 2
	$display("d = %d = %5o", d, d); // mostrar reg d = 20, em decimal, e depois na base 8, 5 bits
	$display("d = %d = %5h", d, d); // mostrar reg d = 20, em decimal, e depois na base 16, 5 bits
end
endmodule // test_base