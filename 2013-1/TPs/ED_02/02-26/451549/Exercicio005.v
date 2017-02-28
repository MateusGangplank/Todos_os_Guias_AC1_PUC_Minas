// ---------------------------------------------------------------------
// Exercicio 005 - BASE
// Débora Deslandes de Almeida Batista
// Matricula : 451549
// ---------------------------------------------------------------------

// ---------------------------------------------------------------------
// -- test number
// ---------------------------------------------------------------------

module complemento2_3;

// -- definir bits dos registradores
	reg [0:7]a;
	reg [0:7]b;
	reg [0:7]c;
	reg [0:7]d;
	reg [0:7]e;

// -- parte principal
	initial begin: main
		$display ("Exercicio 005 - Débora Deslandes de Almeida Batista - 451549");
	
		a = -('b101011 - 'b1001);
		b = -('b10011 - 'o15);
		c = -('o35 - 'hC);
		d = -('hBA - 'b10111001);
		e = -('d37 - 'h1B);

		$display ("\na = %b",a);
                $display ("\nb = %b",b);
                $display ("\nc = %b",c);
                $display ("\nd = %b",d);
                $display ("\ne = %b",e);

	end
endmodule
