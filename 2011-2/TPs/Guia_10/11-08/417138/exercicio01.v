//----------------------------------------------
//--Luiz marques de Oliveira - 41713
//----------------------------------------------



`include "jkff.v"

module exercicio01(input aaddr,input brw,input cclk, input din, output s, input eclr);
reg addr,rw,clk,in01,in02,in03,clr;
wire s1,outs;

and And01(s1,addr,rw,clk);

jkff J01(q,qnot,s1,in00,clk);
jkff J02(q,qnot,s1,in01,clk);
jkff J03(q,qnot,s1,in02,clk);
jkff J04(q,qnot,s1,in03,clk);

and And02(outs,qnot,addr);

initial begin 
$display ( "Luiz Marques de Oliveira" );
$display ( "Exercicio01" ); 

addr = 0; 
clk = 0; 
rw = 0;
clr = 0; 

$monitor( "%4d %4b", $time, outs ); 

#1 clk = 0; addr = 0; rw = 1; 
#1 clk = 0; addr = 1; rw = 0;
#1 clk = 0; addr = 1; rw = 1;
#1 clk = 1; addr = 0; rw = 0;
#1 clk = 1; addr = 0; rw = 1;
#1 clk = 1; addr = 1; rw = 0;
#1 clk = 1; addr = 1; rw = 1;

end 

endmodule
