// -------------------------
// Exercicio04
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "diversos.v"

module testContDecaDec;
	wire [5:0] s;
	reg x;
	reg clear;
	wire pulse; 
	
	clock clk(pulse);
	
	contDecaDec CONT1(s, x, pulse, clear);
	
	initial begin
		
		$display("Exercicio04 - Djonatas Tulio Rodrigues Costa - 440954");
		
		#1 clear = 1;
		#1 clear = 0;
		#1 x = 1;
		
		$display("\nBinario	Decimal\n");
		$monitor("%6b    %d", s, s);
		
		#195 $finish;
	end
endmodule // testContDecaDec