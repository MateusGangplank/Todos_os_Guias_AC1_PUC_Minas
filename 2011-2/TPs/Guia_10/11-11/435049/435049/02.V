// ------------------------- 
// --Memória RAM 1x8 
// --Nome: Lorena Danielle Gonçalves Bento 
//--Matricula: 435049
// ------------------------- 
// --------------------------- 
// -- RAM 1X8
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


module exer1(input aaddr,input brw,input cclk, input din, output s, input clear01);
reg addr,rw,clk,aa,bb,cc,clr;
wire s1,outs;


jkff jkff1(q,qnot,s1,aa,clk);
jkff jkff2(q,qnot,s1,bb,clk);
jkff jkff3(q,qnot,s1,cc,clk);
jkff jkff4(q,qnot,s1,dd,clk);

and and01(s1,addr,rw,clk);
and and02(outs,qnot,addr);

endmodule

module exer2;
reg addr,rw,clk,aa,bb;
reg clr;
wire out01,out02;

exer1 EX01(addr,rw,clk,aa,out01,clr);
exer1 EX02(addr,rw,clk,bb,out02,clr);

initial begin 
$display ( "Guia 10 - Lorena Danielle Gonçalves Bento - 435049" );
$display ( "Exercicio02 - Memoria RAM" ); 

addr = 0; clk = 0; rw = 0; clr = 0; 

$monitor( "%4d %4b %4b", $time, out01, out02 ); 

#1 clk = 0; addr = 0; rw = 1; 
#2 clk = 0; addr = 1; rw = 0;
#3 clk = 0; addr = 1; rw = 1;
#1 clk = 1; addr = 0; rw = 0;
#1 clk = 1; addr = 0; rw = 1;
#1 clk = 1; addr = 1; rw = 0;
#1 clk = 1; addr = 1; rw = 1;

end 

endmodule

