// ------------------------- 
// Exemplo0046
// Nome: Oswaldo Oliveira Paulino 
// Matricula: 382175
// ------------------------- 

// --------------------------- 
// -- test clock generator (6) 
// --------------------------- 

`include "clock.v"

module pulse (signal, clock);
	input clock;
	output signal;
	reg signal;
	initial begin
	signal = 0;
	end
	always @(posedge clock)
	begin
	signal = ~signal;
	#5 signal = ~signal;
end
endmodule // pulse

module Exemplo0046;
	wire clock;
	clock clk (clock);
	wire p;
	pulse pul (p, clock);
	initial begin
	$dumpfile ("Exemplo0046.vcd");
	$dumpvars (1, clock, p);
	#300 $finish;
end
endmodule // Exemplo0046