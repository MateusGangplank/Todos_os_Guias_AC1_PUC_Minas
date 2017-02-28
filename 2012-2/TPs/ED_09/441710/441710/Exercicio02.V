//--===========================
//--Exercicio 02
//--Aluna: Thais Mairink
//--Matricula: 441710
//--===========================

`include "clock.v"
`include "ffjk.v"

module test_JK;

wire q1,q2,q3,qn1,qn2,qn3,qn4,qn5;
reg clk,x,y;

ffjk JK1 (q1,qn1,x,x,clk,y);
ffjk JK2(q2,qn2,qn1,qn1,qn1,y);
ffjk JK3(q3,qn3,qn2,qn2,qn2,y);
ffjk JK4(q4,qn4,qn3,qn3,qn3,y);
ffjk JK5(q ,qn5,qn4,qn4,qn4,y);

initial
begin 
$display ( "Aluno: Thais Mairink - 441710" );
$display ( " Time X q q4 q3 q2 q1"); 
clk = 1; 
x = 0;y = 1;
// input signal changing 
#10 x = 1; y = 0; 
#10 x = 1; 
#20 x = 1; 
#10 x = 1;  
#10 x = 1; 
#30 $finish; 
end // initial 
always 
#5 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%4d %2b %2b %2b %2b %2b %2b", $time, x ,q, q4, q3,q2, q1); 
end // always at positive edge clocking changing 
endmodule //module test