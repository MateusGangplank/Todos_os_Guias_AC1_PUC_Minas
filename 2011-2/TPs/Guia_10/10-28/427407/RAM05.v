// -------------------------
// RAM05
// Nome: Guilherme Andrade Salum Terra 
// Matricula: 427407
// ------------------------- 

module jkff ( output q, output qnot, 
              input j, input k, input clk ); 

reg q, qnot; 

always @( posedge clk ) 
begin 
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

module andGate (output s,
                input x, input y, input z);
assign s = x & y & z;
endmodule // andGate

module ram1x4 (output s1, output s2, output s3, output s4,
              input in1, input in2, input in3, input in4,
				  input addr, input rw, input clk);
andGate fox   (s0, addr, rw, clk);
jkff favorita (s1,p,in1,in1,s0);
jkff bilara   (s2,p,in2,in2,s0);
jkff domada   (s3,p,in3,in3,s0);
jkff gaia     (s4,p,in4,in4,s0);
endmodule // ram1x4

module ram1x8 (output s1, output s2, output s3, output s4,
               output s5, output s6, output s7, output s8,
               input in1, input in2, input in3, input in4,
					input in5, input in6, input in7, input in8,
				   input addr, input rw, input clk);
ram1x4 domada (s1,s2,s3,s4,in1,in2,in3,in4,addr,rw,clk);
ram1x4 bilara (s5,s6,s7,s8,in5,in6,in7,in8,addr,rw,clk);
endmodule // ram1x8

module test_RAM05;

reg addr, rw, clk;
reg a,b,c,d,e,f,g,h;
wire s1,s2,s3,s4,s5,s6,s7,s8;
wire i,j,k,l,m,n,o,p;
wire q,r,s,t,u,v,w,x;
wire y,z,ab,bb,cb,db,eb,fb;
wire ea,ebb,ec,ed,ee,ef,eg,eh;
wire ra,rb,rc,rd,re,rf,rg,rh;
wire ta,tb,tc,td,te,tf,tg,th;
wire ya,yb,yc,yd,ye,yf,yg,yh;

ram1x8 domada  (s1,s2,s3,s4,s5,s6,s7,s8,a,b,c,d,e,f,g,h,addr,rw,clk);
ram1x8 bilara  (i,j,k,l,m,n,o,p,a,b,c,d,e,f,g,h,addr,rw,clk);
ram1x8 gaia    (q,r,s,t,u,v,w,x,a,b,c,d,e,f,g,h,addr,rw,clk);
ram1x8 bonanza (y,z,ab,bb,cb,db,eb,fb,a,b,c,d,e,f,g,h,addr,rw,clk);
ram1x8 favorita(ea,ebb,ec,ed,ee,ef,eg,eh,a,b,c,d,e,f,g,h,addr,rw,clk);
ram1x8 pitanga (ra,rb,rc,rd,re,rf,rg,rh,a,b,c,d,e,f,g,h,addr,rw,clk);
ram1x8 oiara   (ta,tb,tc,td,te,tf,tg,th,a,b,c,d,e,f,g,h,addr,rw,clk);
ram1x8 rainha  (ya,yb,yc,yd,ye,yf,yg,yh,a,b,c,d,e,f,g,h,addr,rw,clk);

initial begin
	$display("RAM05 - Guilherme Terra - 427407");
	$display("Test memoria RAM 1x4");

	addr = 0; rw = 0; clk = 0; a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0;
#1	$display("\n%b %b %b %b %b %b %b %b",s1,s2,s3,s4,s5,s6,s7,s8);
	addr = 1; rw = 1; clk = 1; a = 1; b = 0; c = 1; d = 0; e = 1; f = 0; g = 1; h = 1;
#1	$display("\n%b %b %b %b %b %b %b %b",s1,s2,s3,s4,s5,s6,s7,s8);

end

endmodule // test_RAM05
