//gerador de pulso
//Wadson Ferreira
//460631

`include "clock.v"

module pulso1(output sinal, input clock);
	reg sinal;
	always @ (posedge clock)
	begin
		   sinal=1'b0;
		#4 sinal = ~sinal;
		#4 sinal = ~sinal;
		#4 sinal = ~sinal;
	end
endmodule

module pulso2(output sinal, input clock);
	reg sinal;
	always @ (posedge clock)
	begin
		   sinal=1'b0;
		#8 sinal = ~sinal;
		#8 sinal = ~sinal;
		#8 sinal = ~sinal;
	end
endmodule

module pulso3(output sinal, input clock);
	reg sinal;	
	always @ (posedge clock)
	begin
		    sinal=1'b0;
		#12 sinal = ~sinal;
		#12 sinal = ~sinal;
		#12 sinal = ~sinal;
	end
endmodule

module Exemplo0043;
	wire clock;
	clock clk(clock);
	wire pul1, pul2, pul3;
	pulso1 p1(pul1,clock);
	pulso2 p2(pul2,clock);
	pulso3 p3(pul3,clock);
	initial begin
		$dumpfile("Exemplo0043.vcd");
		$dumpvars(1,clock,pul1,pul2,pul3);
		#480 $finish;
	end
endmodule
