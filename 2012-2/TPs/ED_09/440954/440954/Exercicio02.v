// -------------------------
// Exercicio02
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "diversos.v"

module testContCre;
	wire [4:0] s;
	reg x;
	reg clear;
	wire pulse; 
	
	clock clk(pulse);
	
	contCre CONT1(s, x, pulse, 0, clear);
	
	initial begin
		
		$display("Exercicio02 - Djonatas Tulio Rodrigues Costa - 440954");

		#1 clear = 1;
		#1 clear = 0;
		#1 x = 1;
		
		$display("\nBinario	Decimal\n");
		$monitor("%5b     %d", s, s);
		

		
		#315 $finish;
	end
endmodule // testContCre