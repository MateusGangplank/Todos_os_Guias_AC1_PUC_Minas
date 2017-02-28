//-------------------------------------
// Exercicio0106
// Nome: Oswaldo Oliveira Paulino 
// Matricula: 382175
// ------------------------- 

`include "Exercicio103.v" 
	
module Exercicio106 ( output [15:0]saida, input [15:0]inp, input clk, input addr, input rw,  input clr );
	
	Exercicio103 mem1(saida[7:0], inp[7:0], clk, addr, rw, clr);
	Exercicio103 mem2(saida[15:8], inp[15:8], clk, addr, rw, clr);

endmodule	

module Ex106; 
	
	reg [15:0]entrada;
	reg clk;
	reg addr;
	reg rw;
	reg clr; 
	wire [15:0]saida;
	 
	Exercicio106 mod1 (saida, entrada, clk, addr, rw, clr);
	
	initial begin
	$display("Entrada\tClk\tAddr\tR/W\tClr\tSaida\n");
	#1 entrada = 1110000010100010;  clk = 1;  addr = 0;  rw = 1;  clr = 1;
	$monitor("%4b\t%1b\t%1b\t%1b\t%1b\t%4b",entrada, clk, addr, rw, clr, saida);
	#1 entrada = 1101111111100000;  clk = 1;  addr = 1;  rw = 1;  clr = 0;
	end		

endmodule 
			 