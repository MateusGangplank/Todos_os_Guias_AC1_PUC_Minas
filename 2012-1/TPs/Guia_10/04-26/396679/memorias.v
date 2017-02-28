//-----------------------------
// -- CLOCK
//-----------------------------
`include "clock.v"

//-----------------------------
// -- FlipFlop JK
//-----------------------------
`include "flipflopjk.v"

//-----------------------------
// -- Plexers
//-----------------------------
`include "plexers.v"

//-----------------------------
// -- Ram 1x4
//-----------------------------
module ram1x4(output [3:0]s, input[3:0]x, input clk, input readWrite, input address, input clear);
	wire not0,not1,no2,not3;
	wire w;
	wire [3:0]q,qnot;
	
	not not0(not0,x[0]);
	not not1(not1,x[1]);
	not not2(not2,x[2]);
	not not3(not3,x[3]);
	
	and and1(w,clk,readWrite,address);
	
	ffjk FF1(q[0],qnot[0],x[3],not3,w,0,clear);
	ffjk FF2(q[1],qnot[1],x[2],not2,w,0,clear);
	ffjk FF3(q[2],qnot[2],x[1],not1,w,0,clear);
	ffjk FF4(q[3],qnot[3],x[0],not0,w,0,clear);
	
	wire [3:0] aux;
	
	assign aux[0] = q[3];
	assign aux[1] = q[2];
	assign aux[2] = q[1];
	assign aux[3] = q[0];
	
	and and1(s[0],aux[0],address);
	and and2(s[1],aux[1],address);
	and and3(s[2],aux[2],address);
	and and4(s[3],aux[3],address);

endmodule//ram1x4

//-----------------------------
// -- RAM 1x8
//-----------------------------
module ram1x8(output [7:0]s,input[7:0]x,input clk,input readWrite,input address,input clear);
	
	ram1x4 RAM1(s[3:0],x[3:0],clk,readWrite,address,clear);
	ram1x4 RAM2(s[7:4],x[7:4],clk,readWrite,address,clear);

endmodule //ram1x8

//-----------------------------
// -- RAM 2x4
//-----------------------------
module ram2x4(output [3:0]s, input [3:0]x, input clk,input readWrite, input address, input clear);
	reg demuxIn;
	wire w0,w1;
	wire [3:0]aux0;
	wire [3:0]aux1;
	
	dmx1bit DMX1(w0,w1,demuxIn,address);
	ram1x4 RAM1(aux0,x,clk,readWrite,w0,clear);
	ram1x4 RAM2(aux1,x,clk,readWrite,w1,clear);
	mux1bit MUX1(s,aux0,aux1,address);
	
	initial begin
		demuxIn = 1'b1;
	end
endmodule //ram2x4