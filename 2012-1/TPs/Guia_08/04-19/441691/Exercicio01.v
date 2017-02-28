`include "clock.v"
module FlipflopD ( output q, output qnot, input d, input clk, input clear ); 
reg q, qnot; 
always @( posedge clk ) 
begin
if(clear) 
begin
q<=0; qnot<=1;
end
else
begin
q <= d; qnot <= ~q; 
end 
end
endmodule // dff 

module SHL4(output a, output b, output c, output d, input in, input clk);
wire qn0,qn1,qn2,qn3;
FlipflopD FPD1(d,qn0,in,clk,0);
FlipflopD FPD2(c,qn1,d,clk,0);
FlipflopD FPD3(b,qn2,c,clk,0);
FlipflopD FPD4(a,qn3,b,clk,0);
endmodule

module test_flip_flop;
reg x;
wire a,b,c,d,clock;
clock clk(clock);
SHL4 SHL4_1(a,b,c,d,x,clock);
initial begin
x=0;
$display("Guia 08 - Exercicio 01 - SHL - Gabriel Luiz M. G. Vieira ~ 441691");
//$display("S R Q0 Q1");
$display("D  Q0 Q1 Q2 Q3");
$monitor("%b  %b %b %b %b",x,a,b,c,d);
#12 x=1;
#12 x=1;
#12 x=0;
#12 x=1;
#24 $finish;
end
endmodule