//----------------------------------------------
//---Nome: Jorge Luis dos Santos Leal
//---Guia 08
//----------------------------------------------
module dff ( output q, output qnot, input d, input clk ); 
reg q, qnot; 
always @( posedge clk ) 
begin 
q <= d; 
qnot <= ~q; 
end endmodule // dff 

module clock ( output clk ); 
reg clk; 
initial begin 
clk = 1'b0; 
end 
always 
begin 
#64 clk = ~clk; 
end 
endmodule // clock 

module Exercicio03;

wire a,b,c,d,e; 
wire q;
wire qnot;
reg clk,data,clr;
reg carga;
   
dff D01(a,qnot,data,carga);
dff D02(b,qnot,a,clr);
dff D03(c,qnot,b,clr);
dff D04(d,qnot,c,clr);
dff D05(e,qnot,d,clr);

initial begin 
$display ( "Guia 08 - Jorge Luis dos Santos Leal" );
$display ( "Exercicio03 - Flip Flop" ); 

// initial values 
carga = 1;
clk = 0; 
clr = 0; 
data = 0; 

$monitor( "%4d %b%b%b%b%b", $time,a,b,c,d,e ); 

#1 clk = 0; clr = 0; data = 1; 
#1 clk = 0; clr = 1; data = 0;
#1 clk = 0; clr = 1; data = 1;
#1 clk = 1; clr = 0; data = 0;
#1 clk = 1; clr = 0; data = 1;
#1 clk = 1; clr = 1; data = 0;
#1 clk = 1; clr = 1; data = 1;
#6 $finish;
end 
endmodule