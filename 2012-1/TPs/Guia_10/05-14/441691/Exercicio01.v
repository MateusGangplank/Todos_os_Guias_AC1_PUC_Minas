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

RAM1x1 Rx1 (out[0],addr,rw,clk,in[0],clr);
RAM1x1 Rx2 (out[1],addr,rw,clk,in[1],clr);
RAM1x1 Rx3 (out[2],addr,rw,clk,in[2],clr);
RAM1x1 Rx4 (out[3],addr,rw,clk,in[3],clr);

endmodule

module test_1x4;
reg a,r,clr;
reg [3:0] i;
wire clock;
wire [3:0] o;

clock clk(clock);

RAM1x4 test(o,a,r,clock,i,clr);
initial begin
#6 clr=1;
#6 clr=0;
a=0; r=0; i=0000;
$display("Guia 10 - Exercicio 01 - RAM 1x4 - Gabriel Luiz M. G. Vieira ~ 441691");
$display("ADDR  RW CLK    IN    OUT");
$monitor(" %b    %b   %b    %b   %b",a,r,clock,i,o);
#6 a=0; r=0; i=0001;
#6 a=0; r=1; i=0010;
#6 a=1; r=1; i=0011;
#6 a=1; r=1; i=0100;
#6 a=1; r=0; i=0101;
#6 a=0; r=0; i=0110;
#6 a=1; i=0000;
#6 a=1; clr=1;
#6 a=1; clr=0;
#6 a=0;
#3 $finish;
end
endmodule