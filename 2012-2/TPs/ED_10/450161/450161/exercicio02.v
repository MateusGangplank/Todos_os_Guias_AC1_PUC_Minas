`include "RAM4X1.v"
`include "muxDmux.v"


module ram4x2(output [3:0]s,input [3:0]i,input addr,input clk,input wr);
wire a,a1;

dmux d(a,a1,1,addr);
wire [3:0]b;
wire [3:0]b1;

ram4x1 r1(b,i,a,wr,clk);
ram4x1 r2(b1,i,a1,wr,clk);
mux mux(s,b,b1,addr);

endmodule
