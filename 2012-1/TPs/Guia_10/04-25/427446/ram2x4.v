`include "plexers.v"
`include "ram1x4.v"

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