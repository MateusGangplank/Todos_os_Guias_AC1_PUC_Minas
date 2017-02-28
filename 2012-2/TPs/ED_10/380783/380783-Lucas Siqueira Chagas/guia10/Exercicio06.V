//-----------------------------------------
//Exercicio06
//Nome: Lucas Siqueira Chagas
//Matrícula: 380783
//-----------------------------------------

`include "exercicio01.v"

module ram1x16(output [15:0]s, input [15:0]x,input clk,
					input readWrite, input address, input clear);
	ram1x4 ram0(s[3:0],x[3:0],clk,readWrite,address,clear);
	ram1x4 ram1(s[7:4],x[7:4],clk,readWrite,address,clear);
	ram1x4 ram2(s[11:8],x[11:8],clk,readWrite,address,clear);
	ram1x4 ram3(s[15:12],x[15:12],clk,readWrite,address,clear);
endmodule //ram1x16

module principal_106;
	reg [15:0]IN;
	wire [15:0]OUT;
	reg RW, ADD, clear;
	wire clk;
	
	clock clk1(clk);
	
	ram1x16 ram1(OUT,IN,clk,RW,ADD,clear);
	
	initial begin
		IN = 16'b1101101011001111;
		clear = 0;
		RW = 0;
		ADD = 0;
		$display("Exercicio06 - Lucas Siqueira Chagas - 380783");
		$display("clk \t RW \t ADD \t IN \t\t\t OUT");
		$monitor("%b \t %b \t %b \t %16b \t %16b", clk,RW,ADD,IN,OUT);
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
endmodule 