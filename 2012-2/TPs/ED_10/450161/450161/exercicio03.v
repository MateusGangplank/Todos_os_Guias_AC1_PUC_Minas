`include "RAM4X1.v"



module ram8x1(output [3:0]s,output [3:0]s1,input [3:0]i,input [3:0]i1,input addr,input clk,input wr);


ram4x1 r1(s,i,addr,wr,clk);
ram4x1 r2(s1,i1,addr,wr,clk);


endmodule
