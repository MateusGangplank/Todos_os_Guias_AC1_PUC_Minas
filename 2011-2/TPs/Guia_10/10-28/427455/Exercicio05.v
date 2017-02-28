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
jkff f1(y[1],,inp[1],~inp[1],x,clr);
jkff f2(y[2],,inp[2],~inp[2],x,clr);
jkff f3(y[3],,inp[3],~inp[3],x,clr);
and AND2(outp[0],y[0],addr);
and AND3(outp[1],y[1],addr);
and AND4(outp[2],y[2],addr);
and AND5(outp[3],y[3],addr);
endmodule

module RAM1x8(output[7:0] outp, input[7:0] inp , input rw , input addr , input clk , input clr);
wire[7:0] y;
and AND0(k,clk,rw);
and AND1(x,k,addr);
jkff f0(y[0],,inp[0],~inp[0],x,clr);
jkff f1(y[1],,inp[1],~inp[1],x,clr);
jkff f2(y[2],,inp[2],~inp[2],x,clr);
jkff f3(y[3],,inp[3],~inp[3],x,clr);
jkff f4(y[4],,inp[4],~inp[4],x,clr);
jkff f5(y[5],,inp[5],~inp[5],x,clr);
jkff f6(y[6],,inp[6],~inp[6],x,clr);
jkff f7(y[7],,inp[7],~inp[7],x,clr);
and AND2(outp[0],y[0],addr);
and AND3(outp[1],y[1],addr);
and AND4(outp[2],y[2],addr);
and AND5(outp[3],y[3],addr);
and AND6(outp[4],y[4],addr);
and AND7(outp[5],y[5],addr);
and AND8(outp[6],y[6],addr);
and AND9(outp[7],y[7],addr);
endmodule

module dmx(output[7:0] outp , input inp, input[2:0] addr);
 reg[7:0] x;
 parameter         // state identifiers  
 start    = 3'b000, 
 id001      = 3'b001, 
 id010    = 3'b010, 
 id011  = 3'b011,
 id100  = 3'b100, 
 id101  = 3'b101, 
 id110  = 3'b110, 
 id111  = 3'b111;  
always @(addr)
begin
case(addr)
start:
	x = 8'b10000000;
id001:
	x = 8'b01000000;
id010:
	x = 8'b00100000;
id011:
	x = 8'b00010000;
id100:
	x = 8'b00001000;
id101:
	x = 8'b00000100;
id110:
	x = 8'b00000010;
id111:
	x = 8'b00000001;	
default:
	x = 8'bxxxx;
endcase	 					
end
assign outp = x;
endmodule


module mux(output[7:0] outp,input[7:0] i0,input[7:0] i1,input[7:0] i2,input[7:0] i3,input[7:0] i4,input[7:0] i5,input[7:0] i6,input[7:0] i7, input[2:0] addr);
reg[7:0] x;
parameter         // state identifiers  
 start    = 3'b000, 
 id001      = 3'b001, 
 id010    = 3'b010, 
 id011  = 3'b011,
 id100  = 3'b100, 
 id101  = 3'b101, 
 id110  = 3'b110, 
 id111  = 3'b111;  
always @(addr or i0 or i1 or i2 or i3 or i4 or i5 or i6 or i7)
begin
case(addr)
start:
	x = i0;
id001:
	x = i1;
id010:
	x = i2;
id011:
	x = i3;
id100:
	x = i4;
id101:
	x = i5;
id110:
	x = i6;
id111:
	x = i7;
default:
	x = 8'bxxxx;
endcase	 					
end
assign outp = x;
endmodule

module RAM8x8(output[7:0] outp , input[7:0] inp, input rw, input[2:0] addr, input clk , input clr);
wire[7:0] x;
wire[7:0] i0;
wire[7:0] i1;
wire[7:0] i2;
wire[7:0] i3;
wire[7:0] i4;
wire[7:0] i5;
wire[7:0] i6;
wire[7:0] i7;
dmx d1(x,1,addr);
RAM1x8 p0(i0,inp,rw,x[7],clk,clr);
RAM1x8 p1(i1,inp,rw,x[6],clk,clr);
RAM1x8 p2(i2,inp,rw,x[5],clk,clr);
RAM1x8 p3(i3,inp,rw,x[4],clk,clr);
RAM1x8 p4(i4,inp,rw,x[3],clk,clr);
RAM1x8 p5(i5,inp,rw,x[2],clk,clr);
RAM1x8 p6(i6,inp,rw,x[1],clk,clr);
RAM1x8 p7(i7,inp,rw,x[0],clk,clr);
mux m1(outp,i0,i1,i2,i3,i4,i5,i6,i7,addr);
endmodule
 

module Exercicio05;
wire[7:0] result;
reg[7:0] inp;
reg rw;
reg[2:0] addr;
reg clk;
reg clr;
RAM8x8 p1(result,inp,rw,addr,clk,clr);
initial
begin
// initial values
        inp = 8'b00000000;
        rw = 1;
        addr = 3'b000;
        clk = 0;
        clr = 0;
// input signal changing
	$monitor("TIME: %5d OUTP: %4b ADDRS:%b R/W:%b",$time,result,addr,rw);
	#10
        inp = 8'b00000001;
        rw = 1;
        addr = 3'b001;
        #10
        inp = 8'b00000010;
        rw = 1;
        addr = 3'b010;
        #10
        inp = 8'b00000011;
        rw = 1;
        addr = 3'b011;
        #10
        inp = 8'b00000100;
        rw = 1;
        addr = 3'b100;
        #10
        inp = 8'b00000101;
        rw = 1;
        addr = 3'b101;
        #10
        inp = 8'b00000110;
        rw = 1;
        addr = 3'b110;
        #10
        inp = 8'b00000111;
        rw = 1;
        addr = 3'b111;
        #10
        rw = 0;
        addr = 3'b000;
        #10
        rw = 0;
        addr = 3'b001;
        #10
        rw = 0;
        addr = 3'b010;
        #10
        rw = 0;
        addr = 3'b011;
        #10
        rw = 0;
        addr = 3'b100;
        #10
        rw = 0;
        addr = 3'b101;
        #10
        rw = 0;
        addr = 3'b110;
        #10
        rw = 0;
        addr = 3'b111;
	#300 $finish;	
end
always
	#4 clk = ~clk;
endmodule