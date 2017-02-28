// ---------------------------------------------------------------------
// Exercicio 002 - BASE
// Débora Deslandes de Almeida Batista
// Matricula : 451549
// ---------------------------------------------------------------------

// ---------------------------------------------------------------------
// -- test number
// ---------------------------------------------------------------------

module binario02;

// -- definir bits dos registradores
	reg [0:6]a;
	reg [0:5]b;
	reg [0:3]c;
	reg [0:6]d;
	reg [0:9]e;

// -- parte principal
	initial begin: main
		$display ("Exercicio 002 - Débora Deslandes de Almeida Batista - 451549");
	
		a = 'b100110 + 'b11011;
		b = 'b11101 + 'o25;
		c = 'o1234 / 'h4C;
		d = 'h1BA - 'b101110011;
		e = 25*'o32 + 'h8A;

		$display ("\na = %d = %b", a,a);
                $display ("\nb = %d = %b", b,b);
                $display ("\nc = %d = %b", c,c);
                $display ("\nd = %d = %b", d,d);
                $display ("\ne = %d = %b", e,e);

	end
endmodule
