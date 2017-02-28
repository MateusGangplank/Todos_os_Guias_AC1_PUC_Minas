//Guilherme Rodrigues Melo de Oliveira
//427409

module jkff ( output q, output qnot,
input    j, input    k, input clk,input clear );
reg q, qnot;
initial
begin
q = 1'b0;
qnot = ~q;
end

always @( posedge clk )
begin
if ( clear )
  begin
   q <= 0;  qnot <= ~q;
  end
  else
    if ( j & ~k )
     begin
      q <= 1; qnot <= 0;
     end
    else
      if ( ~j & k )
       begin
        q <= 0; qnot <= 1;
       end
      else
        if ( j & k )
         begin
          q <= ~q; qnot <= ~qnot;
         end
end
endmodule // jkff

module ram1x1(output s0,output q, output qnot,input address,input rw,input clk,input x,input clr);
wire y;
and AND1(y,address,clk,rw);
jkff jk1(q,qnot,x,x,y,clr);
and AND2(s0,address,q);
endmodule

module ram1x4(output [3:0] s0,
output q,
output qnot, 
input address, 
input rw,
input clk,
input [3:0]k,
input clr);


ram1x1 r1(s0[0],q,qnot,address,rw,clk,k[0],clr);
ram1x1 r2(s0[1],q,qnot,address,rw,clk,k[1],clr);
ram1x1 r3(s0[2],q,qnot,address,rw,clk,k[2],clr);
ram1x1 r4(s0[3],q,qnot,address,rw,clk,k[3],clr);

endmodule

module ram1x8(output[7:0] s0,
            output q,
				output qnot,
				input [7:0] k1,
				input address,
				input rw,
				input clk,
			    input clr);
			 


ram1x4 r1(s0[3:0],q,qnot,address,rw,clk,k1[3:0],clr);
ram1x4 r2(s0[7:4],q,qnot,address,rw,clk,k1[7:4],clr);

endmodule

module test(output[31:0] s0,
				output q,
				output qnot,
            input[31:0] k1,
            input address,
				input rw,
				input clk,
				input clr);
				

ram1x8 r1(s0[7:0],q,qnot,k1[7:0],address,rw,clk,clr);
ram1x8 r2(s0[15:8],q,qnot,k1[15:8],address,rw,clk,clr);
ram1x8 r3(s0[23:16],q,qnot,k1[23:16],address,rw,clk,clr);
ram1x8 r4(s0[31:24],q,qnot,k1[31:24],address,rw,clk,clr);

endmodule

module exercicio;

reg [31:0] x;
reg address;
reg rw;
reg clk;
reg clr;
wire [31:0] s0;
wire q;
wire qnot;

test t1(s0,q,qnot,x,address,rw,clk,clr);

initial
 begin
clr = 0;clk   = 1;rw = 1;address = 1;x[0] = 1;x[1] = 1;x[2] = 1;x[3] = 1;x[4] = 1;x[5] = 1;x[6] = 1;x[7] = 1;x[8] = 1;x[9] = 1;x[10] = 1;x[11] = 1;x[12] = 1;x[13] = 1;x[14] = 1;x[15] = 1;x[16] = 1;x[17] = 1;x[18] = 1;x[19] = 1;x[20] = 1;x[21] = 1;x[22] = 1;x[23] = 1;x[24] = 1;x[25] = 1;x[26] = 1;x[27] = 1;x[28] = 1;x[29] = 1;x[30] = 1;x[31] = 1; 
#1$display("%1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %4b %4b %4b",s0[0],s0[1],s0[2],s0[3],s0[4],s0[5],s0[6],s0[7],s0[8],s0[9],s0[10],s0[11],s0[12],s0[13],s0[14],s0[15],s0[16],s0[17],s0[18],s0[19],s0[20],s0[21],s0[0],s0[22],s0[23],s0[24],s0[25],s0[26],s0[27],s0[28],s0[29],s0[30],s0[31],clk,rw,address);

clr = 0;clk = 0;rw = 1;address = 1;x[0] = 1;x[1] = 1;x[2] = 1;x[3] = 1;x[4] = 1;x[5] = 1;x[6] = 1;x[7] = 1;x[8] = 1;x[9] = 1;x[10] = 1;x[11] = 1;x[12] = 1;x[13] = 1;x[14] = 1;x[15] = 1;x[16] = 1;x[17] = 1;x[18] = 1;x[19] = 1;x[20] = 1;x[21] = 1;x[22] = 1;x[23] = 1;x[24] = 1;x[25] = 1;x[26] = 1;x[27] = 1;x[28] = 1;x[29] = 1;x[30] = 1;x[31] = 1; 
#1$display("%1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %4b %4b %4b",s0[0],s0[1],s0[2],s0[3],s0[4],s0[5],s0[6],s0[7],s0[8],s0[9],s0[10],s0[11],s0[12],s0[13],s0[14],s0[15],s0[16],s0[17],s0[18],s0[19],s0[20],s0[21],s0[0],s0[22],s0[23],s0[24],s0[25],s0[26],s0[27],s0[28],s0[29],s0[30],s0[31],clk,rw,address);

clr = 0;clk   = 0;rw = 0;address = 0;x[0] = 1;x[1] = 1;x[2] = 1;x[3] = 1;x[4] = 1;x[5] = 1;x[6] = 1;x[7] = 1;x[8] = 1;x[9] = 1;x[10] = 1;x[11] = 1;x[12] = 1;x[13] = 1;x[14] = 1;x[15] = 1;x[16] = 1;x[17] = 1;x[18] = 1;x[19] = 1;x[20] = 1;x[21] = 1;x[22] = 1;x[23] = 1;x[24] = 1;x[25] = 1;x[26] = 1;x[27] = 1;x[28] = 1;x[29] = 1;x[30] = 1;x[31] = 1; 
#1$display("%1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %4b %4b %4b",s0[0],s0[1],s0[2],s0[3],s0[4],s0[5],s0[6],s0[7],s0[8],s0[9],s0[10],s0[11],s0[12],s0[13],s0[14],s0[15],s0[16],s0[17],s0[18],s0[19],s0[20],s0[21],s0[0],s0[22],s0[23],s0[24],s0[25],s0[26],s0[27],s0[28],s0[29],s0[30],s0[31],clk,rw,address); 

clr = 0;clk   = 0;rw = 0;address = 1;x[0] = 1;x[1] = 1;x[2] = 1;x[3] = 1;x[4] = 1;x[5] = 1;x[6] = 1;x[7] = 1;x[8] = 1;x[9] = 1;x[10] = 1;x[11] = 1;x[12] = 1;x[13] = 1;x[14] = 1;x[15] = 1;x[16] = 1;x[17] = 1;x[18] = 1;x[19] = 1;x[20] = 1;x[21] = 1;x[22] = 1;x[23] = 1;x[24] = 1;x[25] = 1;x[26] = 1;x[27] = 1;x[28] = 1;x[29] = 1;x[30] = 1;x[31] = 1;
#1$display("%1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %1b %4b %4b %4b",s0[0],s0[1],s0[2],s0[3],s0[4],s0[5],s0[6],s0[7],s0[8],s0[9],s0[10],s0[11],s0[12],s0[13],s0[14],s0[15],s0[16],s0[17],s0[18],s0[19],s0[20],s0[21],s0[0],s0[22],s0[23],s0[24],s0[25],s0[26],s0[27],s0[28],s0[29],s0[30],s0[31],clk,rw,address);

end // initial
endmodule //