//Exemplo 0046
//Nome: Vitor Angelo Lima
//Matricula: 451621

`include "clock.v"
module pulso1 ( output sinal, input clock );
	reg sinal;
	always @ ( posedge clock ) begin
		sinal = 1'b1;
		#5 sinal = ~sinal;
		#5 sinal = ~sinal;
		#5 sinal = ~sinal;
	end

endmodule

module principal;
	wire clock;
	wire p1;
	clock clk ( clock );
	pulso1 ps1 ( p1, clock );
	
	initial begin
		$dumpfile ( " Exemplo0046.vcd" );
		$dumpvars ( 1, clock, p1 );
		#300 $finish;
	end

endmodule
