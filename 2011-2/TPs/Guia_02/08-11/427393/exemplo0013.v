// --
// --Exemplo0011 - BASE
// --Nome: Camila Guedes Silveira
// --Matrícula: 427393
// --

// -- test number system

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
	
	a = ~5+1; 
	b = ~5+1; 
	c = ~5+1; 
	
	$display("\nNegative mixed expression"); 
	$display("a = %d = %3b", a, a); 
	$display("b = %d = %4b", b, b); 
	$display("c = %d = %5b", c, c); 
end
endmodule // test_base