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


module test(input[7:0] x,
            input rw,
				input address,
				input clk,
				input clr,
				output[7:0]q,
				output y,
				output k,
				output p,
				output c,
				output v,
				output a,
				output r,
				output t,
				output z,
				output qnot);


and AND1(y,address,rw,clk);
and AND2(k,q[0],address);
and AND3(p,q[1],address);
and AND4(c,q[2],address);
and AND5(v,q[3],address);
and AND6(a,q[4],address);
and AND7(r,q[5],address);
and AND8(t,q[6],address);
and AND9(z,q[7],address);
jkff jk1(q[0],qnot,x[0],x[0],y,clr);
jkff jk2(q[1],qnot,x[1],x[1],y,clr);
jkff jk3(q[2],qnot,x[2],x[2],y,clr);
jkff jk4(q[3],qnot,x[3],x[3],y,clr);
jkff jk5(q[4],qnot,x[4],x[4],y,clr);
jkff jk6(q[5],qnot,x[5],x[5],y,clr);
jkff jk7(q[6],qnot,x[6],x[6],y,clr);
jkff jk8(q[7],qnot,x[7],x[7],y,clr);

endmodule

module exercicio;

reg address;
reg rw;
reg clk;
reg [63:0] x;
reg clr;
wire y;
wire k;
wire p;
wire c;
wire v;
wire a;
wire r;
wire t;
wire z;
wire [63:0]q;
wire qnot;

test t1(x[7:0],rw,address,clk,clr,q[7:0],y,k,p,c,v,a,r,t,z,qnot);
test t2(x[15:8],rw,address,clk,clr,q[15:8],y,k,p,c,v,a,r,t,z,qnot);
test t3(x[23:16],rw,address,clk,clr,q[23:16],y,k,p,c,v,a,r,t,z,qnot);
test t4(x[31:24],rw,address,clk,clr,q[31:24],y,k,p,c,v,a,r,t,z,qnot);
test t5(x[39:32],rw,address,clk,clr,q[39:32],y,k,p,c,v,a,r,t,z,qnot);
test t6(x[47:40],rw,address,clk,clr,q[47:40],y,k,p,c,v,a,r,t,z,qnot);
test t7(x[55:48],rw,address,clk,clr,q[55:48],y,k,p,c,v,a,r,t,z,qnot);
test t8(x[63:56],rw,address,clk,clr,q[63:56],y,k,p,c,v,a,r,t,z,qnot);
endmodule //