// --------------------------------------------------------------------------------
// Exemplo0011 - BASE
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
		$display ("\nExemplo 0011 - Débora Deslanes de Almeida");
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
	end
endmodule

