//----------------------------------------------
//---Nome: Gabriel Benjamim de Carvalho
//---Matr�cula: 396690
//----------------------------------------------
`include "jkFF.v"



module ex4(input aaddr,input brw,input cclk, input din, output s, input eclr);

reg addr,rw,clk,in00,in01,in02,in03,in04,in05,in06,in07,clr;

wire s1,out0,out1,out2,out3,out4,out5,out6,out7;

and And01(s1,addr,rw,clk);


jkff J01(q,qnot,s1,in00,clk);
jkff J02(q,qnot,s1,in01,clk);
jkff J03(q,qnot,s1,in02,clk);
jkff J04(q,qnot,s1,in03,clk);
jkff J05(q,qnot,s1,in04,clk);
jkff J06(q,qnot,s1,in05,clk);
jkff J07(q,qnot,s1,in06,clk);
jkff J08(q,qnot,s1,in08,clk);


and And02(outs,qnot,addr);

endmodule


module ex5;

reg addr,rw,clk,in000,in001,in002,in003,in004,in005,in006,in007,clr;
wire s1,outs;


ex4 EX01(addr,rw,clk,in000,out0,clr);
ex4 EX02(addr,rw,clk,in001,out1,clr);
ex4 EX03(addr,rw,clk,in002,out2,clr);
ex4 EX04(addr,rw,clk,in003,out3,clr);
ex4 EX05(addr,rw,clk,in004,out4,clr);
ex4 EX06(addr,rw,clk,in005,out5,clr);
ex4 EX07(addr,rw,clk,in006,out6,clr);
ex4 EX08(addr,rw,clk,in007,out7,clr);


initial begin
$display ( "Guia 10 - Gabriel Benjamim de Carvalho - 396690" );
$display ( "Ex5 - Memoria RAM" );

addr = 0; 
clk = 0; 
rw = 0;
clr = 0; 


$monitor( "%4d %4b", $time, out7 ); 

#1 clk = 0; addr = 0; rw = 1; 
#1 clk = 0; addr = 1; rw = 0;
#1 clk = 0; addr = 1; rw = 1;
#1 clk = 1; addr = 0; rw = 0;
#1 clk = 1; addr = 0; rw = 1;
#1 clk = 1; addr = 1; rw = 0;
#1 clk = 1; addr = 1; rw = 1;

end 

endmodule

