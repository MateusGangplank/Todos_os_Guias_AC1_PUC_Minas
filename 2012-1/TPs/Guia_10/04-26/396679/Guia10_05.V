// ------------------------- 
// Guia10_05 - Memoria RAM 8x8
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679
// ------------------------- 

//----------------------------------------------------
// -- Ram 1x4,1x8, 2x4, Clock, Plexers,  FlipFlop JK
//----------------------------------------------------
`include "memorias.v"


//-----------------------------
// -- RAM 8x8
//-----------------------------
module mem8x8(output [7:0]s, input[7:0]x, input clk, input readWrite, input [2:0]address, input clear);
		wire [7:0] aux;
		reg entradaDmx;
		wire [7:0] w0,w1,w2,w3,w4,w5,w6,w7;
		
		dmx3bits DMX1(aux,entradaDmx,address);
		
		ram1x8 RAM0(w0,x,clk,readWrite,aux[0],clear);
		ram1x8 RAM1(w1,x,clk,readWrite,aux[1],clear);
		ram1x8 RAM2(w2,x,clk,readWrite,aux[2],clear);
		ram1x8 RAM3(w3,x,clk,readWrite,aux[3],clear);
		ram1x8 RAM4(w4,x,clk,readWrite,aux[4],clear);
		ram1x8 RAM5(w5,x,clk,readWrite,aux[5],clear);
		ram1x8 RAM6(w6,x,clk,readWrite,aux[6],clear);
		ram1x8 RAM7(w7,x,clk,readWrite,aux[7],clear);
		
		mux3bits MUX1(s,w0,w1,w2,w3,w4,w5,w6,w7,address);

endmodule //mem8x8


//-----------------------------
// -- Module Teste 
//-----------------------------
module Teste;
	reg [7:0]IN;
	wire [7:0]OUT;
	wire clk;
	reg RW, clear;
	reg [2:0]ADD;
	
	clock clk1(clk);
	
	mem8x8 RAM1(OUT,IN,clk,RW,ADD,clear);
	
	initial begin
		IN = 8'b10001100;
		clear = 0;
		RW = 0;
		ADD = 0;
		$display("Guia10_05 - Bruno Cezar Andrade Viallet - 396679"); 
		$display("Clock	Ler/Escrever	Endereco	Entrada    Saida");
		$monitor("  %b	    %b		   %b		%4b  %4b",clk,RW,ADD,IN,OUT);
		#1 clear = 1;
		#1 clear = 0;
		#1 RW = 1;
		#3 RW = 0;
		#1 IN = 8'b01001101; ADD = 1;
		#1 RW = 1;
		#1 RW = 0;
		#1 IN = 8'b10101001; ADD = 2;
		#5 RW = 1;
		#1 RW = 0;
		#1 IN = 8'b10010001; ADD = 3;
		#1 RW = 1;
		#1 RW = 0;
		#1 IN = 8'b01001000; ADD = 4;
		#5 RW = 1;
		#1 RW = 0;
		#1 IN = 8'b11000100; ADD = 5;
		#1 RW = 1;
		#1 RW = 0;
		#1 IN = 8'b10010011; ADD = 6;
		#5 RW = 1;
		#1 RW = 0;
		#1 IN = 8'b01100001; ADD = 7;
		#1 RW = 1;
		#1 RW = 0; IN = 0;
		#1 ADD = 0;
		#1 ADD = 1;
		#1 ADD = 2;
		#1 ADD = 3;
		#1 ADD = 4;
		#1 ADD = 5;
		#1 ADD = 6;
		#1 ADD = 7;
		#1 $finish;
		
	end
endmodule //Teste