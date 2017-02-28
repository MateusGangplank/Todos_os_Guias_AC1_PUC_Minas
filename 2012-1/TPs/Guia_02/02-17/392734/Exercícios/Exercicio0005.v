// ------------------------- 
// Guia 02
// -------------------------
// ------------------------- 
// Exercicio 0005
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// -------------------------
module operacoes; 
// ------------------------- definir dados 
		  
	reg [8:0] a; 
	reg [8:0] b; 
	reg [8:0] c; 
	reg [8:0] d;
	reg [7:0] e;
		   
// ------------------------- parte principal 
 initial begin 
	$display("Exercicio0005 - João Henrique Mendes de Oliveira - 392734"); 
	$display("Test number system"); 
	 
	a = 8'b101010 + (~8'b1101 + 1); 
	b = 8'b11010 + (~8'o15 + 1); 
	c = 8'o34 + (~8'hB + 1); 
	d = 8'hCA + (~8'b10111001 + 1); 
	e = 8'd25 + (~8'h1A + 1); 
	 			 	  
	$display("a = %d = %5b", a, a);
	$display("b = %d = %4b", b, b); 
	$display("c = %d = %5b", c, c); 
	$display("d = %d = %5b", d, d); 
	$display("e = %d = %8b", e, e); 
		       
 end 
endmodule // operacoes 