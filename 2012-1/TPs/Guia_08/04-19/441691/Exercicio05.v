// FAVOR COLOCAR NOME E MATRICULA AQUI

`include "clock.v"
module FlipflopD ( output q, output qnot, input d, input clk, input preset, input clear ); 
reg q, qnot; 
always @( posedge clk ) 
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
endmodule // dff 

module CPS4(output a, output b, output c, output d, input[3:0] in, input clk, input LD);
wire qn0,qn1,qn2,qn3,i0,i1,i2,i3;
and AND1(i0,LD,in[0]);
and AND2(i1,LD,in[1]);
and AND3(i2,LD,in[2]);
and AND4(i3,LD,in[3]);
FlipflopD FPD1(d,qn0,0,clk,i0,0);
FlipflopD FPD2(c,qn1,d,clk,i1,0);
FlipflopD FPD3(b,qn2,c,clk,i2,0);
FlipflopD FPD4(a,qn3,b,clk,i3,0);
endmodule

module test_flip_flop;
reg [3:0] x;
reg y;
wire a,b,c,d,clock;
clock clk(clock);
CPS4 CPS4_1(a,b,c,d,x,clock,y);
initial begin
x=0000; y=0;
$display("Guia 08 - Exercicio 05 - CPS - Gabriel Luiz M. G. Vieira ~ 441691");
//$display("S R Q0 Q1");
$display("D LD  Q0 Q1 Q2 Q3");
$monitor("%b %b  %b %b %b %b",x,y,a,b,c,d);
#12 x=0001;
#12 x=0001; y=1;
#12 x=0100; 
#12 x=0010;
#12 x=1000; y=0;
#12 x=0111; 
#12 x=1111;
#24 $finish;
end
endmodule