// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 

`include "clock.v"

module FFJK(output q, output qnot, input j, input k,input clk, input clr);
reg q, qnot; 
always @( posedge clk ) 
begin
 if(clr)
  begin
  q <= 0; qnot <= 1;
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
endmodule

module RAM1x1(output out, input addr, input rw, input clk, input in, input clr);
wire k,c,q,qnot,out;

and AND1(c,addr,rw,clk);
not NOT1(k,in);
FFJK JK1(q,qnot,in,k,c,clr);
and AND2(out,addr,q);
endmodule

module RAM1x4(output [3:0] out, input addr, input rw, input clk, input [3:0] in, input clr);

RAM1x1 R1x1 (out[0],addr,rw,clk,in[0],clr);
RAM1x1 R1x2 (out[1],addr,rw,clk,in[1],clr);
RAM1x1 R1x3 (out[2],addr,rw,clk,in[2],clr);
RAM1x1 R1x4 (out[3],addr,rw,clk,in[3],clr);

endmodule


module mux(output [3:0] s, input [3:0] a, input [3:0] b, input addr, input clk);
reg [3:0] s;

always @ (posedge clk)
begin
if(addr)
begin
s <= b;
end
else
begin
s <= a;
end
end

endmodule


module dmux(output s0, output s1, input addr,input clk);
reg s0,s1;

always @ (posedge clk)
begin
if(addr)
begin
s0 <= 0; s1 <= 1;
end
else
begin
s0 <= 1; s1 <= 0;
end
end

endmodule

module RAM2x4(output [3:0] out, input addr, input rw, input clk, input [3:0] in, input clr);
wire [3:0]a,b;
wire dmx0,dmx1;

dmux DMX1(dmx0,dmx1,addr,clk);
RAM1x4 R4x1(a,dmx0,rw,clk,in,clr); 
RAM1x4 R4x2(b,dmx1,rw,clk,in,clr);
mux MUX1(out,a,b,addr,clk);

endmodule

module RAM1x8(output [7:0] out, input addr, input rw, input clk, input [7:0] in, input clr);

RAM1x4 R4x1 (out[7:4],addr,rw,clk,in[7:4],clr);
RAM1x4 R4x2 (out[3:0],addr,rw,clk,in[3:0],clr);

endmodule


module test_1x8;
reg a,r,clr;
reg [7:0] i;
wire clock;
wire [7:0] o;

clock clk(clock);

RAM1x8 test(o,a,r,clock,i,clr);
initial begin
#6 clr=1;
#6 clr=0;
a=0; r=0; i=8'b00000000;
$display("Guia 10 - Exercicio 03 - RAM 1x8 - Gabriel Luiz M. G. Vieira ~ 441691");
$display("ADDR  RW CLK      IN       OUT");
$monitor(" %b    %b   %b    %b   %b",a,r,clock,i,o);
#6 a=0; r=0; i=8'b00110001;
#6 a=0; r=1; i=8'b11001010;
#6 a=0; r=1; i=8'b00110101;
#6 a=1; r=1; i=8'b11001010;
#6 a=1; r=0; i=8'b01010101;
#12 a=0; i=8'b00000000;
#12 a=1; i=8'b00000000;
#6 a=1; clr=1;
#6 a=0;
#6 a=0; clr=0;
#3 $finish;
end
endmodule