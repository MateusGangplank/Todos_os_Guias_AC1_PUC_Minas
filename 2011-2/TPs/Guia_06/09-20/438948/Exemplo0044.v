// Exemplo0044 - CLOCK
// Nome: Tiago Moreira
// Matricula: 438948

//----------------------
// Test Clock generator
//----------------------

`include "Clock.v"

module pulse(signal, clock);
	input clock;
	output signal;
	reg signal;
	
	initial begin
		signal = 1'b0;
	end
	
	always @ (negedge clock)
		begin
			signal = ~(signal);
		end
		
endmodule //pulse

// --------------
//	Test clock
// --------------
module Exemplo0044;
	
	wire clk;
	clock CLK1(clk);
	
	wire p;
	
	pulse pls1(p,clk);
	
	initial
		begin
		
		$display("Exemplo0044 - Pulse synchronized with clock\nNome: Tiago Moreira\nMatricula: 438948");
		$dumpfile("Exemplo0044.vcd");
		$dumpvars(1,clk,p);
		
		#120 $finish;
		end

endmodule //testClock

/* -- Documentacao complementar
 
 		Historico
 Nome						Data				Modificacao
 Exemplo0041			16/09/2011		Esboco Clock generator
 Exemplo0042			17/09/2011		Esboco Clock generator, com Pulse e Trigger
 Exemplo0043			17/09/2011		Esboco Clock generator, com geradores de pulsos diferentes
 Exemplo0044			17/09/2011		Esboco Clock generator, pulso com metade da frequencia do clock

			Testes e Resultados

 Exemplo0041
		Variacao esperada ao longo do tempo:
		Tempo (unidades de tempo)	Valor do clock
		0									0
		10									0
		12									1 (transicao entre 0 e 1)
		23									1
		24									0 (transicao entre 1 e 0)
		119								1
*/