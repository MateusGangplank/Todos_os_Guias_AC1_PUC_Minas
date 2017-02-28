// -------------------------
// Exemplo0041 - clock
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Observações:
// A saída será a alternância do clock entre
// zero e um a cada 12 unidades de tempo.
// -------------------------
// clock
// -------------------------
module clock (clk);
	output clk;
	reg clk;

	initial begin
		clk = 1'b0;
	end

	always begin
		#12 clk = ~clk;
	end
endmodule // clock

module Exemplo0041;
	wire clk;
	clock CLK1 (clk);
	initial begin
		$display("Exemplo0041 - Daniel Telles McGinnis - 435042");

		$dumpfile ("Exemplo0041.vcd");
		$dumpvars;

		#120 $finish;
	end
endmodule // Exemplo0041