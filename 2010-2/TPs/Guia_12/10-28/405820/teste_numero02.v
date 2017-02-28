// ------------------------------
// Guia 12
// Nome: Mariana Ramos de Brito
// Matricula: 405820
// ------------------------------


// ---------------------------
// --- conversor paralelo-serie
// ---------------------------

module flipflopD ( q, d, clk, pr );

	output q;
	input  d;
	input  clk;
	input pr;

	reg    q = 0;		
	
	always @( posedge clk or pr)
	begin
		if (pr)
			q <= 1;
		else
			q <= d;			
	end // always borda de subida do clock

endmodule // flipflopD



module teste_numero02;

	reg   clk, load, d4, d3, d2, d1, d0;
	wire  q1, q2, q3, q4, q5, pr1, pr2, pr3, pr4, pr5;
	
	//definir presets
	and AND1 (pr1, load, d4);
	and AND2 (pr2, load, d3);
	and AND3 (pr3, load, d2);
	and AND4 (pr4, load, d1);
	and AND5 (pr5, load, d0);
	
	// definir flipflops
	flipflopD FLIP1 (q1, 0, clk, pr1);
	flipflopD FLIP2 (q2, q1, clk, pr2);
	flipflopD FLIP3 (q3, q2, clk, pr3);
	flipflopD FLIP4 (q4, q3, clk, pr4);
	flipflopD FLIP5 (q5, q4, clk, pr5);

	initial
	begin
		$display ( "Guia 12 - Mariana Ramos de Brito - 405820\nNumero 02: conversor paralelo-serie.\n\nTempo\tLoad\t\tD4\tD3\tD2\tD1\tD0\t\tA\tB\tC\tD\tE" );

	// initial values
		clk = 1;
		load = 0;
		d4 = 0;
		d3 = 0;
		d2 = 0;
		d1 = 0;
		d0 = 0;

	// input signal changing
		#10  load = 1; d4 = 1; d3 = 0; d2 = 1; d1 = 1; d0 = 0;
		#10  load = 0; d4 = 1; d3 = 0; d2 = 1; d1 = 1; d0 = 0;
		#10  load = 1; d4 = 0; d3 = 0; d2 = 1; d1 = 0; d0 = 0;
		#10  load = 0; d4 = 1; d3 = 1; d2 = 0; d1 = 1; d0 = 0;
		#10  load = 0; d4 = 1; d3 = 1; d2 = 0; d1 = 1; d0 = 0;
		#10  load = 0; d4 = 1; d3 = 1; d2 = 0; d1 = 1; d0 = 0;
		#10  load = 1; d4 = 1; d3 = 1; d2 = 1; d1 = 1; d0 = 1;
		#10  load = 1; d4 = 0; d3 = 0; d2 = 1; d1 = 1; d0 = 0;
		
		#5 $finish;
	
	end // initial

	always
		#5 clk = ~clk;

	always @( negedge clk )
	begin
		$display ( "%4d\t\t%b\t\t%b\t%b\t%b\t%b\t%b\t\t%b\t%b\t%b\t%b\t%b\n", $time, load, d4, d3, d2, d1, d0, q1, q2, q3, q4, q5 );
	end // always at positive edge clocking changing

endmodule // teste_numero02