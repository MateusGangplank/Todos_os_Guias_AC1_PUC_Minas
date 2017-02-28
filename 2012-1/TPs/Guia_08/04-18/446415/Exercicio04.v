//-- Aluno: Filipe Viana de Miranda - 446415
//-- Exercicio04 ED8

module dff ( output q, output qnot,input d, input clk ); 

reg q, qnot; 

always @( posedge clk ) 
begin 
q <= d; qnot <= ~d; 
end 
endmodule // dff  

module test_d;
wire q1,q2,q3,qn1,qn2,qn3,qn4,y;
reg clk,x;

or OR1(y,x,q1);
dff dff1(q1,qn1,q2,clk);
dff dff2(q2,qn2,q3,clk);
dff dff3(q3,qn3,q,clk);
dff dff4(q ,qn4,y,clk);

initial
begin 
$display ( "Aluno: Filipe Viana de Miranda - 446415" );
$display ( " Time X q1 q2 q3 q"); 
clk = 1; 
x = 1;
// input signal changing 
//#10 x = 1; 
//#10 x = 0; 
//#10 x = 1; 
//#20 x = 1; 
//#10 x = 1; 
//#10 x = 1; 
#10 x = 0; 
//#10 x = 1; 
#70 $finish; 
end // initial 
always 
#5 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%4d %b %b %b %b %b", $time, x ,q1,q2,q3,q ); 
end // always at positive edge clocking changing 
endmodule //module test