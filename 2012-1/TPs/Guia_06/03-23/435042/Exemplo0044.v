// -------------------------
// Exemplo0044 - pulse
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Observa��es:
// A cada 3 ciclos do clock, v�-se
// 1 ciclo do m�dulo pulse, ou seja,
// a frequ�ncia do pulse � um ter�o
// da frequ�ncia do clock.
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