`include "clock.v"
module FlipflopD ( output q, output qnot, input d, input clk ); 
reg q, qnot; 
always @( posedge clk ) 
begin 
q <= d; qnot <= ~q; 
end 
endmodule // dff 

module SHR4(output a, output b, output c, output d, input in, input clk);
wire qn0,qn1,qn2,qn3,W;
or OR1(W,d,in);
FlipflopD FPD1(a,qn0,W,clk);
FlipflopD FPD2(b,qn1,a,clk);
FlipflopD FPD3(c,qn2,b,clk);
FlipflopD FPD4(d,qn3,c,clk);
endmodule

module test_flip_flop;
reg x;
wire a,b,c,d,clock;
clock clk(clock);
SHR4 SHR4_1(a,b,c,d,x,clock);
initial begin
x=0;
$display("Guia 08 - Exercicio 04 - SHC - Gabriel Luiz M. G. Vieira ~ 441691");
//$display("S R Q0 Q1");
$display("D  Q0 Q1 Q2 Q3");
$monitor("%b  %b %b %b %b",x,d,c,b,a);
#12 x=1;
#12 x=1;
#12 x=0;
#12 x=0;
#24 $finish;
end
endmodule