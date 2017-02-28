// ------------------------------
// Guia 12
// Nome: Mariana Ramos de Brito
// Matricula: 405820
// ------------------------------


// --------------------------------------------
// --- registrador de deslocamento para a direita
// --------------------------------------------

module flipflopD ( q, d, clk );

	output q;
	input  d;
	input  clk;

	reg    q = 0;	

	always @( posedge clk )
	begin
		q <= d;			
	end // always borda de subida do clock

endmodule // flipflopD



module teste_numero01;

	reg   clk, x;
	wire  q1, q2, q3, q4, q5;
	
	// definir flipflops
	flipflopD FLIP1 (q1, x, clk);
	flipflopD FLIP2 (q2, q1, clk);
	flipflopD FLIP3 (q3, q2, clk);
	flipflopD FLIP4 (q4, q3, clk);
	flipflopD FLIP5 (q5, q4, clk);

	initial
	begin
		$display ( "Guia 12 - Mariana Ramos de Brito - 405820\nNumero 01: registrador de deslocamento para a direita.\n\nTempo\tX\tA\tB\tC\tD\tE" );

	// initial values
		clk = 1;
		x = 1;

	// input signal changing
		#10  x = 0;
		#10  x = 0;
		#10  x = 0;
		#10  x = 0;
		
		#5 $finish;
	
	end // initial

	always
		#5 clk = ~clk;

	always @( negedge clk )
	begin
		$display ( "%4d\t\t%b\t%b\t%b\t%b\t%b\t%b", $time, x, q1, q2, q3, q4, q5 );
	end // always at positive edge clocking changing

endmodule // teste_numero01