//-- Aluno: Filipe Viana de Miranda - 446415
//-- Exercicio02 ED8

module dff ( output q, output qnot,input d, input clk, input preset,input clear ); 

reg q, qnot; 

always @( posedge clk )
if (clear)
begin 
q <= 0; qnot <= 1; 
end 
else
begin
	if(preset)
	begin 
	q <= 1; qnot <= 0; 
	end 
	else
	begin 
	q <= d; qnot <= ~d; 
	end 
end
 
endmodule // dff  

module test_d;
wire q1,q2,q3,qn1,qn2,qn3,qn4;
reg clk,x,preset,clear;

dff dff1(q1,qn1,q2,clk,x,0);
dff dff2(q2,qn2,q3,clk,x,0);
dff dff3(q3,qn3,q,clk,x,0);
dff dff4(q ,qn4,x,clk,x,0);

initial
begin 
$display ( "Aluno: Filipe Viana de Miranda - 446415" );
$display ( " Time X q1 q2 q3 q"); 
clk = 1; 
x = 0;
// input signal changing 
#10 x = 1; 
#10 x = 0;
//#10 x = 0; 
//#10 x = 1; 
//#20 x = 1; 
//#10 x = 1; 
//#10 x = 1; 
//#10 x = 0; 
//#10 x = 1; 
#30 $finish; 
end // initial 
always 
#5 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%4d %b %b %b %b %b", $time, x,q1,q2,q3,q ); 
end // always at positive edge clocking changing 
endmodule //module test