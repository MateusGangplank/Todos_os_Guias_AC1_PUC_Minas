// -----------------------------------------------------------------
// Guia 11 - Arquivo de testes
// Nome: Eduardo de Abreu Fortes
// Matricula: 384047
// -----------------------------------------------------------------

`include "guia11_ex01.v"
`include "guia11_ex02.v"
`include "guia11_ex03.v"
`include "guia11_ex04.v"
`include "guia11_ex05.v"

module teste_guia_11;
	
	reg   clk, reset, x;
	wire  m1, m2, m3, m4, m5;

	guia11_ex01.v EX1 ( m1, x, clk, reset );
 	guia11_ex02.v EX2 ( m2, x, clk, reset );
	guia11_ex03.v EX3 ( m3, x, clk, reset );
	guia11_ex04.v EX4 ( m4, x, clk, reset );
	guia11_ex05.v EX5 ( m5, x, clk, reset );

	initial
	begin
		$display ( "Guia 11 - Arquivo de testes" );
		$display ( "Eduardo de Abreu Fortes - 384047" );
	// initial values
       clk   = 1;
       reset = 0;
       x     = 0;

	// input signal changing
		#10   reset = 1;
		#10  x = 1;
		#10  x = 0;
		#10  x = 0;
		#10  x = 1;
		#10  x = 0;
		#10  x = 1;
		#10  x = 1;
		#10  x = 1;
		#10  x = 1;
		#10  x = 0;
		#10  x = 1;
		#10  x = 1;
		#10  x = 1;
		#10  x = 0;
		#10  x = 1;
		#10  x = 0;
		#10  x = 0;
		#10  x = 0;
		
		#5 $finish;
	
	end // initial

	always
		#5 clk = ~clk;

	always @( posedge clk )
	begin
		$display ( "%4d\t\t%b\t\t\t%b\t\t\t\t\t%b\t\t\t\t\t%b\t\t\t\t\t%b\t\t\t\t%b", $time, x, m1, m2, m3, m4, m5 );
	end // always at positive edge clocking changing

endmodule //--fim arquivo de testes