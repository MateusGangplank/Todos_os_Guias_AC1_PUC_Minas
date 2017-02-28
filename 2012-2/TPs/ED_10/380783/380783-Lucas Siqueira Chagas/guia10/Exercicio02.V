//--------------------------------------------
//Exercicio02 
//Nome: Lucas Siqueira Chagas
//Matrícula: 380783
//--------------------------------------------

`include "plexers.v"
`include "exercicio01.v"

module ram2x4(output [3:0]s, input [3:0]x, input clk,
			input readWrite, input address, input clear);
	reg demuxIn;
	wire w0,w1;
	wire [3:0]aux0;
	wire [3:0]aux1;
	dmx1bit dmx1(w0,w1,demuxIn,address);
	ram1x4 ram1(aux0,x,clk,readWrite,w0,clear);
	ram1x4 ram2(aux1,x,clk,readWrite,w1,clear);
	mux1bit mux1(s,aux0,aux1,address);
	initial begin
		demuxIn = 1'b1;
	end
endmodule //ram2x4


module principal_102;
	reg [3:0]IN;
	reg RW , ADD, clear;
	wire clk;
	wire [3:0] OUT;
	
	clock clk1(clk);
	ram2x4 ram1(OUT,IN,clk,RW,ADD,clear);
	
	initial begin
		IN = 4'b1100;
		clear = 0;
		ADD = 0;
		RW = 0;
		$display("Exercicio02 - Lucas Siqueira Chagas - 380783");
		$display("clk \t RW \t ADD  \t IN \t OUT");
		$monitor("%b \t %b \t %b \t %4b \t %4b",clk,RW,ADD,IN,OUT);
		#1 clear = 1;
		#1 clear = 0;
		#1 RW = 1;
		#3 RW = 0; IN = 4'b0011;
		#1 ADD = 1;
		#1 RW = 1;
		#1 RW = 0;
		#1 ADD = 0;
		#1 ADD = 1;
		#1 ADD = 0;
		#1 ADD = 1;
		#1 $finish;
	end
endmodule 