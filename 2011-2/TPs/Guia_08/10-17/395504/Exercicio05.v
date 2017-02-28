//----------------------------------------------
//---Nome: Thaise Souto Martins - 395504
//---Guia 08
//----------------------------------------------
module dff ( output q, output qnot, input d, input clk ); 
reg q, qnot; 
always @( posedge clk ) 
begin 
q <= d; 
qnot <= ~q; 
end endmodule // dff 

module clk ( output clk ); 
reg clk; 
initial begin 
clk = 1'b0; 
end 
always 
begin 
#64 clk = ~clk; 
end 
endmodule // clk 

module Exercicio05;

wire a,b,c,d,e; 
wire q,q1;
wire qnot;
reg clk,ld,clr,d0,d1,d2,d3,d4;
output s1,s2,s3,s4,s5;

and AND01(s1,ld,d4);
and AND02(s2,ld,d3);
and AND03(s3,ld,d2);
and AND04(s4,ld,d1);
and AND05(s5,ld,d0);

dff D01(a,qnot,b,s1);
dff D02(b,qnot,c,s2);
dff D03(c,qnot,d,s3);
dff D04(d,qnot,e,s4);
dff D05(e,qnot,0,s5);

initial begin 
$display ( "Guia 08 - Thaise Souto Martins - 395504" );
$display ( "Exercicio05 - Flip Flop" ); 

// initial values 
clk = 0; 
clr = 0; 
ld = 0; 

$monitor( "%4d %b%b%b%b%b", $time,a,b,c,d,e ); 

#1 clk = 0; clr = 0; ld = 1; 
#1 clk = 0; clr = 1; ld = 0;
#1 clk = 0; clr = 1; ld = 1;
#1 clk = 1; clr = 0; ld = 0;
#1 clk = 1; clr = 0; ld = 1;
#1 clk = 1; clr = 1; ld = 0;
#1 clk = 1; clr = 1; ld = 1;
#6 $finish;
end 
endmodule