// ------------------------- 
// Guia10_02 - Memoria RAM 2x4
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679
// ------------------------- 

//----------------------------------------------------
// -- Ram 1x4,1x8, 2x4, Clock, Plexers,  FlipFlop JK
//----------------------------------------------------
`include "memorias.v"

//-----------------------------
// -- RAM 2x4
//-----------------------------
module mem2x4(output [3:0]s, input [3:0]x, input clk,input readWrite, input address, input clear);
	reg demuxIn;
	wire w0,w1;
	wire [3:0]aux0;
	wire [3:0]aux1;
	
	dmx1bit DMX1(w0,w1,demuxIn,address);
	
	ram1x4 RAM1(aux0,x,clk,readWrite,w0,clear);
	ram1x4 RAM2(aux1,x,clk,readWrite,w1,clear);
	
	mux1bit MUX1(s,aux0,aux1,address);
	
	initial begin
		demuxIn = 1'b1;
	end
endmodule //mem2x4


//-----------------------------
// -- Module Teste 
//-----------------------------
module Teste;
	reg [3:0]IN;
	reg RW , ADD, clear;
	wire clk;
	wire [3:0] OUT;
	
	clock clk1(clk);
	mem2x4 RAM1(OUT,IN,clk,RW,ADD,clear);
	
	initial begin
		IN = 4'b1110;
		clear = 0;
		ADD = 0;
		RW = 0;
		$display("Guia10_02 - Bruno Cezar Andrade Viallet - 396679"); 
		$display("Clock	Ler/Escrever	Endereco	Entrada	  Saida");
		$monitor("  %b	    %b		   %b		 %4b	   %4b",clk,RW,ADD,IN,OUT);
		#1 clear = 1;
		#1 clear = 0;
		#1 RW = 1;
		#3 RW = 0; IN = 4'b1011;
		#1 ADD = 1;
		#1 RW = 1;
		#1 RW = 0;
		#1 ADD = 0;
		#1 ADD = 1;
		#1 ADD = 0;
		#1 ADD = 1;
		#1 $finish;
	end
endmodule //Teste