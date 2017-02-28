// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// -------------------------
//`include "clock.v"
module FlipflopT ( output q, output qnot, 
input t, input clk, 
input preset, input clear ); 
reg q, qnot; 
always @( posedge clk ) 
begin 
if ( ~clear ) 
begin 
q <= 0; qnot <= ~q; 
end 
else 
if ( ~preset ) 
begin 
q <= 1; qnot <= ~q; 
end 
else 
begin 
if ( t ) 
begin 
q <= ~q; qnot <= ~q; 
end 
end 
end 
endmodule // tff 

module CM8(output a, output b, output c, output d, input in, input clr, input prst);
wire qn0,qn1,qn2,qn3,pt0,pt1;
and AND1(pt0,a,qn1,qn2,qn3);
or OR1(pt1,clr,pt0);
FlipflopT FPT1(a,qn0,qn1,qn1,prst,pt1);
FlipflopT FPT2(b,qn1,qn2,qn2,prst,pt1);
FlipflopT FPT3(c,qn2,qn3,qn3,prst,pt1);
FlipflopT FPT4(d,qn3,in,in,prst,pt1);
endmodule

module test_flip_flop;
reg x,clr,prst;
wire a,b,c,d;
//clock clk(clock);
CM8 CM8_1(a,b,c,d,x,clr,prst);
initial begin
#12 prst=1;
#12 prst=0;
#12 clr=1;
#12 clr=0;
x=0;
$display("Guia 09 - Exercicio 05 - CM8 - Gabriel Luiz M. G. Vieira ~ 441691");
$display("T   QN3 QN2 QN1 QN0");
$monitor("%b    %b   %b   %b   %b",x,a,b,c,d);
#12 x=1;
#12 x=0;
#12 x=1;
#12 x=0;
#12 x=1;
#12 x=0;
#12 x=1;
#12 x=0;
#12 x=1;
#12 x=0;
#12 x=1;
#36 $finish;
end
endmodule