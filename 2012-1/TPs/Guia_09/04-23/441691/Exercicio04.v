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

module CDU5(output a, output b, output c, output d, output e, input in, input clk, input clr);
wire qn0,qn1,qn2,qn3,qn4,pt0,pt1,n0,n2,n4;
not NOT2(n0,e);
not NOT3(n2,c);
not NOT4(n4,a);
nand NAND1(pt0,n0,d,n2,b,n4);
nand NAND2(pt1,clr,pt0);
FlipflopJK FPJK1(e,qn0,in,in,clk,pt1,0);
FlipflopJK FPJK2(d,qn1,in,in,qn0,pt1,0);
FlipflopJK FPJK3(c,qn2,in,in,qn1,pt1,0);
FlipflopJK FPJK4(b,qn3,in,in,qn2,pt1,0);
FlipflopJK FPJK5(a,qn4,in,in,qn3,pt1,0);
endmodule

module test_flip_flop;
reg x,clr;
wire a,b,c,d,e,clock;
clock clk(clock);
CDU5 CDU5_1(a,b,c,d,e,x,clock,clr);
initial begin
#12 clr=0;
#12 clr=1;
x=0;
$display("Guia 09 - Exercicio 04 - CDU - Gabriel Luiz M. G. Vieira ~ 441691");
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