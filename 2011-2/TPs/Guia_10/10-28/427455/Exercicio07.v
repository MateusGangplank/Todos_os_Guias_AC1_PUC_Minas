// FAVOR COLOCAR NOME E MATRICULA

module jkff ( output q, output qnot,
 input    j, input    k, input clk, input clear );
reg q, qnot;
initial
begin
q = 0;
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
jkff f1(y[1],,inp[1],~inp[1],x,clr);
jkff f2(y[2],,inp[2],~inp[2],x,clr);
jkff f3(y[3],,inp[3],~inp[3],x,clr);
and AND2(outp[0],y[0],addr);
and AND3(outp[1],y[1],addr);
and AND4(outp[2],y[2],addr);
and AND5(outp[3],y[3],addr);
endmodule

module RAM1x8(output[7:0] outp, input[7:0] inp , input rw , input addr , input clk , input clr);
RAM1x4 p1(outp[3:0],inp[3:0],rw,addr,clk,clr);
RAM1x4 p2(outp[7:4],inp[7:4],rw,addr,clk,clr);
endmodule

module dmx(output[3:0] outp , input inp, input[1:0] addr);
 reg[3:0] x;
 parameter         // state identifiers  
 start    = 2'b00, 
 id01      = 2'b01, 
 id10    = 2'b10, 
 id11  = 2'b11; 
always @(addr)
begin
case(addr)
start:
	x = 4'b1000;
id01:
	x = 4'b0100;
id10:
	x = 4'b0010;
id11:
	x = 4'b0001;
default:
	x = 4'bxxxx;
endcase	 					
end
assign outp = x;
endmodule


module mux(output[15:0] outp,input[15:0] i0,input[15:0] i1,input[15:0] i2,input[15:0] i3, input[1:0] addr);
reg[15:0] x;
parameter         // state identifiers  
 start    = 2'b00,
 id01      = 2'b01, 
 id10    = 2'b10, 
 id11  = 2'b11;
always @(addr or i0 or i1 or i2 or i3)
begin
case(addr)
start:
	x = i0;	
id01:
	x = i1;
id10:
	x = i2;
id11:
	x = i3;
default:
	x = 4'bxxxx;
endcase
end
assign outp = x;
endmodule

module RAM4x16(output[15:0] outp , input[15:0] inp, input rw, input[1:0] addr, input clk , input clr);
wire[3:0] x;
wire[15:0] i0;
wire[15:0] i1;
wire[15:0] i2;
wire[15:0] i3;
dmx d1(x,1,addr);
RAM1x8 pA1(i0[7:0],inp[7:0],rw,x[3],clk,clr);
RAM1x8 pA2(i0[15:8],inp[15:8],rw,x[3],clk,clr);
RAM1x8 pB1(i1[7:0],inp[7:0],rw,x[2],clk,clr);
RAM1x8 pB2(i1[15:8],inp[15:8],rw,x[2],clk,clr);
RAM1x8 pC1(i2[7:0],inp[7:0],rw,x[1],clk,clr);
RAM1x8 pC2(i2[15:8],inp[15:8],rw,x[1],clk,clr);
RAM1x8 pD1(i3[7:0],inp[7:0],rw,x[0],clk,clr);
RAM1x8 pD2(i3[15:8],inp[15:8],rw,x[0],clk,clr);
mux m1(outp,i0,i1,i2,i3,addr);
endmodule 

module Exercicio07;
wire[15:0] outp;
reg[15:0] inp;
reg rw;
reg[1:0] addr;
reg clk;
reg clr;
RAM4x16 p1(outp,inp,rw,addr,clk,clr);
initial
begin
// initial values
	addr = 2'b00;
	inp = 16'b0000000000000000;
	rw = 1;	
	clk = 1;
	clr = 0;	
// input signal changing
	#5 $display("TIME: %5d OUTP: %4b ADDR:%b",$time,outp,addr);
	addr = 2'b01;
	inp = 16'b0000000000000001;
	#5 $display("TIME: %5d OUTP: %4b ADDR:%b",$time,outp,addr);
	addr = 2'b10;
	inp = 16'b0000000000000010;
	#5 $display("TIME: %5d OUTP: %4b ADDR:%b",$time,outp,addr);
	addr = 2'b11;
	inp = 16'b0000000000000011;
	#5 $display("TIME: %5d OUTP: %4b ADDR:%b",$time,outp,addr);
	addr = 2'b00;
	rw = 0;
	#5 $display("TIME: %5d OUTP: %4b ADDR:%b",$time,outp,addr);
	addr = 2'b01;
	rw = 0;
	#5 $display("TIME: %5d OUTP: %4b ADDR:%b",$time,outp,addr);
	addr = 2'b10;
	rw = 0;
	#5 $display("TIME: %5d OUTP: %4b ADDR:%b",$time,outp,addr);
	addr = 2'b11;
	rw = 0;
	#5 $display("TIME: %5d OUTP: %4b ADDR:%b",$time,outp,addr);	
	#300 $finish;	
end
always
	#4 clk = ~clk;
endmodule