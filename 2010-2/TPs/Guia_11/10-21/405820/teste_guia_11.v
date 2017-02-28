// ------------------------------
// Guia 11
// Nome: Mariana Ramos de Brito
// Matricula: 405820
// ------------------------------

`include "numero01_seq101_mealy.v"
`include "numero02_seq0101_moore.v"
`include "numero03_seq1001_mealy.v"
`include "numero04_seq010_101.v"
`include "numero05_seq000_111.v"

module teste_guia_11;
	
	reg   clk, reset, x;
	wire  m1, m2, m3, m4, m5;

	numero01_seq101_mealy NUM1 ( m1, x, clk, reset );
 	numero02_seq0101_moore NUM2 ( m2, x, clk, reset );
	numero03_seq1001_mealy NUM3 ( m3, x, clk, reset );
	numero04_seq010_101 NUM4 ( m4, x, clk, reset );
	numero05_seq000_111 NUM5 ( m5, x, clk, reset );

	initial
	begin
		$display ( "Guia 11 - Mariana Ramos de Brito - 405820\nTime\t\tX\tSequencia 101 com intersecao\tSequencia 0101 sem intersecao\tSequencia 1001 com intersecao\tSequencia 101 ou 010\tSequencia 000 ou 111" );

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
