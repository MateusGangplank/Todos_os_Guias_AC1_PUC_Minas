// ------------------------- 
// Exemplo0011 - BASE 
// Nome: João Henrique Mendes de Oliveira 
// Matricula: 392734
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module test_base_01; 
// ------------------------- definir dados 
	reg [2:0] a; 
	reg [3:0] b; 
	reg [4:0] c; 
	reg [4:0] d; 
//------------------------- parte principal 
 initial begin 
	$display("Exemplo0011 - xxx yyy zzz - 999999"); 
	$display("Test number system"); 
	a = 5; 
	b = 10; 
	c = 15; 
	d = 20; 
	$display("\nPositive value"); 
	$display("a = %d = %3b", a, a); 
	$display("b = %d = %4b", a, a); 
	$display("c = %d = %5b", a, a); 
	$display("b = %d = %4b", b, b); 
	$display("c = %d = %5b", c, c); 
	$display("d = %d = %5b", d, d); 
	$display("d = %d = %5o", d, d); 
	$display("d = %d = %5h", d, d); 
	a = 5 + 3; 
	b = 5 + 3; 
	c = 10 - 5 + 25 + 3 + 1; 
	$display("\nOverflow"); 
	$display("a = %d = %3b", a, a); 
	$display("b = %d = %4b", b, b); 
	$display("c = %d = %5b", c, c);  
 end 
endmodule // test_base 