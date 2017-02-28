// -------------------------
// Exemplo0043 - clock 3
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Observações:
// pls1: Cada subida de clock provoca
// 3 ciclos de pulso, levando 24 unidades
// de tempo para completar.
// pls2: Cada subida de clock provoca
// 1 ciclo de pulso, levando 5 unidades
// de tempo para voltar para zero.
// pls3: Cada descida do clock provoca
// um ciclo e meio de pulso, levando teoricamente
// 30 segundos para completar, mas como pls3
// define 1 como valor inicial e final,
// o sinal fica em 1 por mais tempo do
// que em 0.
// pls4: Cada descida do clock provoca
// 2 ciclos de pulso, levando teoricamente
// 60 unidades de tempo para completar, mas
// como a frequência deste pulso é diferente
// da frequência do clock, você verá que leva
// 12 unidades de tempo para voltar para 1 após
// ter voltado a 0.
// -------------------------
// clock 3
// -------------------------
`include "clock.v"

module pulse1 (signal, clock);
	input clock;
	output signal;
	reg signal;

	always @(posedge clock)
	begin
		signal = 1'b1;
		#4 signal = 1'b0;
		#4 signal = 1'b1;
		#4 signal = 1'b0;
		#4 signal = 1'b1;
		#4 signal = 1'b0;
	end
endmodule // pulse1

module pulse2 (signal, clock);
	input clock;
	output signal;
	reg signal;

	always @(posedge clock)
	begin
		signal = 1'b1;
		#5 signal = 1'b0;
	end
endmodule // pulse2

module pulse3 (signal, clock);
	input clock;
	output signal;
	reg signal;

	always @(negedge clock)
	begin
		signal = 1'b1;
		#15 signal = 1'b0;
		#15 signal = 1'b1;
	end
endmodule // pulse3

module pulse4 (signal, clock);
	input clock;
	output signal;
	reg signal;

	always @(negedge clock)
	begin
		signal = 1'b1;
		#20 signal = 1'b0;
		#20 signal = 1'b1;
		#20 signal = 1'b0;
	end
endmodule // pulse4

module Exemplo0043;
	wire clock;
	clock clk (clock);

	wire p1, p2, p3, p4;

	pulse1 pls1 (p1, clock);
	pulse2 pls2 (p2, clock);
	pulse3 pls3 (p3, clock);
	pulse4 pls4 (p4, clock);

	initial begin
		$display("Exemplo0043 - Daniel Telles McGinnis - 435042");

		$dumpfile ("Exemplo0043.vcd");
		$dumpvars (1, clock, p1, p2, p3, p4);

		#480 $finish;
	end
endmodule // Exemplo0043