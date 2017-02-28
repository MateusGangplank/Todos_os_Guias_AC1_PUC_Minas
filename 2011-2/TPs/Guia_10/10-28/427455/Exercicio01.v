module jkff ( output q, output qnot, 
 input    j, input    k, input clk, input clear );
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
     q <= 0;   qnot <= ~q;
     end
     else
    if ( j & ~k )
     begin
      q <= 1;   qnot <= 0; 
     end 
    else
      if ( ~j & k )
       begin 
        q <= 0;   qnot <= 1;
       end 
      else 
        if ( j & k ) 
         begin
          q <= ~q;   qnot <= ~qnot; 
         end
end 
 
endmodule // jkff

module RAM1x4(output[3:0] outp, input[3:0] inp , input rw , input addr , input clk , input clr);
wire[3:0] y;
and AND0(k,clk,rw);
and AND1(x,k,addr);
jkff f0(y[0],,inp[0],~inp[0],x,clr);
jkff f1(y[1],,inp[1],~inp[0],x,clr);
jkff f2(y[2],,inp[2],~inp[0],x,clr);
jkff f3(y[3],,inp[3],~inp[0],x,clr);
and AND2(outp[0],y[0],addr);
and AND3(outp[1],y[1],addr);
and AND4(outp[2],y[2],addr);
and AND5(outp[3],y[3],addr);
endmodule 

module Exercicio01;
wire[3:0] result;
reg[3:0] inp;
reg rw;
reg addr;
reg clk;
reg clr;
RAM1x4 p1(result,inp,rw,addr,clk,clr);
initial
begin
// initial values
	inp = 4'b1101;
	rw = 1;
	addr = 1;
	clk = 0;
	clr = 0;	
// input signal changing
	#1 $display("TIME: %5d OUTP: %4b",$time,result);
	#4 $display("TIME: %5d OUTP: %4b",$time,result);
	rw = 0;
	addr = 1;
	#5 $display("TIME: %5d OUTP: %4b",$time,result);
	addr = 0;
	#5 $display("TIME: %5d OUTP: %4b",$time,result);
	#300 $finish;	
end
always
	#4 clk = ~clk;
endmodule