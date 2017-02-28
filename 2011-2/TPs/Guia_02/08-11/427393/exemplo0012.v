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
	$display("Exemplo0012 - Camila Guedes Silveira - 427393");
	$display("Test number system");
	
	a = 5;
	b = 10;
	c = 15;
	d = 20;
	
	$display("\nPositive value");
	$display("a = %d = %3b", a, a); // -- 3 bits 
	$display("b = %d = %4b", a, a); // -- 4 bits
	$display("c = %d = %5b", a, a); // -- 5 bits
	$display(" "); 
	$display("b = %d = %4b", b, b); 
	$display("c = %d = %5b", c, c); 
	$display("d = %d = %5b", d, d); 
	$display("d = %d = %5o", d, d); // -- base 8
	$display("d = %d = %5h", d, d); // -- base 16
	
	a = -5;
	b = -5;
	c = -5;
	
	$display("\nNegative value");
	$display("a = -5[3] = %d = %3b", a, a);
	$display("b = -5[4] = %d = %4b", b, b);
	$display("c = -5[5] = %d = %5b", c, c);
end
endmodule // test_base