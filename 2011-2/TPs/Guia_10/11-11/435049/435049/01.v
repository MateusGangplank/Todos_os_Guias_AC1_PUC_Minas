// ------------------------- 
// --Memória RAM 1x4 
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049
// ------------------------- 
// --------------------------- 
// -- RAM 1X4 
// ---------------------------


//--FlipFlop JK
module jkff ( output q, output qnot, input j, input k, input jclk ); 
	reg q, qnot; 
	always @( posedge jclk ) 
	begin 
		if ( j & ~k ) 
		begin 
		q <= 1; qnot <= 0; 
	end 
	else 
	if ( ~j & k ) 
		begin 
		q <= 0; qnot <= 1; 
		end 
	else 
		if ( j & k ) 
		begin 
		q <= ~q; qnot <= ~qnot; 
		end 
	end 
endmodule // jkff 
//--Fim FlipFlop


module exer01(input dta,input brw,input clk01, output s);
reg dta02,rw,clk,a,b,c,clr;
wire s1,outs;

and and01(s1,dta02,rw,clk);

jkff J01(q,qnot,s1,a,jclk);
jkff J02(q,qnot,s1,a,jclk);
jkff J03(q,qnot,s1,b,jclk);
jkff J04(q,qnot,s1,c,jclk);

and and02(outs,q,dta02);

initial begin 
$display ( "Exercicio10 - Lorena Danielle Gonçalves Bento - 435049" );
$monitor($time, dta02,clk);

dta02 = 0; 
clk = 0; 
rw = 0;
clr = 0; 

$monitor( "%4d %4b", $time, outs ); 

#1 clk = 0; dta02 = 0; rw = 0; 
#1 clk = 1; dta02 = 1; rw = 0;
#1 clk = 0; dta02 = 1; rw = 0;
#1 clk = 1; dta02 = 0; rw = 0;
#1 clk = 1; dta02 = 0; rw = 0;
#1 clk = 1; dta02 = 1; rw = 0;


end 

endmodule

