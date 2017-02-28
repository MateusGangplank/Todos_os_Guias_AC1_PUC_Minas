`include "RAM4X1.v"



module ram8x2(output [7:0]s,input[7:0]i, input [1:0] addr,input clk,input wr);
wire a1,a2,a3,a4;
dmux1 mem(a1,a2,a3,a4,addr);
wire [3:0] b,b1,b2,b3,b4,b5,b6,b7;
wire [3:0]dis1,dis2;
wire [7:0] s1,s2,s3,s4;
assign dis1[0] = i[0];
assign dis1[1] = i[1]; 
assign dis1[2] = i[2]; 
assign dis1[3] = i[3];  
assign dis2[0] = i[4];
assign dis2[1] = i[5]; 
assign dis2[2] = i[6]; 
assign dis2[3] = i[7];



/*
ram4x1 r1(b,dis1,a1,wr,clk);
ram4x1 r2(b1,dis2,a1,wr,clk);
ram4x1 r3(b2,dis1,a2,wr,clk);
ram4x1 r4(b3,dis2,a2,wr,clk);
ram4x1 r5(b4,dis1,a3,wr,clk);
ram4x1 r6(b5,dis2,a3,wr,clk);
ram4x1 r7(b6,dis1,a4,wr,clk);
ram4x1 r8(b7,dis2,a4,wr,clk);
*/
assign s1[0] = b[0];
assign s1[1] = b[1];
assign s1[2] = b[2];
assign s1[3] = b[3];
assign s1[4] = b1[0];
assign s1[5] = b1[1];
assign s1[6] = b1[2];
assign s1[7] = b1[3];
assign s2[0] = b2[0];
assign s2[1] = b2[1];
assign s2[2] = b2[2];
assign s2[3] = b2[3];
assign s2[4] = b3[0];
assign s2[5] = b3[1];
assign s2[6] = b3[2];
assign s2[7] = b3[3];
assign s3[0] = b4[0];
assign s3[1] = b4[1];
assign s3[2] = b4[2];
assign s3[3] = b4[3];
assign s3[4] = b5[0];
assign s3[5] = b5[1];
assign s3[6] = b5[2];
assign s3[7] = b5[3];
assign s4[0] = b6[0];
assign s4[1] = b6[1];
assign s4[2] = b6[2];
assign s4[3] = b6[3];
assign s4[4] = b7[0];
assign s4[5] = b7[1];
assign s4[6] = b7[2];
assign s4[7] = b7[3];

mux1 m(s,s1,s2,s3,s4,addr);
endmodule
