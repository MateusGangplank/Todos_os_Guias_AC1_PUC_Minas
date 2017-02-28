//Guia 09
//Rafael Moreira Melo-405834

module clock (clk);
	output clk;
	reg clk;

	initial begin
		clk = 1'b0;
	end
	
	always begin
		#1 clk = ~clk;
	end
endmodule

module Exercicio3 (signal, clock);
	input clock;
	output signal;
	reg signal;
	
	always @ ( clock ) begin
		signal = 1'b0;
		#6 signal = 1'b1;
		#6 signal = 1'b0;
	end
endmodule 

module teste;

 wire  clock;
 clock cck1 ( clock );
 wire saida;
 
 Exercicio3 EX3 (saida,clock);

 initial begin
  $display ( "Rafael Moreira Melo-405834" );
  $dumpvars (1,clock,saida);
  #120 $finish;
  
 end
 endmodule 