// -------------------------
// Exercicio01
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "diversos.v"

module testContDec;
	wire [4:0] s;
	reg x;
	reg clear;
	wire pulse; 
	
	clock clk(pulse);
	
	contDec CONT1(s, x, pulse, 0, clear);
	
	initial begin
		x = 0;
		clear = 0;
		
		$display("Exercicio01 - Djonatas Tulio Rodrigues Costa - 440954");
		
		$display("\nBinario	Decimal\n");
		$monitor("%5b     %d", s, s);
		
		#1 x = 1;
		#1 clear = 1;
		#1 clear = 0;
		
		#315 $finish;
	end
endmodule // testContDec