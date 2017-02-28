//----------------------------------------------
//---Nome: Jorge Luis dos Santos Leal
//---Guia 09
//---10/2011
//----------------------------------------------

module jkff ( output q, output qnot, input j, input k, input clk ); 
reg q, qnot; 
always @( posedge clk ) 
begin 
if ( j & ~k ) 
begin 
q <= 1; 
qnot <= 0; 
end 
else 
	if ( ~j & k ) 
	begin 
	q <= 0; 
	qnot <= 1; 
	end 
	else 
if ( j & k ) 
begin 
q <= ~q; 
qnot <= ~qnot; 
	end 
end 
endmodule // jkff 


module Exercicio05;

output a,b,c;
input clk;
reg clr;
reg pulso;
output[2:0]qnot;
output q,q1,q2,q3,q4,q5,clock;

not Not01(q3,q);
and And01(q4,q1,q2,q3);
or Or01(q5,clr,q4);

jkff J01(a,qnot[0],qnot[1],qnot[1],clk);
jkff J02(b,qnot[1],qnot[2],qnot[2],clk);
jkff J03(c,qnot[2],pulso,pulso,clk);

initial begin 
$display ( "Guia 09 - Jorge Luis dos Santos Leal" );
$display ( "Exercicio02 - Flip Flop" ); 

// initial values 
clr = 0; 
pulso = 0; 

$monitor( "%4d %4b", $time, c );  
#1 clr = 0; pulso = 0;
#1 clr = 0; pulso = 1;
#1 clr = 1; pulso = 0;
#1 clr = 1; pulso = 1;
#4 $finish;
end 

endmodule