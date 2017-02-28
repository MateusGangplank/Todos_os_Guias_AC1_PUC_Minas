// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// -------------------------
`include "clock.v"
module FlipflopJK ( output q, output qnot, 
input j, input k, input clk, input clear, input preset ); 
reg q, qnot; 
always @( posedge clk ) 
begin 
if(clear)
 begin
 q<=0; qnot<=1;
 end
else
if(preset)
 begin
 q<=1; qnot<=0;
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

module CDD5(output a, output b, output c, output d, output e, input in, input clk, input clr);
wire qn0,qn1,qn2,qn3,qn4,pt0,pt1,n0,n2,n4,ni;
not NOT1(ni,in);
not NOT2(n0,qn0);
not NOT3(n2,qn2);
not NOT4(n4,qn4);
and AND1(pt0,n0,qn1,n2,qn3,n4);
or OR1(pt1,ni,pt0);
FlipflopJK FPJK1(e,qn0,in,in,clk,clr,pt1);
FlipflopJK FPJK2(d,qn1,in,in,e,clr,pt1);
FlipflopJK FPJK3(c,qn2,in,in,d,clr,pt1);
FlipflopJK FPJK4(b,qn3,in,in,c,clr,pt1);
FlipflopJK FPJK5(a,qn4,in,in,b,clr,pt1);
endmodule

module test_flip_flop;
reg x,clr;
wire a,b,c,d,e,clock;
clock clk(clock);
CDD5 CDD5_1(a,b,c,d,e,x,clock,clr);
initial begin
#12 clr=1;
#12 clr=0;
x=0;
$display("Guia 09 - Exercicio 03 - CDD - Gabriel Luiz M. G. Vieira ~ 441691");
$display("JK  QN4 QN3 QN2 QN1 QN0");
$monitor("%b    %b   %b   %b   %b   %b",x,a,b,c,d,e);
#12 x=1;
#12 x=1;
#12 x=1;
#12 x=1;
#12 x=1;
#12 x=1;
#12 x=1;
#12 x=1;
#12 x=1;
#12 x=1;
#12 x=1;
#36 $finish;
end
endmodule