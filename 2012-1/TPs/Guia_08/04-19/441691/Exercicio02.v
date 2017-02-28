`include "clock.v"
module FlipflopD ( output q, output qnot, input d, input clk, input preset, input clear ); 
reg q, qnot; 
always @( posedge clk ) begin 
if(clear)
begin
q <= 0; qnot <= 1;
end

else
begin
 if(preset)
 begin
 q<=1; qnot<=0;
 end

 else
 begin 
 q <= d; qnot <= ~q; 
 end
end
end 
endmodule // dff 

module CPS4(output a, output b, output c, output d, input in, input clk);
wire qn0,qn1,qn2,qn3;
FlipflopD FPD1(d,qn0,c,clk,in,0);
FlipflopD FPD2(c,qn1,b,clk,in,0);
FlipflopD FPD3(b,qn2,a,clk,in,0);
FlipflopD FPD4(a,qn3,in,clk,in,0);
endmodule

module test_flip_flop;
reg x;
wire a,b,c,d,clock;
clock clk(clock);
CPS4 CPS4_1(a,b,c,d,x,clock);
initial begin
x=0;
$display("Guia 08 - Exercicio 02 - SHL2 - Gabriel Luiz M. G. Vieira ~ 441691");
//$display("S R Q0 Q1");
$display("D  Q0 Q1 Q2 Q3");
$monitor("%b  %b %b %b %b",x,d,c,b,a);
#12 x=1;
#12 x=1;
#12 x=0; 
#12 x=0;
#12 x=0;
#12 x=1; 
#12 x=1;
#24 $finish;
end
endmodule