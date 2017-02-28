//----------------------------------------------
//---Nome: Thaise Souto Martins - 395504
//---Guia 09
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

module Exercicio04(output a,output b,output c,output d);

reg um;
output [2:0]clk;
output[3:0]qnot;
reg pulse;
output q,q1,q2,q3,q4,q5,num,clock,q6;//num = não um

not Not01(q1,q);
not Not02(q3,q);
and And01(q5,q1,q2,q3,q4);
not Not04(num,um);
or OR01(q6,num,q5);

tff A01(q1,clk[0],um,qnot[0],um,q6);
tff A02(q2,clk[1],um,qnot[1],um,q6);
tff A03(q3,clk[2],um,qnot[2],um,q6);
tff A04(q4,qnot[3],um,qnot[3],um,q6);

initial begin 
$display ( "Guia 09 - Thaise Souto Martins - 395504" );
$display ( "Exercicio04 - Flip Flop" ); 

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