// -------------------------
// Exemplo0044 - pulse
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Observações:
// A cada 3 ciclos do clock, vê-se
// 1 ciclo do módulo pulse, ou seja,
// a frequência do pulse é um terço
// da frequência do clock.
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
	always @(clock)
	begin
		#36 signal = ~signal;
	end
endmodule // pulse

module Exemplo0044;
	wire clock;
	clock clk (clock);

	wire p;
	pulse pls (p, clock);

	initial begin
		$display("Exemplo0044 - Daniel Telles McGinnis - 435042");

		$dumpfile ("Exemplo0044.vcd");
		$dumpvars (1, clock, p);

		#480 $finish;
	end
endmodule // Exemplo0044