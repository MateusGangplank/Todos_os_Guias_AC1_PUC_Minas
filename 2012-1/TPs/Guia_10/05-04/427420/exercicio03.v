/**
 * AC I - Ciencia da Computacao - PUC MINAS
 * Jenifer Henrique Moreira Borges - 427420
 * 05/2012
 */

`include "util.v"

//memoria ram 1x4
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

endmodule

//memoria ram 1x8
module ram1x8(output [7:0]s,input[7:0]x,input clk,input readWrite,input address,input clear);
	
	ram1x4 ram1(s[3:0],x[3:0],clk,readWrite,address,clear);
	ram1x4 ram2(s[7:4],x[7:4],clk,readWrite,address,clear);

endmodule

//teste
module exercicio03;
	
	reg [7:0]IN;
	wire [7:0]OUT;
	wire clk;
	reg readWrite,adress,clear;
	
	clock clk1(clk);
	ram1x8 ram1(OUT,IN,clk,readWrite,adress,clear);
	
	initial begin
		IN = 8'b11011010;
		clear = 0;
		readWrite = 0;
		adress = 0;
		
		$display("Exercicio03 - Jenifer Henrique - 427420\n");
		$display("Clock \tRW \t Adress \t Input \t\tOutput");
		$monitor("%b \t\t%b \t   %b \t\t %4b  \t%4b",clk,readWrite,adress,IN,OUT);
		
		#1 clear = 1;
		#1 clear = 0;
		#1 adress = 1; readWrite = 1;
		#3 readWrite = 0;
		#1 adress = 0;
		#1 adress = 1;
		#1 IN = 0;
		#1 IN = 8'b10111100;
		#1 readWrite = 1;
		#6 readWrite = 0; IN = 0;
		#1 adress = 0;
		#1 adress = 1;
		#1 $finish;
	end
endmodule