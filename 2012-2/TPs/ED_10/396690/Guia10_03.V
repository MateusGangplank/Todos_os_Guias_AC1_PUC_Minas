// ------------------------- 
// Guia10_03 - Memoria RAM 1x8
// Nome: Gabriel Benjamim de Carvalho 
// Matricula: 396690
// ------------------------- 


`include "memorias.v"

module mem1x8(output [7:0]s,input[7:0]x,input clk,input readWrite,input address,input clear);
	
	ram1x4 RAM1(s[3:0],x[3:0],clk,readWrite,address,clear);
	ram1x4 RAM2(s[7:4],x[7:4],clk,readWrite,address,clear);

endmodule //mem1x8

module Teste;
	reg [7:0]IN;
	wire [7:0]OUT;
	wire clk;
	reg RW,ADD,clear;
	
	clock clk1(clk);
	ram1x8 ram1(OUT,IN,clk,RW,ADD,clear);
	
	initial begin
		IN = 8'b10110110;
		clear = 0;
		RW = 0;
		ADD = 0;
		$display("Guia10_03 - Gabriel Benjamim de Carvalho - 396690"); 
		$display("Clock	Ler/Escrever	Endereco	Entrada    Saida");
		$monitor("  %b	    %b		   %b		%4b  %4b",clk,RW,ADD,IN,OUT);
		#1 clear = 1;
		#1 clear = 0;
		#1 ADD = 1; RW = 1;
		#3 RW = 0;
		#1 ADD = 0;
		#1 ADD = 1;
		#1 IN = 0;
		#1 IN = 8'b10010110;
		#1 RW = 1;
		#6 RW = 0; IN = 0;
		#1 ADD = 0;
		#1 ADD = 1;
		#1 $finish;
	end
endmodule //Teste