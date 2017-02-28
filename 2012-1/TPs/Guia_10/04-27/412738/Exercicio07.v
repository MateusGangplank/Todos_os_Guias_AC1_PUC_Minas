//---------------------------------------------------
//-- Exercicio 07 - Guia 10 
//-- Felipe Tôrres - 412738
//---------------------------------------------------

`include "clockFlipFlopJK.v"
`include "plexers.v"

module ram1x4(output [3:0]s, input[3:0]x, input clk,input readWrite, input address, input clear);

	wire not0,not1,no2,not3;
	wire w;
	wire [3:0]q,qnot;
	
	not not0(not0,x[0]);
	not not1(not1,x[1]);
	not not2(not2,x[2]);
	not not3(not3,x[3]);
	
	and and1(w,clk,readWrite,address);
	
	ffJK flip1(q[0],qnot[0],x[3],not3,w,0,clear);
	ffJK flip2(q[1],qnot[1],x[2],not2,w,0,clear);
	ffJK flip3(q[2],qnot[2],x[1],not1,w,0,clear);
	ffJK flip4(q[3],qnot[3],x[0],not0,w,0,clear);
	
	wire [3:0] aux;
	
	assign aux[0] = q[3];
	assign aux[1] = q[2];
	assign aux[2] = q[1];
	assign aux[3] = q[0];
	
	and and1(s[0],aux[0],address);
	and and2(s[1],aux[1],address);
	and and3(s[2],aux[2],address);
	and and4(s[3],aux[3],address);

endmodule//-- memoria ram1x4

module ram1x8(output [7:0]s,input[7:0]x,input clk,input readWrite,input address,input clear);
	
	ram1x4 ram1(s[3:0],x[3:0],clk,readWrite,address,clear);
	ram1x4 ram2(s[7:4],x[7:4],clk,readWrite,address,clear);

endmodule //-- memoria ram1x8

//--*****************************************************************************************************

module ram4x8(output[7:0]s, input[7:0]x, input clk,input readWrite, input [1:0]address, input clear);
	
	reg inDmx;
	wire [3:0]w;
	wire [7:0]aux0,aux1,aux2,aux3;
	
	dmx2bits dmx1(w,inDmx,address);
	
	ram1x8 ram0(aux0,x,clk,readWrite,w[0],clear);
	ram1x8 ram1(aux1,x,clk,readWrite,w[1],clear);
	ram1x8 ram2(aux2,x,clk,readWrite,w[2],clear);
	ram1x8 ram3(aux3,x,clk,readWrite,w[3],clear);
	
	mux2bits mux1(s,aux0,aux1,aux2,aux3,address);

endmodule //-- memoria ram4x8

module teste_exercicio_07;
	reg [7:0]IN;
	wire [7:0]OUT;
	reg readWrite, clear;
	reg [1:0]adress;
	wire clk;
	
	clock clk1(clk);
	
	ram4x8 ram1(OUT,IN,clk,readWrite,adress,clear);
	
	initial begin
		IN = 8'b11000000;
		readWrite = 0;
		adress = 0;
		clear = 0;
		
		$display("Exercicio 07 - Memoria RAM 4x8 - Felipe Tôrres - 412738");
		$display("Clock \tRead/Write \Adress \t IN	  - OUT");
		$monitor("%b \t%b \t   %b \t\t %4b - %4b",clk,readWrite,adress,IN,OUT);
		
		#1 clear = 1;
		#1 clear = 0;
		#1 readWrite = 1;
		#3 readWrite = 0; IN = 8'b00110000; adress = 1;
		#1 readWrite = 1;
		#1 readWrite = 0; IN = 8'b00001100; adress = 2;
		#1 readWrite = 1;
		#1 readWrite = 0; IN = 8'b00000011; adress = 3;
		#5 readWrite = 1;
		#1 readWrite = 0; IN = 0;
		#1 adress = 0;
		#1 adress = 1;
		#1 adress = 2;
		#1 adress = 3;
		#1 $finish;
	end
endmodule //--fim teste_exercicio_07