// ---------------------------------------
// Exercicio0004 - Guia 02
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ---------------------------------------

module test;
	reg [7:0]a;
	reg [6:0]b;
	reg [5:0]c;
	reg [4:0]d;
	reg [7:0]e;
	
//--- main
	initial begin:main
		$display("Exercicio0004 - João Henrique - 392734");
		
		a = ~6'b101111 + 1;
		b = ~6'b111001 + 1; //321(4)
		c = ~25 + 1;
		d = ~4'hD + 1;
		e = ~5'o24 + 1;
		
		$display("\nComplemento de 2:\n");
		$display("101111(2) = %8b", a);
		$display("321(4) = %7b", b);
		$display("25 = %6b", c);
		$display("D(h) = %5b", d);
		$display("24(o) = %8b", e);
	end //-- main
	
endmodule //-- test