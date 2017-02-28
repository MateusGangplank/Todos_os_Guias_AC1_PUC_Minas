// Exemplo0043 - CLOCK
// Nome: Tiago Moreira
// Matricula: 438948

//------------------------
// Test Clock generator(3)
//------------------------

`include "Clock.v"

module pulse1(signal, clock);
	input clock;
	output signal;
	reg signal;
	
	always @ (posedge clock)
		begin
			signal = 1'b1;
		#4	signal = 1'b0;
		#4	signal = 1'b1;
		#4	signal = 1'b0;
		#4	signal = 1'b1;
		#4	signal = 1'b0;
		end
		
endmodule //pulse

module pulse2(signal, clock);
	input clock;
	output signal;
	reg signal;
	
	always @ (posedge clock)
		begin
			signal = 1'b1;
		#5	signal = 1'b0;
		end
		
endmodule //pulse

module pulse3(signal, clock);
	input clock;
	output signal;
	reg signal;
	
	always @ (negedge clock)
		begin
				signal = 1'b1;
		#15	signal = 1'b0;
		#15	signal = 1'b1;
		end
		
endmodule //pulse

module pulse4(signal, clock);
	input clock;
	output signal;
	reg signal;
	
	always @ (negedge clock)
		begin
				signal = 1'b1;
		#20	signal = 1'b0;
		#20	signal = 1'b1;
		#20	signal = 1'b0;
		end
		
endmodule //pulse

// --------------
//	Test clock
// --------------
module Exemplo0043;
	
	wire clk;
	clock CLK1(clk);
	
	wire p1,p2,p3,p4;
	
	pulse1 pls1(p1,clk);
	pulse2 pls2(p2,clk);
	pulse3 pls3(p3,clk);
	pulse4 pls4(p4,clk);
	
	initial
		begin
		
		$display("Exemplo0043 - Pulses synchronized with clock\nNome: Tiago Moreira\nMatricula: 438948");
		$dumpfile("Exemplo0043.vcd");
		$dumpvars(1,clk,p1,p2,p3,p4);
		
		#480 $finish;
		end

endmodule //testClock

/* -- Documentacao complementar
 
 		Historico
 Nome						Data				Modificacao
 Exemplo0041			16/09/2011		Esboco Clock generator
 Exemplo0042			17/09/2011		Esboco Clock generator, com Pulse e Trigger
 Exemplo0043			17/09/2011		Esboco Clock generator, com geradores de pulsos diferentes

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