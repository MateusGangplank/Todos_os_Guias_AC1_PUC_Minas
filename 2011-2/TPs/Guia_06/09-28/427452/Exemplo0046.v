// -------------------------
// Exemplo0046 – CLOCK
// Nome: Pedro Henrique A. M. carvalho
// Matricula: 427452
// -------------------------

// ---------------------------
// -- test clock generator
// ---------------------------

module clock ( clk );
	output clk;
	reg clk;
	initial
		begin
			clk = 1'b0;
		end
	
	always
		begin
			#12 clk = ~clk;
		end

endmodule // clock ( )



module pulse1 ( signal, clock1 );
	input   clock1;
	output signal;
	reg      signal;
	
	always @ ( posedge clock1 )
		begin
			signal = 1'b1;
			#6  signal = 1'b0;
			#6  signal = 1'b1;
			#6  signal = 1'b0;
			#6  signal = 1'b1;
			#6  signal = 1'b0;
		end
endmodule // pulse


module Exemplo0046;

	wire clk;
	clock CLK1 ( clk );

	wire	pulse;

	pulse1	pls1	( pulse, clk );

	initial begin
		$dumpfile ( " Exemplo0046.vcd" );
		$dumpvars ( clk, pulse );
	//	$dumpvars;
		#120 $finish;

	end
endmodule // Exemplo0046