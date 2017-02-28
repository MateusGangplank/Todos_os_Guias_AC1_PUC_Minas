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
		
		a = ~6'b101010 + 1;
		b = ~5'o25 + 1;
		c = ~27 + 1;
		d = ~6'h2C + 1;
		e = (27 + (~35)) + 1;
		
		$display("\nComplemento de 2:\n");
		$display("101010(2) = %6b", a);
		$display("25(o) = %5b", b);
		$display("27 = %5b", c);
		$display("2C(h) = %6b", d);
		$display("27 - 35 = %6b", e);
	end //-- main
	
endmodule //-- test