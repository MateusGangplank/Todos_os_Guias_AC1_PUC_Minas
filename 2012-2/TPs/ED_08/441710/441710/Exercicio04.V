//--===========================
//--Exercicio 04
//--Aluna: Thais Mairink
//--Matricula: 441710
//--===========================

module dff ( output q, output qnot,input d, input clk );

reg q, qnot; 

always @( posedge clk ) 
begin 
	q <= d; qnot <= ~d; 
end 
endmodule // dff  

module test_d;
wire q0,q1,q2,q3,qn0,qn1,qn2,qn3,qn4,y;
reg clk,x;

or OR1(y,x,q0);
dff dff0(q0,qn0,q1,clk);
dff dff1(q1,qn1,q2,clk);
dff dff2(q2,qn2,q3,clk);
dff dff3(q3,qn3,q,clk);
dff dff4(q ,qn4,y,clk);

initial
begin 
$display ( "Aluno:Thais Mairink - 441710" );
$display ( " Time X q0, q1 q2 q3 q"); 
clk = 1; 
x = 1; 
#10 x = 0; 
#70 $finish; 
end // initial 
always 
#5 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%4d %b  %b  %b  %b  %b  %b", $time, x,q0 ,q1,q2,q3,q ); 
end // always at positive edge clocking changing 
endmodule //module test