// -------------------------
// Exercicio03
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "diversos.v"

module testRightShr;
	wire [4:0] s;
	reg d;
	wire clock; 

	clock clk ( clock ); 
	rightShr RSHR1 (s, d, clock);
	
	initial begin
		$display("x  Clock  Saida\n");
		d = 1;
		$monitor("%1b    %1b    %b", d, clock, s);
		#25 d = 0;
		#120 $finish;
	end
endmodule // testRightShr