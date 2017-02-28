//--===========================
//--Exercicio 03
//--Aluna: Thais Mairink
//--Matricula: 441710
//--===========================

`include "clock.v"
`include "ffjk.v"

module test_JK;

wire q0,q1,q2,q3,qn0, qn1,qn2,qn3,qn4,qn5,z,y;
reg clk,x;

and #50 AND1(z,q1,qn2,q3,qn4,q);
or OR1(y,z,~x);
ffjk JK0(q0,qn0,x,x,clk,y);
ffjk JK1(q1,qn1,x,x,qn0,y);
ffjk JK2(q2,qn2,x,x,qn1,y);
ffjk JK3(q3,qn3,x,x,qn2,y);
ffjk JK4(q4,qn4,x,x,qn3,y);
ffjk JK5(q ,qn5,x,x,qn4,y);

initial
begin 
$display ( "Aluno: Thais Mairink - 441710" );
$display ( " Time X q q4 q3 q2 q1 q0"); 
clk = 1; 
x = 0;
// input signal changing 
#10 x = 1;
//#10 x = 0; 
#10 x = 1; 
#20 x = 1; 
#10 x = 1; 
//#10 x = 1; 
//#10 x = 0; 
#10 x = 1; 
#30 $finish; 
end // initial 
always 
#5 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%4d %2b %2b %2b %2b %2b %2b %2b", $time, x ,q, q4, q3,q2, q1, q0); 
end // always at positive edge clocking changing 
endmodule //module test