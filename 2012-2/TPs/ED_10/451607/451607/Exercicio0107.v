//-----------------------------------------------
//Exercicio0107 - RAM 4x8 usando RAM 1x8
//Nome: Rafael Guimaraes de Sousa
//Matrícula: 451607
//-----------------------------------------------

`include "ram1x8.v"
`include "clock.v"
`include "plexers.v"

module ram4x8(output[7:0]s, input[7:0]x, input clk,
				input readWrite, input [1:0]address, input clear);
	
	reg entradaDmx;
	wire [3:0]w;
	wire [7:0]aux0,aux1,aux2,aux3;
	
	dmx2bits dmx1(w,entradaDmx,address);
	
	ram1x8 ram0(aux0,x,clk,readWrite,w[0],clear);
	ram1x8 ram1(aux1,x,clk,readWrite,w[1],clear);
	ram1x8 ram2(aux2,x,clk,readWrite,w[2],clear);
	ram1x8 ram3(aux3,x,clk,readWrite,w[3],clear);
	
	mux2bits mux1(s,aux0,aux1,aux2,aux3,address);

endmodule //ram4x8

module principal_107;
	reg [7:0]IN;
	wire [7:0]OUT;
	reg RW, clear;
	reg [1:0]ADD;
	wire clk;
	
	clock clk1(clk);
	
	ram4x8 ram1(OUT,IN,clk,RW,ADD,clear);
	
	initial begin
		IN = 8'b11000000;
		RW = 0;
		ADD = 0;
		clear = 0;
		$display("Exercicio0107 - RAM 4x8 usando RAM 1x8 - Rafael Guimaraes de Sousa - 451607");
		$display("clk \t RW \t ADD \t IN \t\t OUT");
		$monitor("%b \t %b \t %2b \t %8b \t %8b",clk,RW,ADD,IN,OUT);
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
endmodule //principal_107