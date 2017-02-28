// ---------------------------------------------------------------------
// Exercicio 004 - BASE
// Débora Deslandes de Almeida Batista
// Matricula : 451549
// ---------------------------------------------------------------------

// ---------------------------------------------------------------------
// -- test number
// ---------------------------------------------------------------------

module complemento2_2;

// -- definir bits dos registradores
	reg [0:7]a;
	reg [0:6]b;
	reg [0:5]c;
	reg [0:4]d;
	reg [0:7]e;

// -- parte principal
	initial begin: main
		$display ("Exercicio 004 - Débora Deslandes de Almeida Batista - 451549");
	
		a = -('b101111);
		b = -'d57;
		c = -'d25;
		d = -'hD;
		e = -'o24;

		$display ("\na = %b",a);
                $display ("\nb = %b",b);
                $display ("\nc = %b",c);
                $display ("\nd = %b",d);
                $display ("\ne = %b",e);

	end
endmodule
