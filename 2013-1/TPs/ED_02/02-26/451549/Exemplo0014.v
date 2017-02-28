// --------------------------------------------------------------------------------
// Exemplo0014 - BASE
// Débora Deslandes de Almeida Batista
// Matrícula: 4515449
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// test number system
// --------------------------------------------------------------------------------

module test_base_01;
// ------------------------------------------------------------------ definir dados

	reg [2:0]a;
	reg [3:0]b;
	reg [4:0]c;
	reg [4:0]d;

// ---------------------------------------------------------------- parte principal

	initial begin
		$display ("\nExemplo 0014 - Débora Deslanes de Almeida");
		$display ("\nMatricula : 451549");
		$display ("\nTest number system");

		a = 5;
		b = 10;
		c = 15;
		d = 20;

		$display ("\nPositive Value");
		$display ("\na = %d = %3b",a,a);
		$display ("\nb = %d = %4b",a,a);
		$display ("\nc = %d = %5b",a,a);
		$display ("\nb = %d = %4b",b,b);
		$display ("\nc = %d = %5b",c,c);
		$display ("\nd = %d = %5b",d,d);
		$display ("\nd = %d = %5o",d,d);
		$display ("\nd = %d = %5h",d,d);
		
		a = -5;
		b = -5;
		c = -5;

		$display("\nNegative value");
		$display("\na = -5 [3] = %d = %3b", a, a);
		$display("\nb = -5 [4] = %d = %4b", b, b);
		$display("\nc = -5 [5] = %d = %5b", c, c);

		a = ~5+1;
		b = ~5+1;
		c = ~5+1;

		$display("\nNegative mixed expression");
		$display("\na = %d = %3b", a, a);
		$display("\nb = %d = %4b", b, b);
		$display("\nc = %d = %5b", c, c);

		a = 5 + 3;
		b = 5 + 3;
		c = 10 - 5 + 25 + 3 + 1;

		$display("\nOverflow");
		$display("\na = %d = %3b", a, a);
		$display("\nb = %d = %4b", b, b);
		$display("\nc = %d = %5b", c, c);

	end
endmodule

