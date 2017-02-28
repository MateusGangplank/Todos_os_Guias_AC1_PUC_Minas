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

module ACU5(output a, output b, output c, output d, output e, input in, input clk, input clr, input prst);
wire q0,q1,q2,q3,q4;
FlipflopJK FPJK1(q0,a,in,in,q1,clr,prst);
FlipflopJK FPJK2(q1,b,in,in,q2,clr,prst);
FlipflopJK FPJK3(q2,c,in,in,q3,clr,prst);
FlipflopJK FPJK4(q3,d,in,in,q4,clr,prst);
FlipflopJK FPJK5(q4,e,in,in,clk,clr,prst);
endmodule

module test_flip_flop;
reg x,clr, prst;
wire a,b,c,d,e,clock;
clock clk(clock);
ACU5 ACU5_1(a,b,c,d,e,x,clock,clr,prst);
initial begin
#12 prst=1;
#12 prst=0;
#12 clr=1;
#12 clr=0;
x=0;
$display("Guia 09 - Exercicio 02 - ACU - Gabriel Luiz M. G. Vieira ~ 441691");
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
#24 $finish;
end
endmodule