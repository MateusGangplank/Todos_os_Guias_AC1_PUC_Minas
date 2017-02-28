//Extra 2
//Wadson Ferreira
//460631

`include "clock.v"

module pulse(output sinal,input clock);
	reg sinal;
	always @ (negedge clock)
	begin
		sinal=1'b1;
		#5 sinal=#1'b0;
	end
endmodule

module Exemplo0047;
	wire clock;
	clock ckl(clock);
	wire pulso;
	pulse P(pulso,clock);
	initial begin
		$dumpfile("Exemplo0047.vcd");
		$dumpvars(1,clock,pulso);
		#100 $finish;
	end
endmodule
