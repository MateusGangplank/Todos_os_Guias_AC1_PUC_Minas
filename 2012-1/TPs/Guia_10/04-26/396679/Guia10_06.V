// ------------------------- 
// Guia10_06 - Memoria RAM 1x16
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679
// ------------------------- 

//----------------------------------------------------
// -- Ram 1x4,1x8, 2x4, Clock, Plexers,  FlipFlop JK
//----------------------------------------------------
`include "memorias.v"


//-----------------------------
// -- RAM 1x16
//-----------------------------
module mem1x16(output [15:0]s, input [15:0]x, input clk, input readWrite, input address, input clear);

//---ram1x8(output [7:0]s,input[7:0]x,input clk,input readWrite,input address,input clear);
	ram1x8 RAM0(s[7:0],x[7:0],clk,readWrite,address,clear);
	ram1x8 RAM1(s[15:8],x[15:8],clk,readWrite,address,clear);
	
endmodule //mem1x16


//-----------------------------
// -- Module Teste 
//-----------------------------
module Teste;
	reg [15:0]IN;
	wire [15:0]OUT;
	reg RW, ADD, clear;
	wire clk;
	
	clock clk1(clk);
	
	mem1x16 RAM1(OUT,IN,clk,RW,ADD,clear);
	
	initial begin
		IN = 16'b1101101011001111;
		clear = 0;
		RW = 0;
		ADD = 0;
		$display("Guia10_06 - Bruno Cezar Andrade Viallet - 396679"); 
		$display("Clock	Ler/Escrever	Endereco	     Entrada           Saida");
		$monitor("  %b	    %b		   %b		%4b  %4b",clk,RW,ADD,IN,OUT);
		#1 clear = 1;
		#1 clear = 0;
		#1 RW = 1; ADD = 1;
		#3 RW = 0; IN = 16'b0000111100001111;
		#1 ADD = 0;
		#1 ADD = 1;
		#1 RW = 1;
		#1 RW = 0; IN = 16'b1111111111111111;
		#1 ADD = 0;
		#1 ADD = 1;
		#1 ADD = 0;
		#1 ADD = 1;
		#1 RW = 1;
		#1 RW = 0; IN = 0;
		#1 ADD = 0;
		#1 ADD = 1;
		#1 $finish;
	end
endmodule //Teste