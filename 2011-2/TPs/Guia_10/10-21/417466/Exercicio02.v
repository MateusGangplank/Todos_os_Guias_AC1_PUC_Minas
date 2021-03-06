//----------------------------------------------
//---Nome: Jorge Luis dos Santos Leal
//---Guia 10
//---10/2011
//----------------------------------------------
`include "jkFF.v"

module exercicio01(input aaddr,input brw,input cclk, input din, output s, input eclr);
reg addr,rw,clk,in01,in02,in03,clr;
wire s1,outs;

and And01(s1,addr,rw,clk);

jkff J01(q,qnot,s1,in00,clk);
jkff J02(q,qnot,s1,in01,clk);
jkff J03(q,qnot,s1,in02,clk);
jkff J04(q,qnot,s1,in03,clk);

and And02(outs,qnot,addr);

endmodule

module exercicio02;
reg addr,rw,clk,in00,in01,in02,in03;
reg clr;
wire out01,out02;

exercicio01 EX01(addr,rw,clk,in00,out01,clr);
exercicio01 EX02(addr,rw,clk,in01,out02,clr);

initial begin 
$display ( "Guia 10 - Jorge Luis dos Santos Leal" );
$display ( "Exercicio02 - Memoria RAM" ); 

addr = 0; 
clk = 0; 
rw = 0;
clr = 0; 

$monitor( "%4d %4b %4b", $time, out01, out02 ); 

#1 clk = 0; addr = 0; rw = 1; 
#1 clk = 0; addr = 1; rw = 0;
#1 clk = 0; addr = 1; rw = 1;
#1 clk = 1; addr = 0; rw = 0;
#1 clk = 1; addr = 0; rw = 1;
#1 clk = 1; addr = 1; rw = 0;
#1 clk = 1; addr = 1; rw = 1;

end 

endmodule

