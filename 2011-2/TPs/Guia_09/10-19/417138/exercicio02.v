//--------------------------------
//---Nome: Luiz MArques de Oliveira
//---417138
//--------------------------------    


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

module Exercicio02(output a,output b,output c,output d);

reg um;
reg clk;
reg pulse;
output q,clock;

tff A01(q,a,clk,um,b,um);
tff A02(clock,b,clk,um,c,um);
tff A03(clock,c,clk,um,d,um);
tff A04(clock,d,clk,um,pulse,um);

initial begin 
$display ( "Luiz Marques 417138" );
$display ( "Guia 09 - Exercicio 02" );

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