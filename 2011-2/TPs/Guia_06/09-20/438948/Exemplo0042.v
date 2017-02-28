// Exemplo0042 - CLOCK
// Nome: Tiago Moreira
// Matricula: 438948

//------------------------
// Test Clock generator(2)
//------------------------
module clock(clk);
	output clk;
	reg clk;
	
	initial
		begin
		clk = 1'b0;
		end
		
	always
		begin
		#12 clk = ~clk;
		end
		
endmodule //clock

module pulse(signal, clock);
	input clock;
	output signal;
	reg signal;
	
	always @ (clock)
		begin
			signal = 1'b1;
		#3	signal = 1'b0;
		#3	signal = 1'b1;
		#3	signal = 1'b0;
		end
		
endmodule //pulse

module trigger(signal, on, clock);
	input on, clock;
	output signal;
	reg signal;
	
	always @ (posedge clock & on)
		begin
			#60	signal = 1'b1;
			#60	signal = 1'b0;
		end
endmodule //trigger

// --------------
//	Test clock
// --------------
module Exemplo0042;
	
	wire clk;
	clock CLK1(clk);
	
	reg p;
	
	wire p1,t1;
	
	pulse pulse1(p1,clk);
	trigger trigger1(t1,p,clk);
	
	initial
		begin
			p = 1'b0;
		end
		
	initial
		begin
		
		$display("Exemplo0042 - Clock with pulse and trigger\nNome: Tiago Moreira\nMatricula: 438948");
		$dumpfile("Exemplo0042.vcd");
		$dumpvars(1,clk,p1,p,t1);
		
		#060 p = 1'b1;
		#120 p = 1'b0;
		#180 p = 1'b1;
		#240 p = 1'b0;
		#300 p = 1'b1;
		#360 p = 1'b0;
		#376 $finish;
		end

endmodule //testClock

/* -- Documentacao complementar
 
 		Historico
 Nome						Data				Modificacao
 Exemplo0041			16/09/2011		Esboco Clock generator
 Exemplo0042			17/09/2011		Esboco Clock generator, com Pulse e Trigger

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