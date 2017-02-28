//--------------------------------------------
//Exercicio0104 - RAM 2x8 usando RAM 2x4
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//--------------------------------------------

`include "ram2x4.v"
`include "clock.v"

module ram2x8(output [7:0]s, input [7:0]x, input clk,
					input readWrite, input address, input clear);
	reg entradaDmx;
	wire w0,w1;
	dmx1bit dmx1(w0,w1,entradaDmx,address);
	wire [7:0]aux0,aux1;
	ram2x4 ram1(aux0[3:0],x[3:0],clk,readWrite,w0,clear);
	ram2x4 ram2(aux0[7:4],x[7:4],clk,readWrite,w0,clear);
	ram2x4 ram3(aux1[3:0],x[3:0],clk,readWrite,w1,clear);
	ram2x4 ram4(aux1[7:4],x[7:4],clk,readWrite,w1,clear);
	
	mux1bit2 mux1(s,aux0,aux1,address);
	
	initial begin
		entradaDmx = 1'b1;
	end

endmodule //ram2x8

module principal_104;
	reg [7:0]IN;
	wire [7:0]OUT;
	wire clk;
	reg RW, ADD, clear;
	
	clock clk1(clk);
	
	ram2x8 ram1(OUT,IN,clk,RW,ADD,clear);
	
	initial begin
		IN = 8'b11011010;
		RW = 0;
		ADD = 0;
		clear = 0;
		$display("Exercicio0104 - RAM 2x8 usando RAM 2x4 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("clk \t RW \t ADD \t IN \t\t OUT");
		$monitor("%b \t %b \t %b \t %8b \t %8b",clk,RW,ADD,IN,OUT);
		#1 clear = 1;
		#1 clear = 0;
		#1 RW = 1;
		#3 RW = 0;
		#1 IN = 8'B00111100;
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
endmodule //principal_104