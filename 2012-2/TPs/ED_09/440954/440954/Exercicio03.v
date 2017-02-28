// -------------------------
// Exercicio03
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "diversos.v"

module testContDeca;
	wire [5:0] s;
	reg x;
	reg clear;
	wire pulse; 
	
	clock clk(pulse);
	
	contDeca CONT1(s, x, pulse, 0, clear);
	
	initial begin
		
		$display("Exercicio03 - Djonatas Tulio Rodrigues Costa - 440954");

		#1 clear = 0;
		#1 clear = 1;
		#1 x = 1;
		
		$display("\nBinario	Decimal\n");
		$monitor("%5b    %d", s, s);
		

		
		#185 $finish;
	end
endmodule // testContDeca