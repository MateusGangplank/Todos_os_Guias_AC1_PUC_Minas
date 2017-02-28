// ------------------------- 
// --Memória RAM 4x8  
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049
// ------------------------- 
// --------------------------- 
// -- RAM 4x8 
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



module exer02(input dta021,input brw,input clk01, output s);
reg dta02,rw,clk,a,b,c,clr;
wire s1, outs;

and and01(s1,dta02,rw,clk);

jkff J01(q,qnot,s1,a,jclk);
jkff J02(q,qnot,s1,a,jclk);
jkff J03(q,qnot,s1,b,jclk);
jkff J04(q,qnot,s1,c,jclk);

and and02(outs,q,dta02);

endmodule

module exer03;

reg dta03,rw,clk,inA,inB,inC,inD;
wire outA,outB,outC,outD;

exer02 ex0210(clk,inA,outA,clr);
exer02 ex0211(dta03,rw,clk,outB);
exer02 ex0212(dta03,rw,clk,outC);
exer02 ex0213(dta03,rw,clk,outD);


initial begin 
$display ( "Exercicio10 - Lorena Danielle Gonçalves Bento - 435049" );
$monitor( "%4d %4b %4b", $time, outA, dta03 ); 

dta03 = 0; 
clk = 0; 
rw = 0;
 



#1 clk = 0; dta03 = 0; rw = 1; 
#1 clk = 0; dta03 = 1; rw = 0;
#1 clk = 0; dta03 = 1; rw = 1;
#1 clk = 1; dta03 = 0; rw = 0;
#1 clk = 1; dta03 = 0; rw = 1;
#1 clk = 1; dta03 = 1; rw = 0;
#1 clk = 1; dta03 = 1; rw = 1;

end 

endmodule