//Guia 09
//Rafael Moreira Melo-405834

module clock (clk);
	output clk;
	reg clk;

	initial begin
		clk = 1'b0;
	end
	
	always begin
		#12 clk = ~clk;
	end
endmodule

module Exercicio1 (signal, clock);
	input clock;
	output signal;
	reg signal;
	
	initial begin
		signal = 1'b0;
	end
	
	always begin
		#6 signal = ~signal;
	end
endmodule

module teste;

	wire  clock;
	clock cck1 ( clock );
	wire saida;
 
	Exercicio1 EX1 (saida,clock);

	initial begin
		$display ( "Rafael Moreira Melo-405834" );
		$dumpvars (1,clock,saida);
		#60 $finish;
 	end
endmodule 