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

module Exercicio2 (signal, clock);
	input clock;
	output signal;
	reg signal;
	
	initial begin
		signal = 1'b0;
	end
	
	always begin
		#48 signal = ~signal;
	end
endmodule

module teste;
	wire  clock;
	clock cck1 ( clock );
	wire saida;
 
	Exercicio2 EX02 (saida,clock);

	initial begin
		$display ( "Rafael Moreira Melo-405834" );
		$dumpvars (1,clock,saida);
		#240 $finish;
  		end
endmodule 