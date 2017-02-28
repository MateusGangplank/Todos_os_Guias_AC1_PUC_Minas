//--===========================
//--Exercicio 04
//--Aluna: Thais Mairink
//--Matricula: 441710
//--===========================

`include "clock.v"
module jkff ( output q, output qnot,input j, input k, input clk,input preset,input clear);

reg q, qnot;
always @( posedge clk )
begin
if(clear)
begin
q <= 0; qnot <= 1;
end
else
if(preset)
begin
q <= preset; qnot <= ~preset;
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
q <= qnot; qnot <= q;
end
end
endmodule // jkff
 
module test_JK;

wire q0,q1,q2,q3,qn0,qn1,qn2,qn3,qn4,qn5,z,y;
reg clk,x,clr,preset;

nand #4 NAND1(z,q0,qn1,q2,qn3,q4,qn5);
nand #1 NAND2(y,z,clr);
jkff jkff0(q0,qn0,x,x,clk,preset,y);
jkff jkff1(q1,qn1,x,x,qn0,preset,y);
jkff jkff2(q2,qn2,x,x,qn1,preset,y);
jkff jkff3(q3,qn3,x,x,qn2,preset,y);
jkff jkff4(q4,qn4,x,x,qn3,preset,y);
jkff jkff5(q ,qn5,x,x,qn4,preset,y);

initial
begin
 clk = 1;
 clr = 0;
 x = 0;
 preset = 0;
end

initial
begin 
$display ( "Aluno: Thais Mairink - 441710" );
$display ( " Time X q q4 q3 q2 q1 q0"); 
#5
clk = 0;
clk = 1; 
x = 0; clr = 1;
// input signal changing 
#10 x = 1;
//#10 x = 0; 
#10 x = 1; 
#20 x = 1;
#10 x = 1;
#10 x = 1; 
//#10 x = 0; 
#10 x = 1; 
#60 $finish; 
end // initial 
always 
#5 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%4d %2b %2b %2b %2b %2b %2b %2b", $time, x ,q, q4, q3,q2, q1, q0); 
end // always at positive edge clocking changing 
endmodule //module test