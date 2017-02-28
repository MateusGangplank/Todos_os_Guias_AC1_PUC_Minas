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

module test(output [7:0] s0,
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

module exercicio;

reg [7:0] x;
reg address;
reg rw;
reg clk;
reg clr;
wire [7:0] s0;
wire q;
wire qnot;

test t1(s0,q,qnot,x,address,rw,clk,clr);


initial
 begin
$display("  s0   s1   s2   s3   s4   s5   s6   s7   clk   rw   add"); 
clk   = 1;rw = 1;address = 1;x[0] = 1;x[1] = 1;x[2] = 1;x[3] = 1;x[4] = 1;x[5] = 1;x[6] = 1;x[7] = 1;
#1$display("%4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b",s0[0],s0[1],s0[2],s0[3],s0[4],s0[5],s0[6],s0[7],clk,rw,address);
clk   = 0;rw = 1;address = 1;x[0] = 1;x[1] = 1;x[2] = 1;x[3] = 1;x[4] = 1;x[5] = 1;x[6] = 1;x[7] = 1;
#1$display("%4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b ",s0[0],s0[1],s0[2],s0[3],s0[4],s0[5],s0[6],s0[7],clk,rw,address);
clk   = 0;rw = 0;address = 0;x[0] = 1;x[1] = 1;x[2] = 1;x[3] = 1;x[4] = 1;x[5] = 1;x[6] = 1;x[7] = 1;
#1$display("%4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b ",s0[0],s0[1],s0[2],s0[3],s0[4],s0[5],s0[6],s0[7],clk,rw,address);
 clk   = 0;rw = 0;address = 1;x[0] = 1;x[1] = 1;x[2] = 1;x[3] = 1;x[4] = 1;x[5] = 1;x[6] = 1;x[7] = 1;
#1$display("%4b %4b %4b %4b %4b %4b %4b %4b %4b %4b %4b ",s0[0],s0[1],s0[2],s0[3],s0[4],s0[5],s0[6],s0[7],clk,rw,address);

end // initial
endmodule //