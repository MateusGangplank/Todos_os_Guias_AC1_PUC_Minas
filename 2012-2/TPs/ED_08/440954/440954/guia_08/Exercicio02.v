// -------------------------
// Exercicio02
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "diversos.v"

module testLeftShr1;
	wire [4:0] s;
	reg d;
	wire clock; 

	clock clk ( clock ); 
	leftShr1 LSHR1 (s, d, clock);
	
	initial begin
		$display("d  Clock  Saida\n");
		d = 1;
		$monitor("%1b    %1b    %b", d, clock, s);
		#25 d = 0;
		#120 $finish;
	end
endmodule // testLeftShr1