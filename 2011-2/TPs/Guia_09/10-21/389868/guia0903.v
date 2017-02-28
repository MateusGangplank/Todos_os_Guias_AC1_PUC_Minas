//----------------------------------------------
//--- Felipe Pacífico
//--- 389868
//--- guia0903
//----------------------------------------------

module tff ( output q, output qnot, input t, input clk, input clear, input preset ); 
reg q, qnot; 
always @( posedge clk ) 
begin 
if ( ~clear ) 
begin 
q <= 0; 
qnot <= ~q; 
end 
else 
	if ( ~preset ) 
	begin 
	q <= 1; 
	qnot <= ~q; 
	end 
	else 
	begin 
if ( t ) 
begin 
q <= ~q; 
qnot <= ~q; 
end 
	end 
		end 
endmodule // tff 

module Exercicio03(output a,output b,output c,output d);

reg um;
reg pulse;
output q,q1,q2,q3,q4,q5,num,clock,q6;//num = não um

not Not01(q1,q);
not Not02(q3,q);
and And01(q5,q1,q2,q3,q4);
not Not04(num,um);
or OR01(q6,num,q5);

tff A01(d,q1,um,pulse,um,q6);
tff A02(c,q2,um,d,um,q6);
tff A03(b,q3,um,c,um,q6);
tff A04(a,q4,um,b,um,q6);

initial begin 
$display ( "Felipe Pacifico" );
$display ( "guia0903 - Flip Flop" ); 

// initial values 
um = 0; 
pulse = 0; 

$monitor( "%4d %4b", $time, d );  
#1 um = 0; pulse = 1;
#1 um = 1; pulse = 0;
#1 um = 1; pulse = 1;

#6 $finish;
end 

endmodule