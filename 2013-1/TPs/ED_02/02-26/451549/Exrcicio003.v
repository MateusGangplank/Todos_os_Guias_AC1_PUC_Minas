// ---------------------------------------------------------------------
// Exercicio 002 - BASE
// Débora Deslandes de Almeida Batista
// Matricula : 451549
// ---------------------------------------------------------------------

// ---------------------------------------------------------------------
// -- test number
// ---------------------------------------------------------------------

module complementoDe2;

// -- definir bits dos registradores
	reg [0:4]a;
	reg [0:3]b;
	reg [0:2]c;
	reg [0:4]d;
	reg [0:10]e;

// -- parte principal
	initial begin: main
		$display ("Exercicio 002 - Débora Deslandes de Almeida Batista - 451549");
	
		a = -'b101010;
		b = -'o25;
		c = -27;
		d = -'h2C;
		e = -(25-35);

		$display ("\na = %b",a);
                $display ("\nb = %b",b);
                $display ("\nc = %b",c);
                $display ("\nd = %b",d);
                $display ("\ne = %b",e);

	end
endmodule
