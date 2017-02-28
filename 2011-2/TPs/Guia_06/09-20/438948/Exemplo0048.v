// Exemplo0048 - CLOCK
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
	
	always @ (clock)
		begin
			signal = 1'b0;
		#3	signal = 1'b1;
		#3	signal = 1'b0;
		#3	signal = 1'b1;
		end
		
endmodule //pulse

// --------------
//	Test clock
// --------------
module Exemplo0046;
	
	wire clk;
	clock CLK1(clk);
	
	wire p;
	
	pulse pls1(p,clk);
	
	initial
		begin
		
		$display("Exemplo0048 - Pulse synchronized with clock\nNome: Tiago Moreira\nMatricula: 438948");
		$dumpfile("Exemplo0048.vcd");
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
 Exemplo0045			18/09/2011		Esboco Clock generator, pulso com triplo da frequencia do clock
 Exemplo0046			18/09/2011		Esboco Clock generator, pulso com frequencia de 6 unidades de tempo sincronizado com a borda de subida do clock
 Exemplo0047			18/09/2011		Esboco Clock generator, pulso com frequencia de 6 unidades de tempo sincronizado com a borda de descida do clock
 Exemplo0048			18/09/2011		Esboco Clock generator, pulso com frequencia de 6 unidades de tempo sincronizado com a borda de subida e descida do clock

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