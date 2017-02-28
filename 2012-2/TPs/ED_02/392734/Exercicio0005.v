// ---------------------------------------
// Exercicio0005 - Guia 02
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ---------------------------------------

module test;
	reg [7:0]a;
	reg [7:0]b;
	reg [7:0]c;
	reg [7:0]d;
	reg [7:0]e;
	
//--- main
	initial begin:main
		$display("Exercicio0005 - João Henrique - 392734");
		
		a = 8'b101010 + (~8'b1001 + 1); 
		b = 8'b11011 + (~8'o15 + 1); 
		c = 8'o34 + (~8'hC + 1); 
		d = 8'hDA + (~8'b10111001 + 1); 
		e = 8'd27 + (~8'h1B + 1); 
		
		$display("\nComplemento de 2:\n");
		$display("b101010 - b1001 = %8b", a);
		$display("b11011 - o15 = %7b", b);
		$display("o34 + hC = %6b", c);
		$display("hDA + b10111001 = %5b", d);
		$display("d27 + h1B = %8b", e);
	end //-- main
	
endmodule //-- test