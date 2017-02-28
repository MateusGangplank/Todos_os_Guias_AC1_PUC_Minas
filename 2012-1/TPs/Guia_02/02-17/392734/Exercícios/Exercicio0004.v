// ------------------------- 
// Guia 02
// -------------------------
// ------------------------- 
// Exercicio 0004
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// -------------------------
module complementoDe2; 
// ------------------------- definir dados 
	reg [7:0] a; 
	reg [5:0] b; 
	reg [5:0] c; 
	reg [4:0] d;
	reg [5:0] e;
		   
// ------------------------- parte principal 
 initial begin 
	$display("Exercicio0004 - João Henrique Mendes de Oliveira - 392734"); 
	 
	a = ~8'b101010 + 1; 
	b = ~6'b011011 + 1; //123(4)
	c = ~6'd23 + 1; 
	d = ~5'hE + 1; 
	e = ~6'o26 + 1; 
	 		
	$display("\nComplemento de 2:"); 
	$display("a = %d = %8b", a, a);
	$display("b = %d = %6b", b, b); 
	$display("c = %d = %6b", c, c); 
	$display("d = %d = %5b", d, d); 
	$display("e = %d = %6b", e, e); 
		       
 end 
endmodule // complementoDe2 