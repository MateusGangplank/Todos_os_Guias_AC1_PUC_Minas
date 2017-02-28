// --
// --Exemplo0011 - BASE
// --Nome: Camila Guedes Silveira
// --Matrícula: 427393
// --

// -- test number system

module test_base_01;
// -- definir dados
	reg[3:0]a;
	reg[3:0]b;
	reg[4:0]c;
	
// -- parte principal
initial begin
	$display("Exemplo0012 - Camila Guedes Silveira - 427393");
	a = 5 + 3; 
	b = 5 + 3; 
	c = 10 - 5 + 25 + 3 + 1; 
	
	$display("\nOverflow"); 
	$display("a = %d = %3b", a, a); 
	$display("b = %d = %4b", b, b); 
	$display("c = %d = %5b", c, c); 
	
end
endmodule // test_exemplo_14