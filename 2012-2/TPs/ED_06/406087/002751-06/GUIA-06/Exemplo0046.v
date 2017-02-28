// --Nome: Milton costa teles da silva
// --Matricula: 002751
//----------------------------
//-- Test clock generator (6)
//----------------------------

`include "clock.v"

module pulse(signal, clock);
	input clock;
	output signal;
	reg signal;
	
	always @ (posedge clock)
	begin
		signal = 1'b0;
		#2.5 signal = 1'b1;
		#2.5 signal = 1'b0;

	end
endmodule//pulse

module Exemplo0046;
	wire clock;
	clock clk ( clock );
	wire sinal;
	pulse p1(sinal, clock);
	
	initial begin
		$dumpfile("Exemplo0046.vcd");
		$dumpvars( 1, clock, sinal );
		#480 $finish;
	end
endmodule //Exemplo0046