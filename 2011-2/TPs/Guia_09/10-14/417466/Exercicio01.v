//----------------------------------------------
//---Nome: Jorge Luis dos Santos Leal
//---Guia 09
//---10/2011
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

module Exercicio01(output a,output b,output c,output d);

reg um;
reg clk;
reg pulse;
output q;

tff A01(q,a,clk,um,b,um);
tff A02(q,b,clk,um,c,um);
tff A03(q,c,clk,um,d,um);
tff A04(q,d,clk,um,pulse,um);

initial begin 
$display ( "Guia 09 - Jorge Luis dos Santos Leal" );
$display ( "Exercicio01 - Flip Flop" ); 

// initial values 
clk = 0; 
um = 0; 
pulse = 0; 

$monitor( "%4d %4b", $time, d ); 

#1 clk = 0; um = 0; pulse = 1; 
#1 clk = 0; um = 1; pulse = 0;
#1 clk = 0; um = 1; pulse = 1;
#1 clk = 1; um = 0; pulse = 0;
#1 clk = 1; um = 0; pulse = 1;
#1 clk = 1; um = 1; pulse = 0;
#1 clk = 1; um = 1; pulse = 1;
#6 $finish;
end 

endmodule


