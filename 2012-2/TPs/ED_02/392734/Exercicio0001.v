// ---------------------------------------
// Exercicio0001 - Guia 02
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ---------------------------------------

module test;
	reg [4:0]a;
	reg [4:0]b;
	reg [2:0]c;
	reg [3:0]d;
	reg [4:0]e;
	
//--- main
	initial begin:main
		$display("Exercicio0001 - João Henrique - 392734");
		
		a = 2 + 14;
		b = 3 * 9;
		c = 32 / 5;
		d = 24 - 11;
		e = 2 * 6 + 7 - 1;
		
		$display("\nOperações:\n");
		$display("2 + 14 = b%5b", a);
		$display("3 * 9 = b%5b", b);
		$display("32 / 5 = b%3b", c);
		$display("24 - 11 = b%4b", d);
		$display("2 * 6 + 7 - 1 = b%5b", e);
	end //-- main
	
endmodule //-- test