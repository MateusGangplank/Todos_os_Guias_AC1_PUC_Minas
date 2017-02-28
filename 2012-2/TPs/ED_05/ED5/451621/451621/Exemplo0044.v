//Exemplo 0044
//Nome: Vitor Angelo Lima
//Matricula: 451621

`include "clock.v"
module pulso1 ( output sinal, input clock );
	reg sinal;
	always @ ( clock ) begin
		sinal = 1'b1;
		#4 sinal = ~sinal;
		#4 sinal = ~sinal;
		#4 sinal = ~sinal;
		#4 sinal = ~sinal;
		#4 sinal = ~sinal;
	end
endmodule

module principal;
	wire clock;
	wire p1;
	clock clk ( clock );
	pulso1 ps1 ( p1, clock );
	
	initial begin
		$dumpfile ( " Exemplo0044.vcd" );
		$dumpvars ( 1, clock, p1 );
		#300 $finish;
	end

endmodule
