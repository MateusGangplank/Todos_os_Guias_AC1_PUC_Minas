// ------------------------- 
// Guia 02
// -------------------------
// ------------------------- 
// Exercicio 0002
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// -------------------------
module operacao; 
// ------------------------- definir dados 
	reg [5:0] a; 
	reg [5:0] b; 
	reg [3:0] c; 
	reg [6:0] d;
	reg [9:0] e; 
// ------------------------- parte principal 
 initial begin 
	$display("Exercicio0003 - João Henrique Mendes de Oliveira - 392734"); 
	$display("Modulo Operação"); 
	
	a = 6'b101010 + 5'b11010; 
	b = 5'b11010 + 'o25; 
	c = 'o1234 / 'h2B; 
	d = 'h1CA - 9'b101110001;
	e = 25 * 'o31 + 'h7A; 
	
	$display("\nResultado das Operações: "); 
	$display("a = %d = %3b", a, a); 
	$display("b = %d = %4b", b, b); 
	$display("c = %d = %3b", c, c); 
	$display("d = %d = %3b", d, d); 
	$display("e = %d = %3b", e, e); 
 end 
endmodule // operacao