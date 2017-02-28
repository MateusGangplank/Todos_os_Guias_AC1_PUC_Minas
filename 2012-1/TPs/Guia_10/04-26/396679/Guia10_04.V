// ------------------------- 
// Guia10_04 - Memoria RAM 2x8
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679
// ------------------------- 

//----------------------------------------------------
// -- Ram 1x4,1x8, 2x4, Clock, Plexers,  FlipFlop JK
//----------------------------------------------------
`include "memorias.v"

//-----------------------------
// -- RAM 2x8
//-----------------------------
module mem2x8(output [7:0]s, input [7:0]x, input clk,input readWrite, input address, input clear);
	reg entradaDmx;
	wire w0,w1;
	wire [7:0]aux0,aux1;
	
	dmx1bit DMX1(w0,w1,entradaDmx,address);
	
	ram2x4 RAM1(aux0[3:0],x[3:0],clk,readWrite,w0,clear);
	ram2x4 RAM2(aux0[7:4],x[7:4],clk,readWrite,w0,clear);
	ram2x4 RAM3(aux1[3:0],x[3:0],clk,readWrite,w1,clear);
	ram2x4 RAM4(aux1[7:4],x[7:4],clk,readWrite,w1,clear);
	
	mux1bit2 MUX1(s,aux0,aux1,address);
	
	initial begin
		entradaDmx = 1'b1;
	end

endmodule //mem2x8

//-----------------------------
// -- Module Teste 
//-----------------------------
module Teste;
	reg [7:0]IN;
	wire [7:0]OUT;
	wire clk;
	reg RW, ADD, clear;
	
	clock clk1(clk);
	
	mem2x8 RAM1(OUT,IN,clk,RW,ADD,clear);
	
	initial begin
		IN = 8'b11001110;
		RW = 0;
		ADD = 0;
		clear = 0;
		$display("Guia10_04 - Bruno Cezar Andrade Viallet - 396679"); 
		$display("Clock	Ler/Escrever	Endereco	Entrada    Saida");
		$monitor("  %b	    %b		   %b		%4b  %4b",clk,RW,ADD,IN,OUT);
		#1 clear = 1;
		#1 clear = 0;
		#1 RW = 1;
		#3 RW = 0;
		#1 IN = 8'B10111100;
		#1 ADD = 1;
		#1 RW = 1;
		#1 RW = 0; IN = 1;
		#1 ADD = 0;
		#1 ADD = 1;
		#1 ADD = 0;
		#1 ADD = 1;
		#1 clear = 1;
		#1 clear = 0;
		#1 $finish;
		
	end
endmodule //Teste