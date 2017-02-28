//-- Aluno: Filipe Viana de Miranda - 446415
//-- Exercicio05 ED9

module tff ( output q, output qnot,input t, input clk,input preset, input clear ); 

reg q, qnot; 

always @( posedge clk ) 
begin 
if ( clear ) 
begin 
q <= 0; qnot <= 1; 
end 
else 
if ( preset ) 
begin 
q <= 1; qnot <= 0; 
end 
else 
begin 
if ( t ) 
begin 
q <= 0; qnot <= t; 
end
else
begin
q <= 1; qnot <=0;
end 
end 
end 
endmodule // tff   

module test_JK;

wire q1,q2,q3,qn1,qn2,qn3,qn4,qn5,z,y;
reg clk,x,clear,preset;

and AND1(z,qn1,q2,qn3,qn4,qn5);
or OR1(y,z,clear);
tff tff1(q1,qn1,qn2,qn2,preset,y);
tff tff2(q2,qn2,qn3,qn3,preset,y);
tff tff3(q3,qn3,qn4,qn4,preset,y);
tff tff4(q4,qn4,qn5,qn5,preset,y);
tff tff5(q ,qn5,x,x,preset,y);

initial
begin 
$display ( "Aluno: Filipe Viana de Miranda - 446415" );
$display ( " Time X q1 q2 q3 q4 q"); 
clk = 1; 
x = 1; clear = 0;preset = 0;
// input signal changing 
#10 x = 1; clear = 0;
//#10 x = 0; 
#10 x = 1;
//#10 x = 0; 
#10 x = 1;
//#10 x = 0; 
#10 x = 1;
//#10 x = 0; 
#10 x = 1; 
#30 $finish; 
end // initial 
always 
#5 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%4d %2b %2b %2b %2b %2b %2b", $time, x ,q1,q2,q3,q4,q); 
end // always at positive edge clocking changing 
endmodule //module test