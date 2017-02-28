//-------------------------------------
// Exercicio0104
// Nome: Oswaldo Oliveira Paulino 
// Matricula: 382175
// ------------------------- 

`include "Exercicio102.v" 
	
module Exercicio104(output [7:0]saida, input [7:0]inp, input clk, input addr, input rw,  input clr );
			
	wire s1, s2;
	wire [3:0]saida1; 
	wire [3:0]saida2;
	wire [3:0]saida3; 
	wire [3:0]saida4;  
		
	Demux dmx (s1,s2, addr);
	
	Exercicio102 mem1(saida1, inp[7:4], clk, s1, rw, clr);
	Exercicio102 mem2(saida2, inp[3:0], clk, s1, rw, clr);
	Exercicio102 mem3(saida3, inp[7:4], clk, s2, rw, clr);
	Exercicio102 mem4(saida4, inp[3:0], clk, s2, rw, clr);	
	
	Mux MUX1 (saida[0], saida1[0], saida2[0], addr);
	Mux MUX2 (saida[1], saida1[1], saida2[1], addr);
	Mux MUX3 (saida[2], saida1[2], saida2[2], addr);
	Mux MUX4 (saida[3], saida1[3], saida2[3], addr);
	Mux MUX5 (saida[4], saida3[0], saida4[4], addr);
	Mux MUX6 (saida[5], saida3[1], saida4[5], addr);
	Mux MUX7 (saida[6], saida3[2], saida4[6], addr);
	Mux MUX8 (saida[7], saida3[3], saida4[7], addr);
	
endmodule	

module Ex104; 
	
	reg [7:0]entrada;
	reg clk;
	reg addr;
	reg rw;
	reg clr; 
	wire [7:0]saida;
	
	Exercicio104 mod1 (saida, entrada, clk, addr, rw, clr);
	
	initial begin
	$display("Entrada\tClk\tAddr\tR/W\tClr\tSaida\n");
	#1 entrada = 11100000;  clk = 1;  addr = 0;  rw = 1;  clr = 1;
	$monitor("%4b\t%1b\t%1b\t%1b\t%1b\t%4b",entrada, clk, addr, rw, clr, saida);
	#1 entrada = 11011111;  clk = 1;  addr = 0;  rw = 1;  clr = 0;
	end	
	 
endmodule 
			 