// -------------------------
// Exemplo0046
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- test clock generator (6)
// -------------------------

`include "clock.v"

module pulse(signal, clock);
	input clock;
	output signal;
	reg signal;
	
	always @ (posedge clock)
	begin
		   signal = 1'b1;
		#5 signal = 1'b0;
		#5 signal = 1'b1;
		#5 signal = 1'b0;
	end
endmodule // pulse

module Exemplo0046;
	wire clock;
	clock clk(clock);
	wire p1;
		
	pulse pls1(p1, clock);
	
	initial begin
		$dumpfile("Exemplo0046.vcd");
		$dumpvars(1, clock, p1);
		
		#480 $finish;
	end
endmodule // Exemplo0046