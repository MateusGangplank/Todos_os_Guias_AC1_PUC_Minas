//-------------------------------------
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-- Exercicio 03 - Guia 10
//-------------------------------------

`include "flipflop.v"
`include "Demux.v"
`include "Mux.v"

module ram1x4(output [3:0]s,input[3:0]x,input addr,
               input rw,input clk,input clear);

	wire not0,not1,no2,not3;
	wire w;
	wire [3:0]q,qnot;
	
	not not0(not0,x[0]);
	not not1(not1,x[1]);
	not not2(not2,x[2]);
	not not3(not3,x[3]);
	
	and and0(w,addr,rw,clk);
	
	jkff flip1(q[0],qnot[0],x[0],not0,w,0,clear);
	jkff flip2(q[1],qnot[1],x[1],not1,w,0,clear);
	jkff flip3(q[2],qnot[2],x[2],not2,w,0,clear);
	jkff flip4(q[3],qnot[3],x[3],not3,w,0,clear);
	
	wire [3:0] out1;
	
	assign out1[0] = q[0];
	assign out1[1] = q[1];
	assign out1[2] = q[2];
	assign out1[3] = q[3];
	
	and and1(s[0],out1[0],addr);
	and and2(s[1],out1[1],addr);
	and and3(s[2],out1[2],addr);
	and and4(s[3],out1[3],addr);

endmodule//ram1x4

module ram1x8(output [7:0]s,input[7:0]x,input addr,
			input rw,input clk,input clear);
	ram1x4 ram1(s[3:0],x[3:0],addr,rw,clk,clear);
	ram1x4 ram2(s[7:4],x[7:4],addr,rw,clk,clear);
endmodule //ram1x8

module principal;
	reg [7:0]in0;
	wire [7:0]out0;
	wire clk;
	reg addr,rw,clear;
	
	clock clock(clk);
	ram1x8 ram1(out0,in0,addr,rw,clk,clear);
	
	initial begin
		clear = 0;
		rw = 0;
		addr = 0;
		in0 = 8'b11011010;
		$display("Exercicio03-Nome: Milton costa teles da silva-Matricula: 002751");
		$display("addr \t rw \t clk       \t in0 \t out0");
		$monitor("%b \t %b \t %b \t %4b \t %4b",addr,rw,clk,in0,out0);
		#1 clear = 1;
		#1 clear = 0;
		#1 addr = 1; rw = 1;
		#3 rw = 0;
		#1 addr = 0;
		#1 addr = 1;
		#1 in0 = 0;
		#1 in0 = 8'b10010110;
		#1 rw = 1;
		#6 rw = 0; in0 = 0;
		#1 addr = 0;
		#1 addr = 1;
		#1 $finish;
	end
endmodule //principal_103