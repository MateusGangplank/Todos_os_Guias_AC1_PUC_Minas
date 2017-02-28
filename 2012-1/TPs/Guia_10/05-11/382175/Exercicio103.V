//-------------------------------------
// Exercicio0103
// Nome: Oswaldo Oliveira Paulino 
// Matricula: 382175
// ------------------------- 

`include "Exercicio101.v" 

module Exercicio103(output [7:0]saida, input [7:0]inp, input clk, input addr, input rw,  input clr );

	Exercicio101 mem1(saida[7:4], inp[7:4], clk, addr, rw, clr);
	Exercicio101 mem2(saida[3:0], inp[3:0], clk, addr, rw, clr);	

endmodule	

module Ex103; 

	reg [7:0]entrada;
	reg clk;
	reg addr;
	reg rw;
	reg clr; 
	wire [7:0]saida;
	
	Exercicio103 mod1 (saida, entrada, clk, addr, rw, clr);
	 
	initial begin
	$display("Entrada\t  Clk\tAddr\tR/W\tClr\tSaida\n");
	#1 entrada = 11100101;  clk = 0;  addr = 0;  rw = 0;  clr = 1;
	$monitor("%8b\t%3b\t%3b\t%3b\t%3b\t%8b",entrada, clk, addr, rw, clr, saida);
	#1 entrada = 11010000;  clk = 1;  addr = 1;  rw = 1;  clr = 0;
	end
		 
endmodule 
			 