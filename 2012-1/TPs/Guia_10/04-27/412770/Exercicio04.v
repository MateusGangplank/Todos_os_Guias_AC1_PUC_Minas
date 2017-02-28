//---------------------------------------------------
//-- Exercicio 04 - Guia 10 
//-- Rayan Darwin - 412770
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

module ram2x4(output [3:0]s, input [3:0]x, input clk,input readWrite, input address, input clear);
	
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
endmodule //--memoria ram2x4

//-- ***************************************************

module ram2x8(output [7:0]s, input [7:0]x, input clk,input readWrite, input address, input clear);

	reg inDmx;
	wire w0,w1;
	dmx1bit dmx1(w0,w1,inDmx,address);
	wire [7:0]aux0,aux1;

	ram2x4 ram1(aux0[3:0],x[3:0],clk,readWrite,w0,clear);
	ram2x4 ram2(aux0[7:4],x[7:4],clk,readWrite,w0,clear);
	ram2x4 ram3(aux1[3:0],x[3:0],clk,readWrite,w1,clear);
	ram2x4 ram4(aux1[7:4],x[7:4],clk,readWrite,w1,clear);
	
	mux1bit2 mux1(s,aux0,aux1,address);
	
	initial begin
		inDmx = 1'b1;
	end

endmodule //-- memoria ram2x8

module teste_exercicio_04;
	reg [7:0]IN;
	wire [7:0]OUT;
	wire clk;
	reg readWrite, adress, clear;
	
	clock clk1(clk);
	
	ram2x8 ram1(OUT,IN,clk,readWrite,adress,clear);
	
	initial begin
		IN = 8'b11011010;
		readWrite = 0;
		adress = 0;
		clear = 0;
		
		$display("Exercicio 04 - Memoria RAM 2x8 - Rayan Darwin - 412770");
		$display("Clock \tRead/Write \Adress \t IN       - OUT");
		$monitor("%b \t%b \t   %b \t\t %4b - %4b",clk,readWrite,adress,IN,OUT);
		
		#1 clear = 1;
		#1 clear = 0;
		#1 readWrite = 1;
		#3 readWrite = 0;
		#1 IN = 8'B00111100;
		#1 adress = 1;
		#1 readWrite = 1;
		#1 readWrite = 0; IN = 1;
		#1 adress = 0;
		#1 adress = 1;
		#1 adress = 0;
		#1 adress = 1;
		#1 clear = 1;
		#1 clear = 0;
		#1 $finish;
		
	end
endmodule //-- Fim teste 04