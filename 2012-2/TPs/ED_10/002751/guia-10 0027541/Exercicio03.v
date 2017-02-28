//-------------------------------------
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-- Exercicio 03 - Guia 10
//-------------------------------------

`include "ram1x4.v"
`include "clock.v"

module ram1x8(output [7:0]s,input[7:0]x,input clk,
			input readWrite,input address,input clear);
	ram1x4 ram1(s[3:0],x[3:0],clk,readWrite,address,clear);
	ram1x4 ram2(s[7:4],x[7:4],clk,readWrite,address,clear);
endmodule //ram1x8

module principal03;
	reg [7:0]IN;
	wire [7:0]OUT;
	wire clk;
	reg RW,ADD,clear;
	
	clock clk1(clk);
	ram1x8 ram1(OUT,IN,clk,RW,ADD,clear);
	
initial begin
		IN = 8'b11011010;
		clear = 0;
		RW = 0;
		ADD = 0;
		$display("Exercicio0103 - RAM 1x8 -Milton costa teles da silva");
		$display("clk \t RW \t ADD \t IN \t \t OUT");
		$monitor("%b \t %b \t %b \t %8b \t %8b",clk,RW,ADD,IN,OUT);
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
endmodule 