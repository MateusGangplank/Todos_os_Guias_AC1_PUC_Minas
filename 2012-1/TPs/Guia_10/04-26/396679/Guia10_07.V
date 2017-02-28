// ------------------------- 
// Guia10_07 - Memoria RAM 4x8
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679
// ------------------------- 

//----------------------------------------------------
// -- Ram 1x4,1x8, 2x4, Clock, Plexers,  FlipFlop JK
//----------------------------------------------------
`include "memorias.v"

//-----------------------------
// -- RAM 4x8
//-----------------------------
module mem4x8(output[7:0]s, input[7:0]x, input clk, input readWrite, input [1:0]address, input clear);
	reg entradaDmx;
	wire [3:0]w;
	wire [7:0]aux0,aux1,aux2,aux3;
	
	dmx2bits DMX1(w,entradaDmx,address);
	
	ram1x8 RAM0(aux0,x,clk,readWrite,w[0],clear);
	ram1x8 RAM1(aux1,x,clk,readWrite,w[1],clear);
	ram1x8 RAM2(aux2,x,clk,readWrite,w[2],clear);
	ram1x8 RAM3(aux3,x,clk,readWrite,w[3],clear);
	
	mux2bits MUX1(s,aux0,aux1,aux2,aux3,address);

endmodule //mem4x8


//-----------------------------
// -- Module Teste 
//-----------------------------
module Teste;
	reg [7:0]IN;
	wire [7:0]OUT;
	reg RW, clear;
	reg [1:0]ADD;
	wire clk;
	
	clock clk1(clk);
	
	mem4x8 RAM1(OUT,IN,clk,RW,ADD,clear);
	
	initial begin
		IN = 8'b11000000;
		RW = 0;
		ADD = 0;
		clear = 0;
		$display("Guia10_07 - Bruno Cezar Andrade Viallet - 396679"); 
		$display("Clock	Ler/Escrever	Endereco	Entrada   Saida");
		$monitor("  %b	    %b		   %b		%4b  %4b",clk,RW,ADD,IN,OUT);
		#1 clear = 1;
		#1 clear = 0;
		#1 RW = 1;
		#3 RW = 0; IN = 8'b00110000; ADD = 1;
		#1 RW = 1;
		#1 RW = 0; IN = 8'b00001100; ADD = 2;
		#1 RW = 1;
		#1 RW = 0; IN = 8'b00000011; ADD = 3;
		#5 RW = 1;
		#1 RW = 0; IN = 0;
		#1 ADD = 0;
		#1 ADD = 1;
		#1 ADD = 2;
		#1 ADD = 3;
		#1 $finish;
	end
endmodule //Teste