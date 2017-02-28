// ------------------------- 
// Guia 02
// -------------------------
// ------------------------- 
// Exercicio 0001
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// -------------------------
module operacao; 
// ------------------------- definir dados 
	reg [4:0] a; 
	reg [4:0] b; 
	reg [3:0] c; 
	reg [3:0] d;
	reg [3:0] e; 
// ------------------------- parte principal 
 initial begin 
	$display("Exercicio0001 - João Henrique Mendes de Oliveira - 392734"); 
	$display("Modulo Operação");

	a = 2 + 15; 
	b = 3 * 8; 
	c = 32 / 3; 
	d = 21 - 11;
	e = 2 * 5 + 6 - 1; 
	
	$display("\nResultado das operações: "); 
	$display("a = %d = %4b", a, a); 
	$display("b = %d = %4b", b, b); 
	$display("c = %d = %3b", c, c); 
	$display("d = %d = %3b", d, d); 
	$display("e = %d = %3b", e, e); 
 end 
endmodule // operacao