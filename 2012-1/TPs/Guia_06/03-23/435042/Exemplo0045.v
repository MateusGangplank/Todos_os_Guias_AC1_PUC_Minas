// -------------------------
// Exemplo0045 - pulse
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Observa��es:
// A cada ciclo do clock, v�-se
// 2 ciclos do m�dulo pulse, ou seja,
// a frequ�ncia do pulse � o dobro
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