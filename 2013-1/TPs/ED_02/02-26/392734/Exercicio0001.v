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
		
		a = 3 + 14;
		b = 3 * 8;
		c = 33 / 5;
		d = 25 - 11;
		e = 2 * 8 + 7 - 1;
		
		$display("\nOperações:\n");
		$display("3 + 14 = %5b", a);
		$display("3 * 8 = %5b", b);
		$display("33 / 5 = %3b", c);
		$display("25 - 11 = %4b", d);
		$display("2 * 8 + 7 - 1 = %5b", e);
	end //-- main
	
endmodule //-- test