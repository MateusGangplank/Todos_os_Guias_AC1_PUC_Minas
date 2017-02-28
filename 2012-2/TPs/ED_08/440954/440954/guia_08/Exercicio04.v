// -------------------------
// Exercicio04
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "diversos.v"

module testleftRotate;
	wire [4:0] s;
	reg d;
	wire clock; 

	clock clk ( clock ); 
	leftRotate LRO1 (s, d, clock);
	
	initial begin
		$display("d  Clock  Saida\n");
		d = 1;
		$monitor("%1b    %1b    %b", d, clock, s);
		#25 d = 0;
		#240 $finish;
	end
	
endmodule // testleftRotate