// -------------------------
// Exemplo0045 - pulse
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Observações:
// A cada ciclo do clock, vê-se
// 2 ciclos do módulo pulse, ou seja,
// a frequência do pulse é o dobro
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
		signal = ~signal;
		#6 signal = ~signal;
	end
endmodule // pulse

module Exemplo0045;
	wire clock;
	clock clk (clock);

	wire p;
	pulse pls (p, clock);

	initial begin
		$display("Exemplo0045 - Daniel Telles McGinnis - 435042");

		$dumpfile ("Exemplo0045.vcd");
		$dumpvars (1, clock, p);

		#480 $finish;
	end
endmodule // Exemplo0045