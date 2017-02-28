//Exemplo 0045
//Nome: Vitor Angelo Lima
//Matricula: 451621

`include "clock.v"
module pulso1 ( output sinal, input clock );
	reg sinal;
	always @ ( clock ) begin
		sinal = 1'b0;
		#6 sinal = ~sinal;
		#6 sinal = ~sinal;
		#6 sinal = ~sinal;
	end

endmodule

module principal;
	wire clock;
	wire p1;
	clock clk ( clock );
	pulso1 ps1 ( p1, clock );
	
	initial begin
		$dumpfile ( " Exemplo0045.vcd" );
		$dumpvars ( 1, clock, p1 );
		#300 $finish;
	end

endmodule
