// Exemplo0041 - CLOCK
// Nome: Tiago Moreira
// Matricula: 438948

//------------------------
// Test Clock generator(1)
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
		
endmodule

// --------------
//	Test clock
// --------------
module Exemplo0041;
	
	wire clk;
	clock CLK1(clk);
	
	initial
		begin
		
		$display("Exemplo0041 - Clock\nNome: Tiago Moreira\nMatricula: 438948");
		$dumpfile("Exemplo0041.vcd");
		$dumpvars;
		
		#120 $finish;
		end

endmodule //testClock

/* -- Documentacao complementar
 
 		Historico
 Nome						Data				Modificacao
 Exemplo0041			16/09/2011		Esboco Clock generator

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