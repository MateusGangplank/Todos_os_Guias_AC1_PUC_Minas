// ------------------------- 
// Guia 02
// -------------------------
// ------------------------- 
// Exercicio 0003
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// -------------------------
module complementoDe2;
// ------------------------- definir dados 
	reg [5:0] a;
	reg [5:0] b;
	reg [3:0] c;
	reg [4:0] d;
	reg [3:0] e;
		 
// ------------------------- parte principal 
 initial begin 
	$display("Exercicio0003 - João Henrique Mendes de Oliveira - 392734\n");
	$display("Modulo Complemento de 2!\n");
		  
   a = ~6'b100111 + 1;
   b = ~6'o23 + 1;
   c = ~23 + 1;
   d = ~6'h2B + 1;
   e = 26 + (~36 + 1);

   $display ("Complemento de 2:");	
	$display("a = %3d = (1)%b", a, a);
	$display("b = %3d = (1)%b", b, b);
	$display("c = %3d = (1)%b", c, c);
	$display("d = %3d = (1)%b", d, d);
	$display("e = %3d = (1)%b", e, e);

 end
endmodule //complementoDe2