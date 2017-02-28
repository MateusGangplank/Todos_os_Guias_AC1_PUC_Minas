// ---------------------------------------
// Exercicio0003 - Guia 02
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ---------------------------------------

module test;
	reg [5:0]a;
	reg [4:0]b;
	reg [4:0]c;
	reg [5:0]d;
	reg [5:0]e;
	
//--- main
	initial begin:main
		$display("Exercicio0003 - João Henrique - 392734");
		
		a = ~6'b100110 + 1;
		b = ~5'o24 + 1;
		c = ~25 + 1;
		d = ~6'h2D + 1;
		e = (27 + (~37)) + 1;
		
		$display("\nComplemento de 2:\n");
		$display("100110(2) = %6b", a);
		$display("24(o) = %5b", b);
		$display("25 = %5b", c);
		$display("2D(h) = %6b", d);
		$display("27 - 37 = %6b", e);
	end //-- main
	
endmodule //-- test