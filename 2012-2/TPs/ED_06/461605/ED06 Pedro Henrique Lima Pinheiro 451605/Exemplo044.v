// ----------------------------------
// -- Pedro Henrique Lima Pinheiro --
// -- 451605 ------------------------
// -- test clock generator (4) ------
// ----------------------------------
`include "clock.v"

module pulse (signal, clock);
	input clock;
	output signal;
	reg signal;
	
	always @ (clock)
	begin
		signal = 1'b0;
		#4 signal = 1'b1;
		#4 signal = 1'b0;
		#4 signal = 1'b1;
		#4 signal = 1'b0;
		#4 signal = 1'b1;
		#4 signal = 1'b0;
		#4 signal = 1'b1;
		#4 signal = 1'b0;
	end
endmodule//pulse

module Exemplo0044;
	wire clock;
	clock clk ( clock );
	wire sinal;
	pulse p1(sinal, clock);
	
	initial begin
		$dumpfile("Exemplo0044.vcd");
		$dumpvars( 1, clock, sinal );
		#48 $finish;
	end
endmodule //Exemplo0044