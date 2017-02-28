// -------------------------
// Exercicio05
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "diversos.v"

module testParallel;
	wire [4:0] s;
	reg [4:0] d;
	reg ld;

	wire clock; 
	clock clk ( clock ); 
	parallel PRL1 (s, d, ld, clock);
	
	initial begin
		$display("  d   Load Clock Saida\n");
		d = 5'b10101;
		ld = 1;
		$monitor("%1b  %1b     %1b   %b", d, ld, clock, s);
		#25 d = 5'b00000;
		    ld = 0;
		#240 $finish;
	end

endmodule // testParallel