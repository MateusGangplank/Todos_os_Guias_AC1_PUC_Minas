// ------------------------- 
// --Memória RAM   
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049
// ------------------------- 
// --------------------------- 
// -- RAM  
// ---------------------------



//--FlipFlop JK
module jkff ( output q, output qnot, input j, input k, input clk ); 
	reg q, qnot; 
	always @( posedge clk ) 
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

module exer04(input dta041, input a1, input brw,input clk01, output s);
reg dta04, rw, clk, a, b,e, f, g, h, clr;
wire s1, outs;

and And01(s1,dta04,rw,clk);

jkff J01(q,qnot,s1,a,clk);
jkff J02(q,qnot,s1,b,clk);
jkff J03(q,qnot,s1,c,clk);
jkff J04(q,qnot,s1,d,clk);
jkff J05(q,qnot,s1,e,clk);
jkff J06(q,qnot,s1,f,clk);
jkff J07(q,qnot,s1,g,clk);
jkff J08(q,qnot,s1,h,clk);

and and02(outs,qnot,dta04);

endmodule

module exer05;
reg dta05,rw,clk,aa,bb,cc,dd,ee,ff,gg,hh,clr;
wire s1,outs;

exer04 ex042(dta05,rw,clk,aa,out0);
exer04 ex043(dta05,rw,clk,bb,out1);
exer04 ex044(dta05,rw,clk,cc,out2);
exer04 ex045(dta05,rw,clk,dd,out3);
exer04 ex046(dta05,rw,clk,ee,out4);
exer04 ex047(dta05,rw,clk,ff,out5);
exer04 ex048(dta05,rw,clk,gg,out6);
exer04 ex049(dta05,rw,clk,hh,out7);

initial begin 
$display ( "Exercicio10 - Lorena Danielle Gonçalves Bento - 435049" );

dta05 = 0; 
clk = 0; 
rw = 0;
clr = 0; 

$monitor( "%4d %4b", $time, out7 ); 

#1 clk = 0; dta05 = 0; rw = 1; 
#1 clk = 0; dta05 = 1; rw = 0;
#1 clk = 0; dta05 = 1; rw = 1;
#1 clk = 1; dta05 = 0; rw = 0;
#1 clk = 1; dta05 = 0; rw = 1;
#1 clk = 1; dta05 = 1; rw = 0;
#1 clk = 1; dta05 = 1; rw = 1;

end 

endmodule

