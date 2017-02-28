// ------------------------------
// Guia 11
// Nome: Fabricio Rodrigues de Souza
// Matricula: 412737


`include "Exercicio01.v"
`include "Exercicio02.v"
`include "Exercicio03.v"
`include "Exercicio04.v"
`include "Exercicio05.v"

module teste_guia_11;
	
	reg   clk, reset, x;
	wire  m1, m2, m3, m4, m5;

	Exercicio01 NUM1 ( m1, x, clk, reset );
 	Exercicio02 NUM2 ( m2, x, clk, reset );
	Exercicio03 NUM3 ( m3, x, clk, reset );
	Exercicio04 NUM4 ( m4, x, clk, reset );
	Exercicio05 NUM5 ( m5, x, clk, reset );

	initial
	begin
		$display ( "Guia 11 - Fabricio Rodrigues de Souza - 412737\nTime\t\tX\tSequencia 101 com intersecao\tSequencia 0101 sem intersecao\tSequencia 1001 com intersecao\tSequencia 101 ou 010\tSequencia 000 ou 111" );

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

endmodule // teste_guia_11
