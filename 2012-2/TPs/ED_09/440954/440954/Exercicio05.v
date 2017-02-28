// -------------------------
// Exercicio05
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "diversos.v"

module testContDecaDec;
	wire [3:0] s;
	reg clear;
	wire pulse; 
	
	clock clk(pulse);
	
	contDecaT CONT1(s, pulse, clear);
	
	initial begin

		$display("Exercicio05 - Djonatas Tulio Rodrigues Costa - 440954");
		
		#1 clear = 1;
		#1 clear = 0;
		
		$display("\nBinario	Decimal\n");
		$monitor("%4b      %d", s, s);
		
		//$monitor("%b",pulse);
		
		#185 $finish;
	end
endmodule // testContDecaDec