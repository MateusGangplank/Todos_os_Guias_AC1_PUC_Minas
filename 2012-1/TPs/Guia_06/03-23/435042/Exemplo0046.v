// -------------------------
// Exemplo0046 - pulse
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Observações:
// A cada subida do clock, vê-se
// uma subida do pulse que dura 5
// unidades de tempo.
// -------------------------
// pulse
// -------------------------
`include "clock.v"

module pulse (signal, clock);
	input clock;
	output signal;
	reg signal;
        initial begin
                signal = 0;
        end
	always @(posedge clock)
	begin
		signal = ~signal;
		#5 signal = ~signal;
	end
endmodule // pulse

module Exemplo0046;
	wire clock;
	clock clk (clock);

	wire p;
	pulse pls (p, clock);

	initial begin
		$display("Exemplo0046 - Daniel Telles McGinnis - 435042");

		$dumpfile ("Exemplo0046.vcd");
		$dumpvars (1, clock, p);

		#480 $finish;
	end
endmodule // Exemplo0046