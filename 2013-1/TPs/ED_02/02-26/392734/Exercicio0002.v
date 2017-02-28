// ---------------------------------------
// Exercicio0002 - Guia 02
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ---------------------------------------

module test;
	reg [6:0]a;
	reg [5:0]b;
	reg [3:0]c;
	reg [6:0]d;
	reg [9:0]e;
	
//--- main
	initial begin:main
		$display("Exercicio0002 - João Henrique - 392734");
		
		a = 6'b100110 + 5'b11011;
		b = 5'b11101 + 'o25;
		c = 'o1234 / 'h4C;
		d = 'h1BA - 9'b101110011;
		e = 25 * 'o32 + 'h8A;
		
		$display("\nOperações:\n");
		$display("b100110 + b11011 = b%7b", a);
		$display("b11101 + o25 = b%6b", b);
		$display("o1234 / h4C = b%4b", c);
		$display("h1BA - b101110011 = b%7b", d);
		$display("d25 * o32 + h8A = b%10b", e);
	end //-- main
	
endmodule //-- test